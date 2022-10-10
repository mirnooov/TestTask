#ifndef COMMON
#define COMMON

//----------------------------------------------------
//Include
#include "UnityCG.cginc"
#include "UnityStandardBRDF.cginc"
#include "Utility/Packing.cginc"
#include "Utility/Fibonacci.cginc"

//----------------------------------------------------
//Defines
#define PI          3.14159265359
#define TWO_PI      6.28318530718
#define FOUR_PI     12.56637061436
#define INV_PI      0.31830988618
#define INV_TWO_PI  0.15915494309
#define INV_FOUR_PI 0.07957747155
#define HALF_PI     1.57079632679
#define INV_HALF_PI 0.636619772367

//NOTE: These values should be 1-1 with what is defined in SssConstants.
//      Typically done with code generation but for now, manually set and placed here.
#define SSS_N_PROFILES           (8)
#define SSS_NEUTRAL_PROFILE_ID   (7)
#define SSS_N_SAMPLES_NEAR_FIELD (55)
#define SSS_N_SAMPLES_FAR_FIELD  (21)
#define SSS_LOD_THRESHOLD        (4)
#define SSS_TRSM_MODE_NONE       (0)
#define SSS_TRSM_MODE_THIN       (1)
#define SSS_BASIC_N_SAMPLES      (25)
#define SSS_BASIC_DISTANCE_SCALE (3)

//----------------------------------------------------
//Inputs

uint   _TexturingModeFlags;                 // 1 bit/profile; 0 = PreAndPostScatter, 1 = PostScatter
uint   _TransmissionFlags;                  // 2 bit/profile; 0 = inf. thick, 1 = thin, 2 = regular
float  _ThicknessRemaps[SSS_N_PROFILES][2]; // Remap: 0 = start, 1 = end - start
float4 _ShapeParams[SSS_N_PROFILES];        // RGB = S = 1 / D, A = filter radius
float4 _TransmissionTints[SSS_N_PROFILES];  // RGB = color, A = unused


sampler2D _ThicknessMap;
sampler2D _SubsurfaceRadiusMap;
int   _SubsurfaceProfile;
float _SubsurfaceRadius;
float _Thickness;

float4x4 _InvProjMatrix;

//----------------------------------------------------
//Structs

struct ProceduralAttributes
{
    uint vertexID : SV_VertexID;
};

struct ProceduralVaryings
{
    float4 positionCS : SV_Position;
};

struct PositionInputs
{
    float2 positionSS;
    uint2  unPositionSS;
    uint2  unTileCoord;
    float  depthRaw;
    float  sdepthVS;
    float3 positionWS;
};

struct SilkData{
    float3 tangentWS;
    float3 bitangentWS;
    float roughnessT;
    float roughnessB;
};

//----------------------------------------------------
//Helpers

#define TEXTURE2D(textureName) Texture2D textureName
#define LOAD_TEXTURE2D(textureName, unCoord2) textureName.Load(int3(unCoord2, 0))

float GetThickness(float2 uv){
    float thickness = _Thickness;
#ifdef _THICKNESSMAP
    thickness *= tex2D(_ThicknessMap, uv).r;
#endif

    thickness = (_ThicknessRemaps[_SubsurfaceProfile][0] +
                 _ThicknessRemaps[_SubsurfaceProfile][1] * thickness);

    return thickness;
}

float GetSubsurfaceRadius(float2 uv){
	float radius = _SubsurfaceRadius;
#ifdef _SUBSURFACE_RADIUS_MAP
	radius *= tex2D(_SubsurfaceRadiusMap, uv).g;
#endif
	return radius;
}

bool IsBitSet(uint data, uint bitPos)
{
    return BitFieldExtract(data, 1u, bitPos) != 0;
}

float4 GetFullScreenTriangleVertexPosition(uint vertexID)
{
    float2 uv = float2((vertexID << 1) & 2, vertexID & 2);
    return float4(uv * 2.0 - 1.0, 1.0, 1.0);
}

ProceduralVaryings VertProcedural(ProceduralAttributes input)
{
    ProceduralVaryings output;
    output.positionCS = GetFullScreenTriangleVertexPosition(input.vertexID);
    return output;
}

// This function is use to provide an easy way to sample into a screen texture, either from a pixel or a compute shaders.
// This allow to easily share code.
// If a compute shader call this function unPositionSS is an integer usually calculate like: uint2 unPositionSS = groupId.xy * BLOCK_SIZE + groupThreadId.xy
// else it is current unormalized screen coordinate like return by SV_Position
PositionInputs GetPositionInput(float2 unPositionSS, float2 invScreenSize, uint2 unTileCoord)   // Specify explicit tile coordinates so that we can easily make it lane invariant for compute evaluation.
{
    PositionInputs posInput = (PositionInputs)0;
    posInput.positionSS = unPositionSS;
    posInput.positionSS *= invScreenSize; //TODO: screenparams not correct
    posInput.unPositionSS = uint2(unPositionSS);
    posInput.unTileCoord = unTileCoord;
    return posInput;
}

