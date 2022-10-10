// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

#ifndef AUTOLIGHT_INCLUDED
#define AUTOLIGHT_INCLUDED

#include "HLSLSupport.cginc"
#include "UnityShadowLibrary.cginc"

//---------------------------------------------------------------------
//----         NOTE: EXTRACTED OUT OF UnityShadowLibrary           ----
//----               FOR PCF7x7 ON FWD OBJECTS                     ----
//---------------------------------------------------------------------
#if defined (SHADOWS_DEPTH) && defined (SPOT)

    // declare shadowmap
    #if !defined(SHADOWMAPSAMPLER_DEFINED)
        UNITY_DECLARE_SHADOWMAP(_ShadowMapTexture);
        #define SHADOWMAPSAMPLER_DEFINED
    #endif

inline fixed UnitySpotSampleShadowmap(float4 shadowCoord)
{
    // DX11 feature level 9.x shader compiler (d3dcompiler_47 at least)
    // has a bug where trying to do more than one shadowmap sample fails compilation
    // with "inconsistent sampler usage". Until that is fixed, just never compile
    // multi-tap shadow variant on d3d11_9x.
    #if defined (SHADOWS_SOFT) && !defined (SHADER_API_D3D11_9X)

        half shadow = 1;

        // No hardware comparison sampler (ie some mobile + xbox360) : simple 4 tap PCF
        #if !defined (SHADOWS_NATIVE)
            float3 coord = shadowCoord.xyz / shadowCoord.w;
            float4 shadowVals;
            shadowVals.x = SAMPLE_DEPTH_TEXTURE(_ShadowMapTexture, coord + _ShadowOffsets[0].xy);
            shadowVals.y = SAMPLE_DEPTH_TEXTURE(_ShadowMapTexture, coord + _ShadowOffsets[1].xy);
            shadowVals.z = SAMPLE_DEPTH_TEXTURE(_ShadowMapTexture, coord + _ShadowOffsets[2].xy);
            shadowVals.w = SAMPLE_DEPTH_TEXTURE(_ShadowMapTexture, coord + _ShadowOffsets[3].xy);
            half4 shadows = (shadowVals < coord.zzzz) ? _LightShadowData.rrrr : 1.0f;
            shadow = dot(shadows, 0.25f);
        #else
            // Mobile with comparison sampler : 4-tap linear comparison filter
            #if defined(SHADER_API_MOBILE)
                float3 coord = shadowCoord.xyz / shadowCoord.w;
                half4 shadows;
                shadows.x = UNITY_SAMPLE_SHADOW(_ShadowMapTexture, coord + _ShadowOffsets[0]);
                shadows.y = UNITY_SAMPLE_SHADOW(_ShadowMapTexture, coord + _ShadowOffsets[1]);
                shadows.z = UNITY_SAMPLE_SHADOW(_ShadowMapTexture, coord + _ShadowOffsets[2]);
                shadows.w = UNITY_SAMPLE_SHADOW(_ShadowMapTexture, coord + _ShadowOffsets[3]);
                shadow = dot(shadows, 0.25f);
            // D3D9 : 4-tap linear comparison filter
            #elif defined (SHADER_API_D3D9)
                // HLSL for D3D9, when modifying the shadow UV coordinate, really wants to do
                // some funky swizzles, assuming that Z coordinate is unused in texture sampling.
                // So force it to do projective texture reads here, with .w being one.
                float4 coord = shadowCoord / shadowCoord.w;
                half4 shadows;
                shadows.x = UNITY_SAMPLE_SHADOW_PROJ(_ShadowMapTexture, coord + _ShadowOffsets[0]);
                shadows.y = UNITY_SAMPLE_SHADOW_PROJ(_ShadowMapTexture, coord + _ShadowOffsets[1]);
                shadows.z = UNITY_SAMPLE_SHADOW_PROJ(_ShadowMapTexture, coord + _ShadowOffsets[2]);
                shadows.w = UNITY_SAMPLE_SHADOW_PROJ(_ShadowMapTexture, coord + _ShadowOffsets[3]);
                shadow = dot(shadows, 0.25f);
            // Everything else (not mobile/not d3d9/not xbox360)
            #else
                float3 coord = shadowCoord.xyz / shadowCoord.w;
                float3 receiverPlaneDepthBias = UnityGetReceiverPlaneDepthBias(coord, 1.0f);

                //Spot lights sample
                shadow = UnitySampleShadowmap_PCF7x7(float4(coord, 1), receiverPlaneDepthBias);
            #endif
        shadow = lerp(_LightShadowData.r, 1.0f, shadow);
        #endif
    #else
        // 1-tap shadows
        #if defined (SHADOWS_NATIVE)
            half shadow = UNITY_SAMPLE_SHADOW_PROJ(_ShadowMapTexture, shadowCoord);
            shadow = lerp(_LightShadowData.r, 1.0f, shadow);
        #else
            half shadow = SAMPLE_DEPTH_TEXTURE_PROJ(_ShadowMapTexture, UNITY_PROJ_COORD(shadowCoord)) < (shadowCoord.z / shadowCoord.w) ? _LightShadowData.r : 1.0;
        #endif

    #endif

    return shadow;
}

