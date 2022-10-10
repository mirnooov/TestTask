#ifndef EYE_CGINC
#define EYE_CGINC

#include "UnityStandardBRDF.cginc"

#define EYE_REFRACTION i.tex.xy += \
        PhysicallyBasedRefraction(i.tex, -NormalizePerPixelNormal(i.eyeVec), i.tangentToWorldAndPackedData);

#define EYE_REFRACTION_FWDADD i.tex.xy += \
        PhysicallyBasedRefraction(i.tex, -NormalizePerPixelNormal(i.eyeVec), i.tangentToWorldAndLightDir);

sampler2D _EyeMask;
float3 _EyeColorBleed;

float _EyeScleraDiffuseAdditiveIntensity;
float _EyeIrisDiffuseAdditiveIntensity;

float3 _EyeLookVector;
float3 _EyeFaceVector;
float3 _EyeFaceVectorUp;
float3 _EyeFaceVectorRight;

float _EyeFixedTexCoordX;
float _EyeFixedTexCoordY;
float _EyeFixedTexCoordZ;

float _EyeReflectionIntensity;
float _EyeRadius;
float _EyeAnteriorChamberDepth;
float _EyeIOR;
float _EyeScleraWrap;
float _EyeLimbusShift;
float _EyeLimbusSlope;

float Sigmoid(float x){
    return 1.0 / (1.0 + exp(-(x-_EyeLimbusShift)/_EyeLimbusSlope));
}

half3 ColorBleedAO(half occlusion){
    return pow(occlusion, 1.0 - _EyeColorBleed.rgb);
}

float EyeMask(float2 texcoord){
    return tex2D(_EyeMask, texcoord);
}

float2 PhysicallyBasedRefraction(float4 texcoords, float3 viewW, half4 tangentToWorld[3])
{
    half3 normal = normalize(tangentToWorld[2].xyz);

    float height = _EyeAnteriorChamberDepth * saturate(1.0 - 18.4 * _EyeRadius * _EyeRadius);

    //Calculate Refraction
    float w = _EyeIOR * dot(normal, viewW);
    float k = sqrt(1.0 + (w - _EyeIOR) * (w + _EyeIOR));
    float3 refractedW = (w - k) * normal - _EyeIOR * viewW; 

    float cosAlpha = dot(_EyeLookVector, -refractedW);
    float dist = height / cosAlpha;
    float3 offsetW = dist * refractedW;

    //NOTE: Right now the effect is correct when multiplying by the model matrix, and negating the look vector.
    //      Mathematically, we should be transforming the offset into texture space.
    float2 offsetT = mul(offsetW, (float3x3)unity_ObjectToWorld);

    float mask = 1 - tex2D(_ParallaxMap, texcoords.xy);
    return float2(mask, mask) * offsetT;
}

void IrisBRDF (half3 diffColor, half3 specColor, half oneMinusReflectivity, half smoothness,
    half3 normal, half3 viewDir,
    UnityLight light, UnityIndirect gi,
    inout half3 diffuse)
{
    half perceptualRoughness = SmoothnessToPerceptualRoughness (smoothness);
    half3 halfDir = Unity_SafeNormalize (light.dir + viewDir);

// NdotV should not be negative for visible pixels, but it can happen due to perspective projection and normal mapping
// In this case normal should be modified to become valid (i.e facing camera) and not cause weird artifacts.
// but this operation adds few ALU and users may not want it. Alternative is to simply take the abs of NdotV (less correct but works too).
// Following define allow to control this. Set it to 0 if ALU is critical on your platform.
// This correction is interesting for GGX with SmithJoint visibility function because artifacts are more visible in this case due to highlight edge of rough surface
// Edit: Disable this code by default for now as it is not compatible with two sided lighting used in SpeedTree.
#define UNITY_HANDLE_CORRECTLY_NEGATIVE_NDOTV 0

#if UNITY_HANDLE_CORRECTLY_NEGATIVE_NDOTV
    // The amount we shift the normal toward the view vector is defined by the dot product.
    half shiftAmount = dot(normal, viewDir);
    normal = shiftAmount < 0.0f ? normal + viewDir * (-shiftAmount + 1e-5f) : normal;
    // A re-normalization should be applied here but as the shift is small we don't do it to save ALU.
    //normal = normalize(normal);

    half nv = saturate(dot(normal, viewDir)); // TODO: this saturate should no be necessary here
#else
    half nv = abs(dot(normal, viewDir));    // This abs allow to limit artifact
#endif

    half nl = saturate(dot(normal, light.dir));

    half lh = saturate(dot(light.dir, halfDir));

    // Diffuse term
    half diffuseTerm = DisneyDiffuse(nv, nl, lh, perceptualRoughness) * nl;

    //Modulate the cos
    float dot1 = (nl + 0.7);
    float dot2 = (saturate(dot(light.dir, _EyeLookVector)) + 0.7);
    float bump = max(dot1 / max(dot2, 1e-1), 0.0);
    gi.diffuse *= bump * bump;

    half grazingTerm = saturate(smoothness + (1-oneMinusReflectivity));
    diffuse = diffColor * (gi.diffuse + light.color * diffuseTerm);
}

