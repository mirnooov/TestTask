#ifndef TESSELLATION_STANDARD_SHADOW
#define TESSELLATION_STANDARD_SHADOW

#ifdef UNITY_CAN_COMPILE_TESSELLATION
struct UnityTessellationFactors {
    float edge[3] : SV_TessFactor;
    float inside : SV_InsideTessFactor;
};
#endif // UNITY_CAN_COMPILE_TESSELLATION

#include "UnityStandardShadow.cginc"

sampler2D _DispTex;
float _Displacement;
float _Tess;
float _Phong;

struct appdata
{
	float4 vertex    : POSITION;
	float4 tangent   : TANGENT;
	float3 normal    : NORMAL;
	float2 texcoord  : TEXCOORD0;
	float2 texcoord1 : TEXCOORD1;
	float2 texcoord2 : TEXCOORD2;
};

struct InternalTessInterp_appdata {
	float4 vertex    : INTERNALTESSPOS;
	float4 tangent   : TANGENT;
	float3 normal    : NORMAL;
	float2 texcoord  : TEXCOORD0;
	float2 texcoord1 : TEXCOORD1;
	float2 texcoord2 : TEXCOORD2;
};

float4 tessFixed()
{
	return _Tess;
}

InternalTessInterp_appdata tessvert_shadow (appdata v) {
	InternalTessInterp_appdata o;
	
	o.vertex    = v.vertex;

	o.tangent   = v.tangent;
	o.normal    = v.normal;
	
	o.texcoord  = v.texcoord;
	o.texcoord1 = v.texcoord1;
	o.texcoord2 = v.texcoord2;
	
	return o;
}

UnityTessellationFactors hsconst_shadow (InputPatch<InternalTessInterp_appdata,3> v)
{
	UnityTessellationFactors o;
	float4 tf;
	tf = tessFixed();
	o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
	return o;
}

// tessellation hull shader
[UNITY_domain("tri")]
[UNITY_partitioning("fractional_odd")]
[UNITY_outputtopology("triangle_cw")]
[UNITY_patchconstantfunc("hsconst_shadow")]
[UNITY_outputcontrolpoints(3)]
InternalTessInterp_appdata hs_shadow (InputPatch<InternalTessInterp_appdata,3> v, uint id : SV_OutputControlPointID)
{
	return v[id];
}

void vert(inout VertexInput v)
{
	float d = tex2Dlod(_DispTex, float4(v.uv0.xy,0,0)).r * _Displacement;
	v.vertex.xyz += v.normal * d;
}

//-----------------------------------------------------------------------
//Shadow Domain

#ifndef UNITY_STANDARD_USE_SHADOW_OUTPUT_STRUCT
// Including these two, since if I include UnityStandardShadow.cginc, there are issues with redeclarations (JRS)
struct VertexOutputShadowCaster
{
    V2F_SHADOW_CASTER_NOPOS
    #if defined(UNITY_STANDARD_USE_SHADOW_UVS)
        float2 tex : TEXCOORD1;

        #if defined(_PARALLAXMAP)
            half4 tangentToWorldAndParallax[3]: TEXCOORD2;  // [3x3:tangentToWorld | 1x3:viewDirForParallax]
        #endif
    #endif
};
#endif

[UNITY_domain("tri")]
void ds_shadow (UnityTessellationFactors tessFactors, const OutputPatch<InternalTessInterp_appdata,3> vi, float3 bary : SV_DomainLocation,
				#ifdef UNITY_STANDARD_USE_SHADOW_OUTPUT_STRUCT
				out VertexOutputShadowCaster o,
				#endif
				out float4 opos : SV_POSITION)
{
	VertexInput v;

	v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
	float3 pp[3];
	for (int i = 0; i < 3; ++i)
	pp[i] = v.vertex.xyz - vi[i].normal * (dot(v.vertex.xyz, vi[i].normal) - dot(vi[i].vertex.xyz, vi[i].normal));
	v.vertex.xyz = _Phong * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-_Phong) * v.vertex.xyz;

#if defined(UNITY_STANDARD_USE_SHADOW_UVS) && defined(_PARALLAXMAP)
	v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
#endif

	v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
	v.uv0 = vi[0].texcoord*bary.x + vi[1].texcoord*bary.y + vi[2].texcoord*bary.z;

	vert (v);
    
	vertShadowCaster (v,     
					  #ifdef UNITY_STANDARD_USE_SHADOW_OUTPUT_STRUCT
					  o,
					  #endif
					  opos);
}

#endif // TESSELLATION_STANDARD_SHADOW