#endif // #if defined (SHADOWS_DEPTH) && defined (SPOT)
//---------------------------------------------------------------------
//---------------------------------------------------------------------
//---------------------------------------------------------------------


// ----------------
//  Shadow helpers
// ----------------

// If none of the keywords are defined, assume directional?
#if !defined(POINT) && !defined(SPOT) && !defined(DIRECTIONAL) && !defined(POINT_COOKIE) && !defined(DIRECTIONAL_COOKIE)
    #define DIRECTIONAL
#endif

// ---- Screen space direction light shadows helpers (any version)
#if defined (SHADOWS_SCREEN)

    #if defined(UNITY_NO_SCREENSPACE_SHADOWS)
        UNITY_DECLARE_SHADOWMAP(_ShadowMapTexture);
        #define TRANSFER_SHADOW(a) a._ShadowCoord = mul( unity_WorldToShadow[0], mul( unity_ObjectToWorld, v.vertex ) );
        inline fixed unitySampleShadow (unityShadowCoord4 shadowCoord)
        {
            #if defined(SHADOWS_NATIVE)
                fixed shadow = UNITY_SAMPLE_SHADOW(_ShadowMapTexture, shadowCoord.xyz);
                shadow = _LightShadowData.r + shadow * (1-_LightShadowData.r);
                return shadow;
            #else
                unityShadowCoord dist = SAMPLE_DEPTH_TEXTURE(_ShadowMapTexture, shadowCoord.xy);
                // tegra is confused if we use _LightShadowData.x directly
                // with "ambiguous overloaded function reference max(mediump float, float)"
                unityShadowCoord lightShadowDataX = _LightShadowData.x;
                unityShadowCoord threshold = shadowCoord.z;
                return max(dist > threshold, lightShadowDataX);
            #endif
        }

    #else // UNITY_NO_SCREENSPACE_SHADOWS
        UNITY_DECLARE_SCREENSPACE_SHADOWMAP(_ShadowMapTexture);
        #define TRANSFER_SHADOW(a) a._ShadowCoord = ComputeScreenPos(a.pos);
        inline fixed unitySampleShadow (unityShadowCoord4 shadowCoord)
        {
            fixed shadow = UNITY_SAMPLE_SCREEN_SHADOW(_ShadowMapTexture, shadowCoord);
            return shadow;
        }

    #endif

    #define SHADOW_COORDS(idx1) unityShadowCoord4 _ShadowCoord : TEXCOORD##idx1;
    #define SHADOW_ATTENUATION(a) unitySampleShadow(a._ShadowCoord)
#endif

// -----------------------------
//  Shadow helpers (5.6+ version)
// -----------------------------
// This version depends on having worldPos available in the fragment shader and using that to compute light coordinates.
// if also supports ShadowMask (separately baked shadows for lightmapped objects)

