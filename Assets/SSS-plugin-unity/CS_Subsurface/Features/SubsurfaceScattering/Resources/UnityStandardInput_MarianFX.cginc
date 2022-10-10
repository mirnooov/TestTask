// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

#ifndef UNITY_STANDARD_INPUT_MARIANFX_INCLUDED
#define UNITY_STANDARD_INPUT_MARIANFX_INCLUDED

#include "Common.cginc"

#include "UnityCG.cginc"
#include "UnityStandardConfig.cginc"
#include "UnityPBSLighting.cginc" // TBD: remove
#include "UnityStandardUtils.cginc"

//---------------------------------------
// Directional lightmaps & Parallax require tangent space too
#if (_NORMALMAP || DIRLIGHTMAP_COMBINED || _PARALLAXMAP)
    #define _TANGENT_TO_WORLD 1
#endif

#if (_DETAIL_MULX2 || _DETAIL_MUL || _DETAIL_ADD || _DETAIL_LERP)
    #define _DETAIL 1
#endif

//---------------------------------------
half4       _Color;
half        _Cutoff;

sampler2D   _MainTex;
float4      _MainTex_ST;

float		_Transition;		// Map blending threshold for Marian's transition (JRS)
float		_TransWidth;		// Transition width, to avoid aliasing
sampler2D   _TransMap;			// Transition map

sampler2D	_MainTex2;			// Disease state albedo map

sampler2D   _DetailAlbedoMap;
float4      _DetailAlbedoMap_ST;

sampler2D   _BumpMap;
half        _BumpScale;

sampler2D	_BumpMap2;			// Disease state normal map

sampler2D   _DetailMask;
sampler2D   _DetailNormalMap;
half        _DetailNormalMapScale;

sampler2D   _DetailSmoothnessMap;

sampler2D   _SpecGlossMap;
sampler2D   _MetallicGlossMap;
half        _Metallic;
half        _Glossiness;
half        _GlossMapScale;

sampler2D	_SpecGlossMap2;		// Disease state spec/gloss map
sampler2D   _MetallicGlossMap2;	// Disease state metallic map

sampler2D   _OcclusionMap;
half        _OcclusionStrength;

sampler2D   _ParallaxMap;
half        _Parallax;
half        _UVSec;

half4       _EmissionColor;
sampler2D   _EmissionMap;

//-------------------------------------------------------------------------------------
// Input functions

struct VertexInput
{
    float4 vertex   : POSITION;
    half3 normal    : NORMAL;
    float2 uv0      : TEXCOORD0;
    float2 uv1      : TEXCOORD1;
#if defined(DYNAMICLIGHTMAP_ON) || defined(UNITY_PASS_META)
    float2 uv2      : TEXCOORD2;
#endif

#ifdef _TANGENT_TO_WORLD
    half4 tangent   : TANGENT;
#endif

    UNITY_VERTEX_INPUT_INSTANCE_ID
};

//-------------------------------------------------------------------------------------
// Some Helper Functions (JRS)

inline half4 LerpTex2D(sampler2D a, sampler2D b, float2 texcoords, float p)
{
	return lerp(tex2D(a, texcoords), tex2D(b, texcoords), p);
}

inline half3 LerpNormals(half3 n1, half3 n2, float p)
{
	return normalize(lerp(n1, n2, p));
}

inline half3 SampleNormalTangent(sampler2D n, float2 texcoords, float scale)
{
	half3 normalTangent;

#if defined(SAMPLE_NORMAL_RAW)
    normalTangent = tex2D(n, texcoords) * 2 - 1;
#else
    normalTangent = UnpackScaleNormal(tex2D (n, texcoords), scale);
#endif

	return normalTangent;
}

inline half TransitionMap(float2 uv)
{
	half trans = tex2D(_TransMap, uv).r;
	trans = trans * (1.0 - _TransWidth) + _TransWidth;
	trans = smoothstep(_Transition, _Transition + _TransWidth, trans);
	return trans;
}

