#ifndef FABRIC_SPLIT_BRDF
#define FABRIC_SPLIT_BRDF

#include "../Common.cginc"

float3 _FuzzTint;

// Ref: https://cedec.cesa.or.jp/2015/session/ENG/14698.html The Rendering Materials of Far Cry 4
float V_SmithJointGGXAniso(float TdotV, float BdotV, float NdotV, float TdotL, float BdotL, float NdotL, float roughnessT, float roughnessB)
{
    float aT = roughnessT;
    float aT2 = aT * aT;
    float aB = roughnessB;
    float aB2 = aB * aB;

    float lambdaV = NdotL * sqrt(aT2 * TdotV * TdotV + aB2 * BdotV * BdotV + NdotV * NdotV);
    float lambdaL = NdotV * sqrt(aT2 * TdotL * TdotL + aB2 * BdotL * BdotL + NdotL * NdotL);

    return 0.5 / (lambdaV + lambdaL);
}

// roughnessT -> roughness in tangent direction
// roughnessB -> roughness in bitangent direction
float D_GGXAnisoNoPI(float TdotH, float BdotH, float NdotH, float roughnessT, float roughnessB)
{
    float f = TdotH * TdotH / (roughnessT * roughnessT) + BdotH * BdotH / (roughnessB * roughnessB) + NdotH * NdotH;
    return 1.0 / (roughnessT * roughnessB * f * f);
}

float D_GGXAniso(float TdotH, float BdotH, float NdotH, float roughnessT, float roughnessB)
{
    return INV_PI * D_GGXAnisoNoPI(TdotH, BdotH, NdotH, roughnessT, roughnessB);
}

#ifndef _FABRIC_SILK
//Cotton Fabric BRDF
//-----------------------------------------------------------------------------------------
void SplitBRDF(half3 diffColor, half3 specColor, half oneMinusReflectivity, half smoothness,
               half3 normal, half3 viewDir,
               UnityLight light, UnityIndirect gi,
               SilkData unused, out half3 diffuse, out half3 specular)
{
    float NdotL = saturate(dot(normal, light.dir));
    float NdotV = abs(dot(normal, viewDir));
    float LdotV = dot(light.dir, viewDir);
    float invLenLV = rsqrt(abs(2 * LdotV + 2));
    float NdotH = saturate((NdotL + NdotV) * invLenLV);
    float LdotH = saturate(invLenLV * LdotV + invLenLV);

    //TODO: NdotV

    float3 F = FresnelTerm (0.2, LdotH);

    float Vis;
    float D;
    float3 H = (light.dir + viewDir) * invLenLV;
    half perceptualRoughness = SmoothnessToPerceptualRoughness (smoothness);
    half roughness = PerceptualRoughnessToRoughness(perceptualRoughness);
    float cnorm = 1.0 / (PI * (4.0 * roughness + 1.0));

    float NdotH2 = NdotH*NdotH;
    float cot2 = NdotH2 / (1.0 - NdotH2);
    float sin2 = 1.0 - NdotH2;
    float sin4 = sin2 * sin2;
    float amp = 4.0;

    D = cnorm * (1.0 + (amp * exp(-cot2 / roughness) / sin4));
    Vis = SmithJointGGXVisibilityTerm (NdotL, NdotV, roughness);

    float NdotLwrap = sqrt(NdotL);

    // surfaceReduction = Int D(NdotH) * NdotH * Id(NdotL>0) dH = 1/(roughness^2+1)
    half surfaceReduction;
#   ifdef UNITY_COLORSPACE_GAMMA
        surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;      // 1-0.28*x^3 as approximation for (1/(x^4+1))^(1/2.2) on the domain [0;1]
#   else
        surfaceReduction = 1.0 / (roughness*roughness + 1.0);           // fade \in [0.5;1]
#   endif

    half grazingTerm = saturate(smoothness + (1-oneMinusReflectivity));
    specular = NdotLwrap * F * (Vis * D);
    // specularTerm * nl can be NaN on Metal in some cases, use max() to make sure it's a sane value
    specular = max(0, specular);
#if defined(_SPECULARHIGHLIGHTS_OFF)
    specular = 0.0;
#endif
    specular = (specular * light.color
             + surfaceReduction * gi.specular * FresnelLerp(specColor, grazingTerm, NdotV)) * _FuzzTint;

    float diffuseTerm = DisneyDiffuse(NdotV, NdotL, LdotH, perceptualRoughness) * NdotL;
    diffuse = sqrt(diffColor) * (gi.diffuse + light.color * diffuseTerm);
}

#else
//Silk Fabric BRDF
//------------------------------------------------------------------------------------------
void SplitBRDF (half3 diffColor, half3 specColor, half oneMinusReflectivity, half smoothness,
                half3 normal, half3 viewDir,
                UnityLight light, UnityIndirect gi,
                SilkData sd, out half3 diffuse, out half3 specular)
{
    float NdotL = saturate(dot(normal, light.dir));
    float NdotV = abs(dot(normal, viewDir));
    float LdotV = dot(light.dir, viewDir);
    float invLenLV = rsqrt(abs(2 * LdotV + 2));
    float NdotH = saturate((NdotL + NdotV) * invLenLV);
    float LdotH = saturate(invLenLV * LdotV + invLenLV);

    float3 F = FresnelTerm (diffColor, LdotH);

    float Vis;
    float D;

    float3 H = (light.dir + viewDir) * invLenLV;
    float TdotH = dot(sd.tangentWS,   H);
    float TdotL = dot(sd.tangentWS,   light.dir);
    float TdotV = dot(sd.tangentWS,   viewDir);
    float BdotH = dot(sd.bitangentWS, H);
    float BdotL = dot(sd.bitangentWS, light.dir);
    float BdotV = dot(sd.bitangentWS, viewDir);

    //Clamp Roughness

    Vis = V_SmithJointGGXAniso(TdotV, BdotV, NdotV, TdotL, BdotL, NdotL, 
                               sd.roughnessT, sd.roughnessB);

    D = D_GGXAniso(TdotH, BdotH, NdotH, sd.roughnessT, sd.roughnessB);
    
    half perceptualRoughness = SmoothnessToPerceptualRoughness (smoothness);
    half roughness = PerceptualRoughnessToRoughness(perceptualRoughness);

    // surfaceReduction = Int D(NdotH) * NdotH * Id(NdotL>0) dH = 1/(roughness^2+1)
    half surfaceReduction;
#   ifdef UNITY_COLORSPACE_GAMMA
        surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;      // 1-0.28*x^3 as approximation for (1/(x^4+1))^(1/2.2) on the domain [0;1]
#   else
        surfaceReduction = 1.0 / (roughness*roughness + 1.0);           // fade \in [0.5;1]
#   endif

    half grazingTerm = saturate(smoothness + (1-oneMinusReflectivity));
    specular = F * (Vis * D);
    // specularTerm * nl can be NaN on Metal in some cases, use max() to make sure it's a sane value
    specular = max(0, specular * NdotL);
#if defined(_SPECULARHIGHLIGHTS_OFF)
    specular = 0.0;
#endif
    specular = (2.25 * specular * light.color
             + surfaceReduction * gi.specular * FresnelLerp(specColor, grazingTerm, NdotV)) * _FuzzTint;

    float diffuseTerm = DisneyDiffuse(NdotV, NdotL, LdotH, perceptualRoughness) * NdotL;
    diffuse = sqrt(diffColor) * (gi.diffuse + light.color * diffuseTerm);
}
#endif

#endif //FABRIC_SPLIT_BRDF