half UnityComputeForwardShadows(float2 lightmapUV, float3 worldPos, float4 screenPos)
{
    //fade value
    float zDist = dot(_WorldSpaceCameraPos - worldPos, UNITY_MATRIX_V[2].xyz);
    float fadeDist = UnityComputeShadowFadeDistance(worldPos, zDist);
    half  realtimeToBakedShadowFade = UnityComputeShadowFade(fadeDist);

    //baked occlusion if any
    half shadowMaskAttenuation = UnitySampleBakedOcclusion(lightmapUV, worldPos);

    half realtimeShadowAttenuation = 1.0f;
    //directional realtime shadow
    #if defined (SHADOWS_SCREEN)
        #if defined(UNITY_NO_SCREENSPACE_SHADOWS)
            realtimeShadowAttenuation = unitySampleShadow(mul(unity_WorldToShadow[0], unityShadowCoord4(worldPos, 1)));
        #else
            //Only reached when LIGHTMAP_ON is NOT defined (and thus we use interpolator for screenPos rather than lightmap UVs). See HANDLE_SHADOWS_BLENDING_IN_GI below.
            realtimeShadowAttenuation = unitySampleShadow(screenPos);
        #endif
    #endif

    #if defined(UNITY_FAST_COHERENT_DYNAMIC_BRANCHING) && defined(SHADOWS_SOFT) && !defined(LIGHTMAP_SHADOW_MIXING)
    //avoid expensive shadows fetches in the distance where coherency will be good
    UNITY_BRANCH
    if (realtimeToBakedShadowFade < (1.0f - 1e-2f))
    {
    #endif

        //spot realtime shadow
        #if (defined (SHADOWS_DEPTH) && defined (SPOT))
            unityShadowCoord4 spotShadowCoord = mul(unity_WorldToShadow[0], unityShadowCoord4(worldPos, 1));
            realtimeShadowAttenuation = UnitySpotSampleShadowmap(spotShadowCoord);
        #endif

        //point realtime shadow
        #if defined (SHADOWS_CUBE)
            realtimeShadowAttenuation = UnitySampleShadowmap(worldPos - _LightPositionRange.xyz);
        #endif

    #if defined(UNITY_FAST_COHERENT_DYNAMIC_BRANCHING) && defined(SHADOWS_SOFT) && !defined(LIGHTMAP_SHADOW_MIXING)
    }
    #endif

    return UnityMixRealtimeAndBakedShadows(realtimeShadowAttenuation, shadowMaskAttenuation, realtimeToBakedShadowFade);
}

#if defined(HANDLE_SHADOWS_BLENDING_IN_GI) // handles shadows in the depths of the GI function for performance reasons
#   define UNITY_SHADOW_COORDS(idx1) SHADOW_COORDS(idx1)
#   define UNITY_TRANSFER_SHADOW(a, coord) TRANSFER_SHADOW(a)
#   define UNITY_SHADOW_ATTENUATION(a, worldPos) SHADOW_ATTENUATION(a)
#elif defined(SHADOWS_SCREEN) && !defined(LIGHTMAP_ON) && !defined(UNITY_NO_SCREENSPACE_SHADOWS) // no lightmap uv thus store screenPos instead
#   define UNITY_SHADOW_COORDS(idx1) SHADOW_COORDS(idx1)
#   define UNITY_TRANSFER_SHADOW(a, coord) TRANSFER_SHADOW(a)
#   define UNITY_SHADOW_ATTENUATION(a, worldPos) UnityComputeForwardShadows(0, worldPos, a._ShadowCoord)
#else
#   define UNITY_SHADOW_COORDS(idx1) unityShadowCoord2 _ShadowCoord : TEXCOORD##idx1;
#   if defined(SHADOWS_SHADOWMASK)
#       define UNITY_TRANSFER_SHADOW(a, coord) a._ShadowCoord = coord * unity_LightmapST.xy + unity_LightmapST.zw;
#       if (defined(SHADOWS_DEPTH) || defined(SHADOWS_SCREEN) || defined(SHADOWS_CUBE) || UNITY_LIGHT_PROBE_PROXY_VOLUME)
#           define UNITY_SHADOW_ATTENUATION(a, worldPos) UnityComputeForwardShadows(a._ShadowCoord, worldPos, 0)
#       else
#           define UNITY_SHADOW_ATTENUATION(a, worldPos) UnityComputeForwardShadows(a._ShadowCoord, 0, 0)
#       endif
#   else
#       define UNITY_TRANSFER_SHADOW(a, coord)
#       if (defined(SHADOWS_DEPTH) || defined(SHADOWS_SCREEN) || defined(SHADOWS_CUBE))
#           define UNITY_SHADOW_ATTENUATION(a, worldPos) UnityComputeForwardShadows(0, worldPos, 0)
#       else
            #if UNITY_LIGHT_PROBE_PROXY_VOLUME