float GetSubsurfaceRadiusCustom(float2 uv)
{
	float radius = _SubsurfaceRadius;
#ifdef _SUBSURFACE_RADIUS_MAP
	radius *= tex2D(_SubsurfaceRadiusMap, uv).g;
#endif
	return radius;
}


//-------------------------------------------------------------------------------------


float4 TexCoords(VertexInput v)
{
    float4 texcoord;
    texcoord.xy = TRANSFORM_TEX(v.uv0, _MainTex); // Always source from uv0
    texcoord.zw = TRANSFORM_TEX(((_UVSec == 0) ? v.uv0 : v.uv1), _DetailAlbedoMap);
    return texcoord;
}

half DetailMask(float2 uv)
{
    return tex2D (_DetailMask, uv).a;
}


half3 Albedo(float4 texcoords, float p)
{
	half3 albedo = _Color.rgb * LerpTex2D(_MainTex, _MainTex2, texcoords.xy, p).rgb;

#if _DETAIL
    #if (SHADER_TARGET < 30)
        // SM20: instruction count limitation
        // SM20: no detail mask
        half mask = 1;
    #else
        half mask = DetailMask(texcoords.xy);
    #endif
    half3 detailAlbedo = tex2D (_DetailAlbedoMap, texcoords.zw).rgb;
    #if _DETAIL_MULX2
        albedo *= LerpWhiteTo (detailAlbedo * unity_ColorSpaceDouble.rgb, mask);
    #elif _DETAIL_MUL
        albedo *= LerpWhiteTo (detailAlbedo, mask);
    #elif _DETAIL_ADD
        albedo += detailAlbedo * mask;
    #elif _DETAIL_LERP
        albedo = lerp (albedo, detailAlbedo, mask);
    #endif
#endif
    return albedo;
}

half Alpha(float2 uv)
{
#if defined(_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A)
    return _Color.a;
#else
    return tex2D(_MainTex, uv).a * _Color.a;
#endif
}

half Occlusion(float2 uv)
{
#if (SHADER_TARGET < 30)
    // SM20: instruction count limitation
    // SM20: simpler occlusion
    return tex2D(_OcclusionMap, uv).g;
#else
    half occ = tex2D(_OcclusionMap, uv).g;
    return LerpOneTo (occ, _OcclusionStrength);
#endif
}

half DetailSmoothness(float4 uv){
    half detailSmoothness = 1;
    #if _DETAIL_SMOOTHNESS
        half mask = DetailMask(uv.xy);
        detailSmoothness = tex2D(_DetailSmoothnessMap, uv.zw).r;
        detailSmoothness = LerpWhiteTo(2.0 * saturate(detailSmoothness), mask); //TODO: Mul by gloss scale?
    #endif
    return detailSmoothness;
}

half4 SpecularGloss(float4 uv, fixed p)
{
    half4 sg;
#ifdef _SPECGLOSSMAP
    #if defined(_SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A)
        //sg.rgb = tex2D(_SpecGlossMap, uv).rgb;
        //sg.a = tex2D(_MainTex, uv).a;
        sg.rgb = LerpTex2D(_SpecGlossMap, _SpecGlossMap2, uv.xy, p).rgb;
        sg.a = LerpTex2D(_MainTex, _MainTex2, uv.xy, p).a;
    #else
        //sg = tex2D(_SpecGlossMap2, uv);
        sg = LerpTex2D(_SpecGlossMap, _SpecGlossMap2, uv.xy, p);
    #endif

    sg.a *= DetailSmoothness(uv);
    sg.a *= _GlossMapScale;
#else
    sg.rgb = _SpecColor.rgb;
    #ifdef _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
        //sg.a = tex2D(_MainTex, uv).a;
        sg.a = LerpTex2D(_MainTex, _MainTex2, uv.xy, p).a;
        sg.a *= DetailSmoothness(uv);
        sg.a *= _GlossMapScale;
    #else
        sg.a = _Glossiness;
        sg.a *= DetailSmoothness(uv);
    #endif
#endif
    return sg;

}

