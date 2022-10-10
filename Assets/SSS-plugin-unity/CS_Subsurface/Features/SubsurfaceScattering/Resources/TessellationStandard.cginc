#ifndef TESSELLATION_STANDARD
#define TESSELLATION_STANDARD

#include "HLSLSupport.cginc"
#include "Lighting.cginc"
#include "UnityStandardInput.cginc"
#include "UnityShaderVariables.cginc"
#include "UnityShaderUtilities.cginc"
#include "UnityStandardCoreForward.cginc"

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

InternalTessInterp_appdata tessvert_standard (appdata v) {
	InternalTessInterp_appdata o;
	
	o.vertex    = v.vertex;

	o.tangent   = v.tangent;
	o.normal    = v.normal;
	
	o.texcoord  = v.texcoord;
	o.texcoord1 = v.texcoord1;
	o.texcoord2 = v.texcoord2;
	
	return o;
}

UnityTessellationFactors hsconst_standard (InputPatch<InternalTessInterp_appdata,3> v)
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
[UNITY_patchconstantfunc("hsconst_standard")]
[UNITY_outputcontrolpoints(3)]
InternalTessInterp_appdata hs_standard (InputPatch<InternalTessInterp_appdata,3> v, uint id : SV_OutputControlPointID)
{
	return v[id];
}

void vert(inout VertexInput v)
{
	float d = tex2Dlod(_DispTex, float4(v.uv0.xy,0,0)).r * _Displacement;
	v.vertex.xyz += v.normal * d;
}

[UNITY_domain("tri")]
#if defined(TESSELATION_DEFERRED)
VertexOutputDeferred
#elif defined(TESSELATION_BASE) 
VertexOutputForwardBase
#else
VertexOutputForwardAdd
#endif
ds_standard (UnityTessellationFactors tessFactors, const OutputPatch<InternalTessInterp_appdata,3> vi, float3 bary : SV_DomainLocation)
{
	VertexInput v;

	v.vertex = vi[0].vertex*bary.x + vi[1].vertex*bary.y + vi[2].vertex*bary.z;
	float3 pp[3];
	for (int i = 0; i < 3; ++i)
		pp[i] = v.vertex.xyz - vi[i].normal * (dot(v.vertex.xyz, vi[i].normal) - dot(vi[i].vertex.xyz, vi[i].normal));
	
	v.vertex.xyz = _Phong * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-_Phong) * v.vertex.xyz;
#ifdef _TANGENT_TO_WORLD
	v.tangent = vi[0].tangent*bary.x + vi[1].tangent*bary.y + vi[2].tangent*bary.z;
#endif
	v.normal = vi[0].normal*bary.x + vi[1].normal*bary.y + vi[2].normal*bary.z;
	v.uv0    = vi[0].texcoord*bary.x + vi[1].texcoord*bary.y + vi[2].texcoord*bary.z;
	v.uv1    = vi[0].texcoord1*bary.x + vi[1].texcoord1*bary.y + vi[2].texcoord1*bary.z;
#if defined(DYNAMICLIGHTMAP_ON) || defined(UNITY_PASS_META)
	v.uv2 = vi[0].texcoord2*bary.x + vi[1].texcoord2*bary.y + vi[2].texcoord2*bary.z;
#endif

	vert (v);

#if defined(TESSELATION_DEFERRED)
	return vertDeferred (v);
#elif defined(TESSELATION_BASE)
	return vertForwardBase (v);
#else
	return vertForwardAdd (v);
#endif
}


#endif // TESSELLATION_STANDARD