void ScleraBRDF (half3 diffColor, half3 specColor, half oneMinusReflectivity, half smoothness,
    half3 normal, half3 viewDir,
    UnityLight light, UnityIndirect gi,
    inout half3 diffuse, inout half3 specular)
{
    half perceptualRoughness = SmoothnessToPerceptualRoughness (smoothness);
    half3 halfDir = Unity_SafeNormalize (light.dir + viewDir);

// NdotV should not be negative for visible pixels, but it can happen due to perspective projection and normal mapping
// In this case normal should be modified to become valid (i.e facing camera) and not cause weird artifacts.
// but this operation adds few ALU and users may not want it. Alternative is to simply take the abs of NdotV (less correct but works too).
// Following define allow to control this. Set it to 0 if ALU is critical on your platform.
// This correction is interesting for GGX with SmithJoint visibility function because artifacts are more visible in this case due to highlight edge of rough surface
// Edit: Disable this code by default for now as it is not compatible with two sided lighting used in SpeedTree.
#define UNITY_HANDLE_CORRECTLY_NEGATIVE_NDOTV 0

#if UNITY_HANDLE_CORRECTLY_NEGATIVE_NDOTV
    // The amount we shift the normal toward the view vector is defined by the dot product.
    half shiftAmount = dot(normal, viewDir);
    normal = shiftAmount < 0.0f ? normal + viewDir * (-shiftAmount + 1e-5f) : normal;
    // A re-normalization should be applied here but as the shift is small we don't do it to save ALU.
    //normal = normalize(normal);

    half nv = saturate(dot(normal, viewDir)); // TODO: this saturate should no be necessary here
#else
    half nv = abs(dot(normal, viewDir));    // This abs allow to limit artifact
#endif

    half nl = saturate(dot(normal, light.dir));
    half nh = saturate(dot(normal, halfDir));

    half lv = saturate(dot(light.dir, viewDir));
    half lh = saturate(dot(light.dir, halfDir));

    // Diffuse term
    float n = 1;
    half diffuseTerm = pow(saturate((dot(normal, light.dir) + _EyeScleraWrap) / (1.0f + _EyeScleraWrap)), n) * (n + 1) / (2 * (1 + _EyeScleraWrap));

    // Specular term
    // HACK: theoretically we should divide diffuseTerm by Pi and not multiply specularTerm!
    // BUT 1) that will make shader look significantly darker than Legacy ones
    // and 2) on engine side "Non-important" lights have to be divided by Pi too in cases when they are injected into ambient SH
    half roughness = PerceptualRoughnessToRoughness(perceptualRoughness);
#if UNITY_BRDF_GGX
    half V = SmithJointGGXVisibilityTerm (nl, nv, roughness);
    half D = GGXTerm (nh, roughness);
#else
    // Legacy
    half V = SmithBeckmannVisibilityTerm (nl, nv, roughness);
    half D = NDFBlinnPhongNormalizedTerm (nh, PerceptualRoughnessToSpecPower(perceptualRoughness));
#endif

    half specularTerm = V*D * UNITY_PI; // Torrance-Sparrow model, Fresnel is applied later

#   ifdef UNITY_COLORSPACE_GAMMA
        specularTerm = sqrt(max(1e-4h, specularTerm));
#   endif

    // specularTerm * nl can be NaN on Metal in some cases, use max() to make sure it's a sane value
    specularTerm = max(0, specularTerm * nl);
#if defined(_SPECULARHIGHLIGHTS_OFF)
    specularTerm = 0.0;
#endif

    // surfaceReduction = Int D(NdotH) * NdotH * Id(NdotL>0) dH = 1/(roughness^2+1)
    half surfaceReduction;
#   ifdef UNITY_COLORSPACE_GAMMA
        surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;      // 1-0.28*x^3 as approximation for (1/(x^4+1))^(1/2.2) on the domain [0;1]
#   else
        surfaceReduction = 1.0 / (roughness*roughness + 1.0);           // fade \in [0.5;1]
#   endif

    // To provide true Lambert lighting, we need to be able to kill specular completely.
    specularTerm *= any(specColor) ? 1.0 : 0.0;

    half grazingTerm = saturate(smoothness + (1-oneMinusReflectivity));
    diffuse  =  diffColor * (gi.diffuse + light.color * diffuseTerm);
    specular =  specularTerm * light.color * FresnelTerm (specColor, lh)
             + surfaceReduction * (gi.specular * (1 + (_EyeReflectionIntensity * dot(viewDir, normal)))) * FresnelLerp (specColor, grazingTerm, nv);
}

#endif