#               define UNITY_SHADOW_ATTENUATION(a, worldPos) UnityComputeForwardShadows(0, worldPos, 0)
            #else
#               define UNITY_SHADOW_ATTENUATION(a, worldPos) UnityComputeForwardShadows(0, 0, 0)
            #endif
#       endif
#   endif
#endif

#ifdef POINT
sampler2D _LightTexture0;
unityShadowCoord4x4 unity_WorldToLight;


#define UNITY_LIGHT_ATTENUATION(destName0, destName1, input, worldPos) \
    unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz; \
    fixed destName0 = UNITY_SHADOW_ATTENUATION(input, worldPos); \
    fixed destName1 = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL;

#endif

#ifdef SPOT
sampler2D _LightTexture0;
unityShadowCoord4x4 unity_WorldToLight;
sampler2D _LightTextureB0;
inline fixed UnitySpotCookie(unityShadowCoord4 LightCoord)
{
    return tex2D(_LightTexture0, LightCoord.xy / LightCoord.w + 0.5).w;
}
inline fixed UnitySpotAttenuate(unityShadowCoord3 LightCoord)
{
    return tex2D(_LightTextureB0, dot(LightCoord, LightCoord).xx).UNITY_ATTEN_CHANNEL;
}

#define UNITY_LIGHT_ATTENUATION(destName0, destName1, input, worldPos) \
    unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)); \
    fixed destName0 = UNITY_SHADOW_ATTENUATION(input, worldPos); \
    fixed destName1 = (lightCoord.z > 0) * UnitySpotCookie(lightCoord) * UnitySpotAttenuate(lightCoord.xyz);

#endif

#ifdef DIRECTIONAL
    #define UNITY_LIGHT_ATTENUATION(destName0, destName1, input, worldPos) \
        fixed destName0 = UNITY_SHADOW_ATTENUATION(input, worldPos); \
        fixed destName1 = 1.0;
#endif

#ifdef POINT_COOKIE
samplerCUBE _LightTexture0;
unityShadowCoord4x4 unity_WorldToLight;
sampler2D _LightTextureB0;
#define UNITY_LIGHT_ATTENUATION(destName0, destName1, input, worldPos) \
    unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz; \
    fixed destName0 = UNITY_SHADOW_ATTENUATION(input, worldPos); \
    fixed destName1 = tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL * texCUBE(_LightTexture0, lightCoord).w;
#endif

#ifdef DIRECTIONAL_COOKIE
sampler2D _LightTexture0;
unityShadowCoord4x4 unity_WorldToLight;
#define UNITY_LIGHT_ATTENUATION(destName0, destName1, input, worldPos) \
    unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy; \
    fixed destName0 = UNITY_SHADOW_ATTENUATION(input, worldPos); \
    fixed destName1 = tex2D(_LightTexture0, lightCoord).w;
#endif







// -----------------------------
//  Light/Shadow helpers (4.x version)
// -----------------------------
// This version computes light coordinates in the vertex shader and passes them to the fragment shader.

// ---- Spot light shadows
#if defined (SHADOWS_DEPTH) && defined (SPOT)
#define SHADOW_COORDS(idx1) unityShadowCoord4 _ShadowCoord : TEXCOORD##idx1;
#define TRANSFER_SHADOW(a) a._ShadowCoord = mul (unity_WorldToShadow[0], mul(unity_ObjectToWorld,v.vertex));
#define SHADOW_ATTENUATION(a) UnitySampleShadowmap(a._ShadowCoord)
#endif