// It may be necessary to flip the Y axis as the origin of the screen-space coordinate system
// of Direct3D is at the top left corner of the screen, with the Y axis pointing downwards.
float3 ComputeViewSpacePosition(float2 positionSS, float depthRaw, float4x4 invProjMatrix, bool flipY = false)
{
	float2 screenSpacePos;
	screenSpacePos.x = positionSS.x;
	screenSpacePos.y = flipY ? 1.0 - positionSS.y : positionSS.y;
	float4 positionCS = float4(screenSpacePos * 2.0 - 1.0, depthRaw, 1.0);
	float4 positionVS = mul(invProjMatrix, positionCS);
	// The view space uses a right-handed coordinate system.
	positionVS.z = -positionVS.z; 
	return positionVS.xyz / positionVS.w;
}

// Does not handle TIR.
float F_Transm_Schlick(float f0, float f90, float u)
{
    float x  = 1.0 - u;
    float x2 = x * x;
    float x5 = x * x2 * x2;
    return (1.0 - f90 * x5) - f0 * (1.0 - x5);  // sub mul mul mul mad sub mad
}

// Does not handle TIR.
float3 F_Transm_Schlick(float3 f0, float u)
{
    return F_Transm_Schlick(f0, 1.0, u);        // sub mul mul mad mad*3
}

// Computes the fraction of light passing through the object.
// Evaluate Int{0, inf}{2 * Pi * r * R(sqrt(r^2 + d^2))}, where R is the diffusion profile.
// Ref: Approximate Reflectance Profiles for Efficient Subsurface Scattering by Pixar (BSSRDF only).
float3 ComputeTransmittance(float3 S, float3 volumeAlbedo, float thickness, float radiusScale)
{
    // Thickness and SSS radius are decoupled for artists.
    // In theory, we should modify the thickness by the inverse of the radius scale of the profile.
    // thickness /= radiusScale;

    float3 expOneThird = exp(((-1.0 / 3.0) * thickness) * S);

    return 0.25 * (expOneThird + 3 * expOneThird * expOneThird * expOneThird) * volumeAlbedo;
}

void Transmission(inout half3 diffuse,
                  float thickness, float radius,
                  half shadow, half atten, float NdotL,
                  half3 lightColor, half3 diffuseColor)
{
    uint transmissionMode = BitFieldExtract(_TransmissionFlags, 2u, 2u * _SubsurfaceProfile);

    bool enableTransmission = transmissionMode != SSS_TRSM_MODE_NONE;

    if(enableTransmission){ 
        bool useThinObjectMode  = transmissionMode == SSS_TRSM_MODE_THIN;

        float illuminance = F_Transm_Schlick(0.028, saturate(-NdotL)) * atten;
        shadow = useThinObjectMode ? shadow : 1;
        illuminance *= shadow;

        float3 backLight = lightColor * illuminance;
        float3 transmittedLight = backLight * (diffuseColor * ComputeTransmittance(_ShapeParams[_SubsurfaceProfile].rgb,
                                                                                   _TransmissionTints[_SubsurfaceProfile].rgb,
                                                                                   thickness, radius));

        diffuse += transmittedLight;
    }
}

void DoubleSided(bool isFrontFace, inout half4 tbn[3], inout float4 texcoords){
    if(isFrontFace){
#ifdef _HAS_BACKFACE_TEXTURE_SET
        texcoords.x *= 0.5; //Scale and shift UVs to properly sample packed textures
#endif
    } else {
#ifdef _HAS_BACKFACE_TEXTURE_SET
        texcoords.x *= 0.5;
        texcoords.x += 0.5; 
        //TODO: texcoords.zw
#endif

        //Flip the TBN in case of a backface, for proper lighting.
        tbn[1] *= -1;
        tbn[2] *= -1;
    }
}

// Ref: http://blog.selfshadow.com/publications/s2012-shading-course/burley/s2012_pbs_disney_brdf_notes_v3.pdf (in addenda)
// Convert anisotropic ratio (0->no isotropic; 1->full anisotropy in tangent direction) to roughness
void ConvertAnisotropyToRoughness(float roughness, float anisotropy, out float roughnessT, out float roughnessB)
{
    // (0 <= anisotropy <= 1), therefore (0 <= anisoAspect <= 1)
    // The 0.9 factor limits the aspect ratio to 10:1.
    float anisoAspect = sqrt(1.0 - 0.9 * anisotropy);

    roughnessT = roughness / anisoAspect; // Distort along tangent (rougher)
    roughnessB = roughness * anisoAspect; // Straighten along bitangent (smoother)
}

void FillSilkData(inout SilkData o_sd, half3 normal, half3 vertexTangent, float smoothness){
    //Orthonormalize the basis vectors using Gram-Schmidt process
    o_sd.tangentWS   = normalize(vertexTangent - dot(vertexTangent, normal) * normal);
    o_sd.bitangentWS = cross(normal, o_sd.tangentWS);

    float perceptualRoughness = SmoothnessToPerceptualRoughness(smoothness);
    float roughness = PerceptualRoughnessToRoughness(perceptualRoughness);

    ConvertAnisotropyToRoughness(roughness, 0.9, o_sd.roughnessT, o_sd.roughnessB);
}

#endif //COMMON