half2 MetallicGloss(float4 uv, fixed p)
{
    half2 mg;

#ifdef _METALLICGLOSSMAP

    #ifdef _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
        //mg.r = tex2D(_MetallicGlossMap, uv.xy).r;
        mg.r = LerpTex2D(_MetallicGlossMap, _MetallicGlossMap2, uv.xy, p).r;
        //mg.g = tex2D(_MainTex, uv.xy).a;
		mg.g = LerpTex2D(_MainTex, _MainTex2, uv.xy, p).a;
    #else
        //mg = tex2D(_MetallicGlossMap, uv.xy).ra;
		mg = LerpTex2D(_MetallicGlossMap, _MetallicGlossMap2, uv.xy, p).ra;
    #endif

    mg.g *= DetailSmoothness(uv);
    mg.g *= _GlossMapScale;
#else
    mg.r = _Metallic;
    #ifdef _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
        mg.g = LerpTex2D(_MainTex, _MainTex2, uv.xy, p).a;
        mg.g *= DetailSmoothness(uv);
        mg.g *= _GlossMapScale;
    #else
        mg.g = _Glossiness;
        mg.g *= DetailSmoothness(uv);
    #endif
#endif

    return mg;
}

half3 Emission(float2 uv)
{
#ifndef _EMISSION
    return 0;
#else
    return tex2D(_EmissionMap, uv).rgb * _EmissionColor.rgb;
#endif
}

#ifdef _NORMALMAP
half3 NormalInTangentSpace(float4 texcoords, float p)
{
    half3 n1 = SampleNormalTangent(_BumpMap, texcoords.xy, _BumpScale);
	half3 n2 = SampleNormalTangent(_BumpMap2, texcoords.xy, _BumpScale);
	half3 normalTangent = LerpNormals(n1, n2, p); 

#if _DETAIL && defined(UNITY_ENABLE_DETAIL_NORMALMAP)
    half mask = DetailMask(texcoords.xy);
    half3 detailNormalTangent = UnpackScaleNormal(tex2D (_DetailNormalMap, texcoords.zw), _DetailNormalMapScale);
    #if _DETAIL_LERP
        normalTangent = lerp(
            normalTangent,
            detailNormalTangent,
            mask);
    #else
        normalTangent = lerp(
            normalTangent,
            BlendNormals(normalTangent, detailNormalTangent),
            mask);
    #endif
#endif

    return normalTangent;
}
#endif

float4 Parallax (float4 texcoords, half3 viewDir)
{
// D3D9/SM30 supports up to 16 samplers, skip the parallax map in case we exceed the limit
#define EXCEEDS_D3D9_SM3_MAX_SAMPLER_COUNT  (defined(LIGHTMAP_ON) && defined(SHADOWS_SHADOWMASK) && defined(SHADOWS_SCREEN) && defined(_NORMALMAP) && \
                                             defined(_EMISSION) && defined(_DETAIL) && (defined(_METALLICGLOSSMAP) || defined(_SPECGLOSSMAP)))

#if !defined(_PARALLAXMAP) || (SHADER_TARGET < 30) || (defined(SHADER_API_D3D9) && EXCEEDS_D3D9_SM3_MAX_SAMPLER_COUNT)
    // SM20: instruction count limitation
    // SM20: no parallax
    return texcoords;
#else
    half h = tex2D (_ParallaxMap, texcoords.xy).g;
    float2 offset = ParallaxOffset1Step (h, _Parallax, viewDir);
    return float4(texcoords.xy + offset, texcoords.zw + offset);
#endif

#undef EXCEEDS_D3D9_SM3_MAX_SAMPLER_COUNT
}

#endif // UNITY_STANDARD_INPUT_MARIANFX_INCLUDED