// ---- Point light shadows
#if defined (SHADOWS_CUBE)
#define SHADOW_COORDS(idx1) unityShadowCoord3 _ShadowCoord : TEXCOORD##idx1;
#define TRANSFER_SHADOW(a) a._ShadowCoord = mul(unity_ObjectToWorld, v.vertex).xyz - _LightPositionRange.xyz;
#define SHADOW_ATTENUATION(a) UnitySampleShadowmap(a._ShadowCoord)
#endif

// ---- Shadows off
#if !defined (SHADOWS_SCREEN) && !defined (SHADOWS_DEPTH) && !defined (SHADOWS_CUBE)
#define SHADOW_COORDS(idx1)
#define TRANSFER_SHADOW(a)
#define SHADOW_ATTENUATION(a) 1.0
#endif

#ifdef POINT
#define LIGHTING_COORDS(idx1,idx2) unityShadowCoord3 _LightCoord : TEXCOORD##idx1; SHADOW_COORDS(idx2)
#define TRANSFER_VERTEX_TO_FRAGMENT(a) a._LightCoord = mul(unity_WorldToLight, mul(unity_ObjectToWorld, v.vertex)).xyz; TRANSFER_SHADOW(a)
#define LIGHT_ATTENUATION(a)    (tex2D(_LightTexture0, dot(a._LightCoord,a._LightCoord).rr).UNITY_ATTEN_CHANNEL * SHADOW_ATTENUATION(a))
#endif

#ifdef SPOT
#define LIGHTING_COORDS(idx1,idx2) unityShadowCoord4 _LightCoord : TEXCOORD##idx1; SHADOW_COORDS(idx2)
#define TRANSFER_VERTEX_TO_FRAGMENT(a) a._LightCoord = mul(unity_WorldToLight, mul(unity_ObjectToWorld, v.vertex)); TRANSFER_SHADOW(a)
#define LIGHT_ATTENUATION(a)    ( (a._LightCoord.z > 0) * UnitySpotCookie(a._LightCoord) * UnitySpotAttenuate(a._LightCoord.xyz) * SHADOW_ATTENUATION(a) )
#endif

#ifdef DIRECTIONAL
    #define LIGHTING_COORDS(idx1,idx2) SHADOW_COORDS(idx1)
    #define TRANSFER_VERTEX_TO_FRAGMENT(a) TRANSFER_SHADOW(a)
    #define LIGHT_ATTENUATION(a)    SHADOW_ATTENUATION(a)
#endif

#ifdef POINT_COOKIE
#define LIGHTING_COORDS(idx1,idx2) unityShadowCoord3 _LightCoord : TEXCOORD##idx1; SHADOW_COORDS(idx2)
#define TRANSFER_VERTEX_TO_FRAGMENT(a) a._LightCoord = mul(unity_WorldToLight, mul(unity_ObjectToWorld, v.vertex)).xyz; TRANSFER_SHADOW(a)
#define LIGHT_ATTENUATION(a)    (tex2D(_LightTextureB0, dot(a._LightCoord,a._LightCoord).rr).UNITY_ATTEN_CHANNEL * texCUBE(_LightTexture0, a._LightCoord).w * SHADOW_ATTENUATION(a))
#endif

#ifdef DIRECTIONAL_COOKIE
#define LIGHTING_COORDS(idx1,idx2) unityShadowCoord2 _LightCoord : TEXCOORD##idx1; SHADOW_COORDS(idx2)
#define TRANSFER_VERTEX_TO_FRAGMENT(a) a._LightCoord = mul(unity_WorldToLight, mul(unity_ObjectToWorld, v.vertex)).xy; TRANSFER_SHADOW(a)
#define LIGHT_ATTENUATION(a)    (tex2D(_LightTexture0, a._LightCoord).w * SHADOW_ATTENUATION(a))
#endif


#endif