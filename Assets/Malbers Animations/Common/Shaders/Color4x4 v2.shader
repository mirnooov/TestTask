// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Malbers/Color4x4v2"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin][Header(Albedo (A Gradient))]_Color1("Color 1", Color) = (1,0.1544118,0.1544118,0.291)
		_Color2("Color 2", Color) = (1,0.1544118,0.8017241,0.253)
		_Color3("Color 3", Color) = (0.2535501,0.1544118,1,0.541)
		_Color4("Color 4", Color) = (0.1544118,0.5451319,1,0.253)
		[Space(10)]_Color5("Color 5", Color) = (0.9533468,1,0.1544118,0.553)
		_Color6("Color 6", Color) = (0.2720588,0.1294625,0,0.097)
		_Color7("Color 7", Color) = (0.1544118,0.6151115,1,0.178)
		_Color8("Color 8", Color) = (0.4849697,0.5008695,0.5073529,0.078)
		[Space(10)]_Color9("Color 9", Color) = (0.3164301,0,0.7058823,0.134)
		_Color10("Color 10", Color) = (0.362069,0.4411765,0,0.759)
		_Color11("Color 11", Color) = (0.6691177,0.6691177,0.6691177,0.647)
		_Color12("Color 12", Color) = (0.5073529,0.1574544,0,0.128)
		[Space(10)]_Color13("Color 13", Color) = (1,0.5586207,0,0.272)
		_Color14("Color 14", Color) = (0,0.8025862,0.875,0.047)
		_Color15("Color 15", Color) = (1,0,0,0.391)
		_Color16("Color 16", Color) = (0.4080882,0.75,0.4811866,0.134)
		[Header(Metallic(R) Rough(G) Emmission(B))]_MRE1("MRE 1", Color) = (0,1,0,0)
		_MRE2("MRE 2", Color) = (0,1,0,0)
		_MRE3("MRE 3", Color) = (0,1,0,0)
		_MRE4("MRE 4", Color) = (0,1,0,0)
		[Space(10)]_MRE5("MRE 5", Color) = (0,1,0,0)
		_MRE6("MRE 6", Color) = (0,1,0,0)
		_MRE7("MRE 7", Color) = (0,1,0,0)
		_MRE8("MRE 8", Color) = (0,1,0,0)
		[Space(10)]_MRE9("MRE 9", Color) = (0,1,0,0)
		_MRE10("MRE 10", Color) = (0,1,0,0)
		_MRE11("MRE 11", Color) = (0,1,0,0)
		_MRE12("MRE 12", Color) = (0,1,0,0)
		[Space(10)]_MRE13("MRE 13", Color) = (0,1,0,0)
		_MRE14("MRE 14", Color) = (0,1,0,0)
		_MRE15("MRE 15", Color) = (0,1,0,0)
		_MRE16("MRE 16", Color) = (0,1,0,0)
		[Header(Emmision)]_EmissionPower1("Emission Power", Float) = 1
		[SingleLineTexture][Header(Gradient)]_Gradient("Gradient", 2D) = "white" {}
		_GradientIntensity("Gradient Intensity", Range( 0 , 1)) = 0.75
		_GradientColor("Gradient Color", Color) = (0,0,0,0)
		_GradientScale("Gradient Scale", Float) = 1
		_GradientOffset("Gradient Offset", Float) = 0
		[ASEEnd]_GradientPower("Gradient Power", Float) = 1

		[HideInInspector] _RenderQueueType("Render Queue Type", Float) = 1
		[HideInInspector] [ToggleUI] _AddPrecomputedVelocity("Add Precomputed Velocity", Float) = 1
		[HideInInspector] _StencilRef("Stencil Ref", Int) = 0
		[HideInInspector] _StencilWriteMask("Stencil Write Mask", Int) = 6
		[HideInInspector] _StencilRefDepth("Stencil Ref Depth", Int) = 8
		[HideInInspector] _StencilWriteMaskDepth("Stencil Write Mask Depth", Int) = 8
		[HideInInspector] _StencilRefMV("Stencil Ref MV", Int) = 40
		[HideInInspector] _StencilWriteMaskMV("Stencil Write Mask MV", Int) = 40
		[HideInInspector] _StencilRefDistortionVec("Stencil Ref Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskDistortionVec("Stencil Write Mask Distortion Vec", Int) = 4
		[HideInInspector] _StencilWriteMaskGBuffer("Stencil Write Mask GBuffer", Int) = 14
		[HideInInspector] _StencilRefGBuffer("Stencil Ref GBuffer", Int) = 10
		[HideInInspector] _ZTestGBuffer("ZTest GBuffer", Int) = 4
		[HideInInspector] [ToggleUI] _RequireSplitLighting("Require Split Lighting", Float) = 0
		[HideInInspector] [ToggleUI] _ReceivesSSR("Receives SSR", Float) = 1
		[HideInInspector] _SurfaceType("Surface Type", Float) = 0
		[HideInInspector] _BlendMode("Blend Mode", Float) = 0
		[HideInInspector] _SrcBlend("Src Blend", Float) = 1
		[HideInInspector] _DstBlend("Dst Blend", Float) = 0
		[HideInInspector] _AlphaSrcBlend("Alpha Src Blend", Float) = 1
		[HideInInspector] _AlphaDstBlend("Alpha Dst Blend", Float) = 0
		[HideInInspector] [ToggleUI] _ZWrite("ZWrite", Float) = 1
		[HideInInspector] [ToggleUI] _TransparentZWrite("Transparent ZWrite", Float) = 1
		[HideInInspector] _CullMode("Cull Mode", Float) = 2
		[HideInInspector] _TransparentSortPriority("Transparent Sort Priority", Int) = 0
		[HideInInspector] [ToggleUI] _EnableFogOnTransparent("Enable Fog On Transparent", Float) = 1
		[HideInInspector] _CullModeForward("Cull Mode Forward", Float) = 2
		[HideInInspector] [Enum(Front, 1, Back, 2)] _TransparentCullMode("Transparent Cull Mode", Float) = 2
		[HideInInspector] _ZTestDepthEqualForOpaque("ZTest Depth Equal For Opaque", Int) = 4
		[HideInInspector] [Enum(UnityEngine.Rendering.CompareFunction)] _ZTestTransparent("ZTest Transparent", Float) = 4
		[HideInInspector] [ToggleUI] _TransparentBackfaceEnable("Transparent Backface Enable", Float) = 0
		[HideInInspector] [ToggleUI] _AlphaCutoffEnable("Alpha Cutoff Enable", Float) = 0
		[HideInInspector] [ToggleUI] _UseShadowThreshold("Use Shadow Threshold", Float) = 0
		[HideInInspector] [ToggleUI] _DoubleSidedEnable("Double Sided Enable", Float) = 0
		[HideInInspector] [Enum(Flip, 0, Mirror, 1, None, 2)] _DoubleSidedNormalMode("Double Sided Normal Mode", Float) = 2
		[HideInInspector] _DoubleSidedConstants("DoubleSidedConstants", Vector) = (1,1,-1,0)
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="HDRenderPipeline" "RenderType"="Opaque" "Queue"="Geometry" }

		HLSLINCLUDE
		#pragma target 4.5
		#pragma only_renderers d3d11 ps4 xboxone vulkan metal switch
		#pragma multi_compile_instancing
		#pragma instancing_options renderinglayer

		struct GlobalSurfaceDescription // GBuffer Forward META TransparentBackface
		{
			float3 Albedo;
			float3 Normal;
			float3 BentNormal;
			float3 Specular;
			float CoatMask;
			float Metallic;
			float3 Emission;
			float Smoothness;
			float Occlusion;
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float AlphaClipThresholdDepthPrepass;
			float AlphaClipThresholdDepthPostpass;
			float SpecularAAScreenSpaceVariance;
			float SpecularAAThreshold;
			float SpecularOcclusion;
			float DepthOffset;
			//Refraction
			float RefractionIndex;
			float3 RefractionColor;
			float RefractionDistance;
			//SSS/Translucent
			float Thickness;
			float SubsurfaceMask;
			float DiffusionProfile;
			//Anisotropy
			float Anisotropy;
			float3 Tangent;
			//Iridescent
			float IridescenceMask;
			float IridescenceThickness;
			//BakedGI
			float3 BakedGI;
			float3 BakedBackGI;
		};

		struct AlphaSurfaceDescription // ShadowCaster
		{
			float Alpha;
			float AlphaClipThreshold;
			float AlphaClipThresholdShadow;
			float DepthOffset;
		};

		struct SceneSurfaceDescription // SceneSelection
		{
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct PrePassSurfaceDescription // DepthPrePass
		{
			float Alpha;
			float AlphaClipThresholdDepthPrepass;
			float DepthOffset;
		};

		struct PostPassSurfaceDescription //DepthPostPass
		{
			float Alpha;
			float AlphaClipThresholdDepthPostpass;
			float DepthOffset;
		};

		struct SmoothSurfaceDescription // MotionVectors DepthOnly
		{
			float3 Normal;
			float Smoothness;
			float Alpha;
			float AlphaClipThreshold;
			float DepthOffset;
		};

		struct DistortionSurfaceDescription //Distortion
		{
			float Alpha;
			float2 Distortion;
			float DistortionBlur;
			float AlphaClipThreshold;
		};

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlaneASE (float3 pos, float4 plane)
		{
			return dot (float4(pos,1.0f), plane);
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlaneASE(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlaneASE(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlaneASE(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlaneASE(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlaneASE(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDHLSL
		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="GBuffer" }

			Cull [_CullMode]
			ZTest [_ZTestGBuffer]

			Stencil
			{
				Ref [_StencilRefGBuffer]
				WriteMask [_StencilWriteMaskGBuffer]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile _ LIGHT_LAYERS

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _GradientColor;
			float4 _MRE1;
			float4 _MRE2;
			float4 _MRE3;
			float4 _MRE4;
			float4 _MRE5;
			float4 _MRE6;
			float4 _MRE7;
			float4 _MRE8;
			float4 _MRE9;
			float4 _MRE10;
			float4 _MRE11;
			float4 _MRE12;
			float4 _MRE13;
			float4 _MRE14;
			float4 _MRE15;
			float4 _Color16;
			float4 _Color15;
			float4 _Color14;
			float4 _Color13;
			float4 _Color1;
			float4 _Color2;
			float4 _Color3;
			float4 _MRE16;
			float4 _Color5;
			float4 _Color6;
			float4 _Color4;
			float4 _Color8;
			float4 _Color9;
			float4 _Color10;
			float4 _Color11;
			float4 _Color12;
			float4 _Color7;
			float _GradientPower;
			float _GradientOffset;
			float _GradientScale;
			float _GradientIntensity;
			float _EmissionPower1;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _Gradient;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				bentNormalWS = surfaceData.normalWS;
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				outputPackedVaryingsMeshToPS.ase_texcoord5.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput,
						OUTPUT_GBUFFER(outGBuffer)
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
						)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);
				SurfaceData surfaceData;
				BuiltinData builtinData;

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 texCoord255 = packedInput.ase_texcoord5.xy * float2( 1,4 ) + float2( 0,0 );
				float4 clampResult234 = clamp( ( ( tex2D( _Gradient, texCoord255 ) + _GradientColor ) + ( 1.0 - _GradientIntensity ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 saferPower258 = max( (clampResult234*_GradientScale + _GradientOffset) , 0.0001 );
				float4 temp_cast_0 = (_GradientPower).xxxx;
				float2 texCoord2_g707 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g707 = 1.0;
				float temp_output_7_0_g707 = 4.0;
				float temp_output_9_0_g707 = 4.0;
				float temp_output_8_0_g707 = 4.0;
				float2 texCoord2_g710 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g710 = 2.0;
				float temp_output_7_0_g710 = 4.0;
				float temp_output_9_0_g710 = 4.0;
				float temp_output_8_0_g710 = 4.0;
				float2 texCoord2_g709 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g709 = 3.0;
				float temp_output_7_0_g709 = 4.0;
				float temp_output_9_0_g709 = 4.0;
				float temp_output_8_0_g709 = 4.0;
				float2 texCoord2_g706 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g706 = 4.0;
				float temp_output_7_0_g706 = 4.0;
				float temp_output_9_0_g706 = 4.0;
				float temp_output_8_0_g706 = 4.0;
				float2 texCoord2_g699 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g699 = 1.0;
				float temp_output_7_0_g699 = 4.0;
				float temp_output_9_0_g699 = 3.0;
				float temp_output_8_0_g699 = 4.0;
				float2 texCoord2_g700 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g700 = 2.0;
				float temp_output_7_0_g700 = 4.0;
				float temp_output_9_0_g700 = 3.0;
				float temp_output_8_0_g700 = 4.0;
				float2 texCoord2_g704 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g704 = 3.0;
				float temp_output_7_0_g704 = 4.0;
				float temp_output_9_0_g704 = 3.0;
				float temp_output_8_0_g704 = 4.0;
				float2 texCoord2_g696 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g696 = 4.0;
				float temp_output_7_0_g696 = 4.0;
				float temp_output_9_0_g696 = 3.0;
				float temp_output_8_0_g696 = 4.0;
				float2 texCoord2_g703 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g703 = 1.0;
				float temp_output_7_0_g703 = 4.0;
				float temp_output_9_0_g703 = 2.0;
				float temp_output_8_0_g703 = 4.0;
				float2 texCoord2_g701 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g701 = 2.0;
				float temp_output_7_0_g701 = 4.0;
				float temp_output_9_0_g701 = 2.0;
				float temp_output_8_0_g701 = 4.0;
				float2 texCoord2_g697 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g697 = 3.0;
				float temp_output_7_0_g697 = 4.0;
				float temp_output_9_0_g697 = 2.0;
				float temp_output_8_0_g697 = 4.0;
				float2 texCoord2_g698 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g698 = 4.0;
				float temp_output_7_0_g698 = 4.0;
				float temp_output_9_0_g698 = 2.0;
				float temp_output_8_0_g698 = 4.0;
				float2 texCoord2_g708 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g708 = 1.0;
				float temp_output_7_0_g708 = 4.0;
				float temp_output_9_0_g708 = 1.0;
				float temp_output_8_0_g708 = 4.0;
				float2 texCoord2_g702 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g702 = 2.0;
				float temp_output_7_0_g702 = 4.0;
				float temp_output_9_0_g702 = 1.0;
				float temp_output_8_0_g702 = 4.0;
				float2 texCoord2_g705 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g705 = 3.0;
				float temp_output_7_0_g705 = 4.0;
				float temp_output_9_0_g705 = 1.0;
				float temp_output_8_0_g705 = 4.0;
				float2 texCoord2_g689 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g689 = 4.0;
				float temp_output_7_0_g689 = 4.0;
				float temp_output_9_0_g689 = 1.0;
				float temp_output_8_0_g689 = 4.0;
				float4 temp_output_155_0 = ( ( ( _Color1 * ( ( ( 1.0 - step( texCoord2_g707.x , ( ( temp_output_3_0_g707 - 1.0 ) / temp_output_7_0_g707 ) ) ) * ( step( texCoord2_g707.x , ( temp_output_3_0_g707 / temp_output_7_0_g707 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g707.y , ( ( temp_output_9_0_g707 - 1.0 ) / temp_output_8_0_g707 ) ) ) * ( step( texCoord2_g707.y , ( temp_output_9_0_g707 / temp_output_8_0_g707 ) ) * 1.0 ) ) ) ) + ( _Color2 * ( ( ( 1.0 - step( texCoord2_g710.x , ( ( temp_output_3_0_g710 - 1.0 ) / temp_output_7_0_g710 ) ) ) * ( step( texCoord2_g710.x , ( temp_output_3_0_g710 / temp_output_7_0_g710 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g710.y , ( ( temp_output_9_0_g710 - 1.0 ) / temp_output_8_0_g710 ) ) ) * ( step( texCoord2_g710.y , ( temp_output_9_0_g710 / temp_output_8_0_g710 ) ) * 1.0 ) ) ) ) + ( _Color3 * ( ( ( 1.0 - step( texCoord2_g709.x , ( ( temp_output_3_0_g709 - 1.0 ) / temp_output_7_0_g709 ) ) ) * ( step( texCoord2_g709.x , ( temp_output_3_0_g709 / temp_output_7_0_g709 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g709.y , ( ( temp_output_9_0_g709 - 1.0 ) / temp_output_8_0_g709 ) ) ) * ( step( texCoord2_g709.y , ( temp_output_9_0_g709 / temp_output_8_0_g709 ) ) * 1.0 ) ) ) ) + ( _Color4 * ( ( ( 1.0 - step( texCoord2_g706.x , ( ( temp_output_3_0_g706 - 1.0 ) / temp_output_7_0_g706 ) ) ) * ( step( texCoord2_g706.x , ( temp_output_3_0_g706 / temp_output_7_0_g706 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g706.y , ( ( temp_output_9_0_g706 - 1.0 ) / temp_output_8_0_g706 ) ) ) * ( step( texCoord2_g706.y , ( temp_output_9_0_g706 / temp_output_8_0_g706 ) ) * 1.0 ) ) ) ) ) + ( ( _Color5 * ( ( ( 1.0 - step( texCoord2_g699.x , ( ( temp_output_3_0_g699 - 1.0 ) / temp_output_7_0_g699 ) ) ) * ( step( texCoord2_g699.x , ( temp_output_3_0_g699 / temp_output_7_0_g699 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g699.y , ( ( temp_output_9_0_g699 - 1.0 ) / temp_output_8_0_g699 ) ) ) * ( step( texCoord2_g699.y , ( temp_output_9_0_g699 / temp_output_8_0_g699 ) ) * 1.0 ) ) ) ) + ( _Color6 * ( ( ( 1.0 - step( texCoord2_g700.x , ( ( temp_output_3_0_g700 - 1.0 ) / temp_output_7_0_g700 ) ) ) * ( step( texCoord2_g700.x , ( temp_output_3_0_g700 / temp_output_7_0_g700 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g700.y , ( ( temp_output_9_0_g700 - 1.0 ) / temp_output_8_0_g700 ) ) ) * ( step( texCoord2_g700.y , ( temp_output_9_0_g700 / temp_output_8_0_g700 ) ) * 1.0 ) ) ) ) + ( _Color7 * ( ( ( 1.0 - step( texCoord2_g704.x , ( ( temp_output_3_0_g704 - 1.0 ) / temp_output_7_0_g704 ) ) ) * ( step( texCoord2_g704.x , ( temp_output_3_0_g704 / temp_output_7_0_g704 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g704.y , ( ( temp_output_9_0_g704 - 1.0 ) / temp_output_8_0_g704 ) ) ) * ( step( texCoord2_g704.y , ( temp_output_9_0_g704 / temp_output_8_0_g704 ) ) * 1.0 ) ) ) ) + ( _Color8 * ( ( ( 1.0 - step( texCoord2_g696.x , ( ( temp_output_3_0_g696 - 1.0 ) / temp_output_7_0_g696 ) ) ) * ( step( texCoord2_g696.x , ( temp_output_3_0_g696 / temp_output_7_0_g696 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g696.y , ( ( temp_output_9_0_g696 - 1.0 ) / temp_output_8_0_g696 ) ) ) * ( step( texCoord2_g696.y , ( temp_output_9_0_g696 / temp_output_8_0_g696 ) ) * 1.0 ) ) ) ) ) + ( ( _Color9 * ( ( ( 1.0 - step( texCoord2_g703.x , ( ( temp_output_3_0_g703 - 1.0 ) / temp_output_7_0_g703 ) ) ) * ( step( texCoord2_g703.x , ( temp_output_3_0_g703 / temp_output_7_0_g703 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g703.y , ( ( temp_output_9_0_g703 - 1.0 ) / temp_output_8_0_g703 ) ) ) * ( step( texCoord2_g703.y , ( temp_output_9_0_g703 / temp_output_8_0_g703 ) ) * 1.0 ) ) ) ) + ( _Color10 * ( ( ( 1.0 - step( texCoord2_g701.x , ( ( temp_output_3_0_g701 - 1.0 ) / temp_output_7_0_g701 ) ) ) * ( step( texCoord2_g701.x , ( temp_output_3_0_g701 / temp_output_7_0_g701 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g701.y , ( ( temp_output_9_0_g701 - 1.0 ) / temp_output_8_0_g701 ) ) ) * ( step( texCoord2_g701.y , ( temp_output_9_0_g701 / temp_output_8_0_g701 ) ) * 1.0 ) ) ) ) + ( _Color11 * ( ( ( 1.0 - step( texCoord2_g697.x , ( ( temp_output_3_0_g697 - 1.0 ) / temp_output_7_0_g697 ) ) ) * ( step( texCoord2_g697.x , ( temp_output_3_0_g697 / temp_output_7_0_g697 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g697.y , ( ( temp_output_9_0_g697 - 1.0 ) / temp_output_8_0_g697 ) ) ) * ( step( texCoord2_g697.y , ( temp_output_9_0_g697 / temp_output_8_0_g697 ) ) * 1.0 ) ) ) ) + ( _Color12 * ( ( ( 1.0 - step( texCoord2_g698.x , ( ( temp_output_3_0_g698 - 1.0 ) / temp_output_7_0_g698 ) ) ) * ( step( texCoord2_g698.x , ( temp_output_3_0_g698 / temp_output_7_0_g698 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g698.y , ( ( temp_output_9_0_g698 - 1.0 ) / temp_output_8_0_g698 ) ) ) * ( step( texCoord2_g698.y , ( temp_output_9_0_g698 / temp_output_8_0_g698 ) ) * 1.0 ) ) ) ) ) + ( ( _Color13 * ( ( ( 1.0 - step( texCoord2_g708.x , ( ( temp_output_3_0_g708 - 1.0 ) / temp_output_7_0_g708 ) ) ) * ( step( texCoord2_g708.x , ( temp_output_3_0_g708 / temp_output_7_0_g708 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g708.y , ( ( temp_output_9_0_g708 - 1.0 ) / temp_output_8_0_g708 ) ) ) * ( step( texCoord2_g708.y , ( temp_output_9_0_g708 / temp_output_8_0_g708 ) ) * 1.0 ) ) ) ) + ( _Color14 * ( ( ( 1.0 - step( texCoord2_g702.x , ( ( temp_output_3_0_g702 - 1.0 ) / temp_output_7_0_g702 ) ) ) * ( step( texCoord2_g702.x , ( temp_output_3_0_g702 / temp_output_7_0_g702 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g702.y , ( ( temp_output_9_0_g702 - 1.0 ) / temp_output_8_0_g702 ) ) ) * ( step( texCoord2_g702.y , ( temp_output_9_0_g702 / temp_output_8_0_g702 ) ) * 1.0 ) ) ) ) + ( _Color15 * ( ( ( 1.0 - step( texCoord2_g705.x , ( ( temp_output_3_0_g705 - 1.0 ) / temp_output_7_0_g705 ) ) ) * ( step( texCoord2_g705.x , ( temp_output_3_0_g705 / temp_output_7_0_g705 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g705.y , ( ( temp_output_9_0_g705 - 1.0 ) / temp_output_8_0_g705 ) ) ) * ( step( texCoord2_g705.y , ( temp_output_9_0_g705 / temp_output_8_0_g705 ) ) * 1.0 ) ) ) ) + ( _Color16 * ( ( ( 1.0 - step( texCoord2_g689.x , ( ( temp_output_3_0_g689 - 1.0 ) / temp_output_7_0_g689 ) ) ) * ( step( texCoord2_g689.x , ( temp_output_3_0_g689 / temp_output_7_0_g689 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g689.y , ( ( temp_output_9_0_g689 - 1.0 ) / temp_output_8_0_g689 ) ) ) * ( step( texCoord2_g689.y , ( temp_output_9_0_g689 / temp_output_8_0_g689 ) ) * 1.0 ) ) ) ) ) );
				float4 clampResult261 = clamp( ( pow( saferPower258 , temp_cast_0 ) + ( 1.0 - (temp_output_155_0).a ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
				
				float2 texCoord2_g722 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g722 = 1.0;
				float temp_output_7_0_g722 = 4.0;
				float temp_output_9_0_g722 = 4.0;
				float temp_output_8_0_g722 = 4.0;
				float2 texCoord2_g735 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g735 = 2.0;
				float temp_output_7_0_g735 = 4.0;
				float temp_output_9_0_g735 = 4.0;
				float temp_output_8_0_g735 = 4.0;
				float2 texCoord2_g714 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g714 = 3.0;
				float temp_output_7_0_g714 = 4.0;
				float temp_output_9_0_g714 = 4.0;
				float temp_output_8_0_g714 = 4.0;
				float2 texCoord2_g730 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g730 = 4.0;
				float temp_output_7_0_g730 = 4.0;
				float temp_output_9_0_g730 = 4.0;
				float temp_output_8_0_g730 = 4.0;
				float2 texCoord2_g729 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g729 = 1.0;
				float temp_output_7_0_g729 = 4.0;
				float temp_output_9_0_g729 = 3.0;
				float temp_output_8_0_g729 = 4.0;
				float2 texCoord2_g727 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g727 = 2.0;
				float temp_output_7_0_g727 = 4.0;
				float temp_output_9_0_g727 = 3.0;
				float temp_output_8_0_g727 = 4.0;
				float2 texCoord2_g736 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g736 = 3.0;
				float temp_output_7_0_g736 = 4.0;
				float temp_output_9_0_g736 = 3.0;
				float temp_output_8_0_g736 = 4.0;
				float2 texCoord2_g726 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g726 = 4.0;
				float temp_output_7_0_g726 = 4.0;
				float temp_output_9_0_g726 = 3.0;
				float temp_output_8_0_g726 = 4.0;
				float2 texCoord2_g733 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g733 = 1.0;
				float temp_output_7_0_g733 = 4.0;
				float temp_output_9_0_g733 = 2.0;
				float temp_output_8_0_g733 = 4.0;
				float2 texCoord2_g728 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g728 = 2.0;
				float temp_output_7_0_g728 = 4.0;
				float temp_output_9_0_g728 = 2.0;
				float temp_output_8_0_g728 = 4.0;
				float2 texCoord2_g731 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g731 = 3.0;
				float temp_output_7_0_g731 = 4.0;
				float temp_output_9_0_g731 = 2.0;
				float temp_output_8_0_g731 = 4.0;
				float2 texCoord2_g734 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g734 = 4.0;
				float temp_output_7_0_g734 = 4.0;
				float temp_output_9_0_g734 = 2.0;
				float temp_output_8_0_g734 = 4.0;
				float2 texCoord2_g723 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g723 = 1.0;
				float temp_output_7_0_g723 = 4.0;
				float temp_output_9_0_g723 = 1.0;
				float temp_output_8_0_g723 = 4.0;
				float2 texCoord2_g725 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g725 = 2.0;
				float temp_output_7_0_g725 = 4.0;
				float temp_output_9_0_g725 = 1.0;
				float temp_output_8_0_g725 = 4.0;
				float2 texCoord2_g724 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g724 = 3.0;
				float temp_output_7_0_g724 = 4.0;
				float temp_output_9_0_g724 = 1.0;
				float temp_output_8_0_g724 = 4.0;
				float2 texCoord2_g732 = packedInput.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g732 = 4.0;
				float temp_output_7_0_g732 = 4.0;
				float temp_output_9_0_g732 = 1.0;
				float temp_output_8_0_g732 = 4.0;
				float4 temp_output_283_0 = ( ( ( _MRE1 * ( ( ( 1.0 - step( texCoord2_g722.x , ( ( temp_output_3_0_g722 - 1.0 ) / temp_output_7_0_g722 ) ) ) * ( step( texCoord2_g722.x , ( temp_output_3_0_g722 / temp_output_7_0_g722 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g722.y , ( ( temp_output_9_0_g722 - 1.0 ) / temp_output_8_0_g722 ) ) ) * ( step( texCoord2_g722.y , ( temp_output_9_0_g722 / temp_output_8_0_g722 ) ) * 1.0 ) ) ) ) + ( _MRE2 * ( ( ( 1.0 - step( texCoord2_g735.x , ( ( temp_output_3_0_g735 - 1.0 ) / temp_output_7_0_g735 ) ) ) * ( step( texCoord2_g735.x , ( temp_output_3_0_g735 / temp_output_7_0_g735 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g735.y , ( ( temp_output_9_0_g735 - 1.0 ) / temp_output_8_0_g735 ) ) ) * ( step( texCoord2_g735.y , ( temp_output_9_0_g735 / temp_output_8_0_g735 ) ) * 1.0 ) ) ) ) + ( _MRE3 * ( ( ( 1.0 - step( texCoord2_g714.x , ( ( temp_output_3_0_g714 - 1.0 ) / temp_output_7_0_g714 ) ) ) * ( step( texCoord2_g714.x , ( temp_output_3_0_g714 / temp_output_7_0_g714 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g714.y , ( ( temp_output_9_0_g714 - 1.0 ) / temp_output_8_0_g714 ) ) ) * ( step( texCoord2_g714.y , ( temp_output_9_0_g714 / temp_output_8_0_g714 ) ) * 1.0 ) ) ) ) + ( _MRE4 * ( ( ( 1.0 - step( texCoord2_g730.x , ( ( temp_output_3_0_g730 - 1.0 ) / temp_output_7_0_g730 ) ) ) * ( step( texCoord2_g730.x , ( temp_output_3_0_g730 / temp_output_7_0_g730 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g730.y , ( ( temp_output_9_0_g730 - 1.0 ) / temp_output_8_0_g730 ) ) ) * ( step( texCoord2_g730.y , ( temp_output_9_0_g730 / temp_output_8_0_g730 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE5 * ( ( ( 1.0 - step( texCoord2_g729.x , ( ( temp_output_3_0_g729 - 1.0 ) / temp_output_7_0_g729 ) ) ) * ( step( texCoord2_g729.x , ( temp_output_3_0_g729 / temp_output_7_0_g729 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g729.y , ( ( temp_output_9_0_g729 - 1.0 ) / temp_output_8_0_g729 ) ) ) * ( step( texCoord2_g729.y , ( temp_output_9_0_g729 / temp_output_8_0_g729 ) ) * 1.0 ) ) ) ) + ( _MRE6 * ( ( ( 1.0 - step( texCoord2_g727.x , ( ( temp_output_3_0_g727 - 1.0 ) / temp_output_7_0_g727 ) ) ) * ( step( texCoord2_g727.x , ( temp_output_3_0_g727 / temp_output_7_0_g727 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g727.y , ( ( temp_output_9_0_g727 - 1.0 ) / temp_output_8_0_g727 ) ) ) * ( step( texCoord2_g727.y , ( temp_output_9_0_g727 / temp_output_8_0_g727 ) ) * 1.0 ) ) ) ) + ( _MRE7 * ( ( ( 1.0 - step( texCoord2_g736.x , ( ( temp_output_3_0_g736 - 1.0 ) / temp_output_7_0_g736 ) ) ) * ( step( texCoord2_g736.x , ( temp_output_3_0_g736 / temp_output_7_0_g736 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g736.y , ( ( temp_output_9_0_g736 - 1.0 ) / temp_output_8_0_g736 ) ) ) * ( step( texCoord2_g736.y , ( temp_output_9_0_g736 / temp_output_8_0_g736 ) ) * 1.0 ) ) ) ) + ( _MRE8 * ( ( ( 1.0 - step( texCoord2_g726.x , ( ( temp_output_3_0_g726 - 1.0 ) / temp_output_7_0_g726 ) ) ) * ( step( texCoord2_g726.x , ( temp_output_3_0_g726 / temp_output_7_0_g726 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g726.y , ( ( temp_output_9_0_g726 - 1.0 ) / temp_output_8_0_g726 ) ) ) * ( step( texCoord2_g726.y , ( temp_output_9_0_g726 / temp_output_8_0_g726 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE9 * ( ( ( 1.0 - step( texCoord2_g733.x , ( ( temp_output_3_0_g733 - 1.0 ) / temp_output_7_0_g733 ) ) ) * ( step( texCoord2_g733.x , ( temp_output_3_0_g733 / temp_output_7_0_g733 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g733.y , ( ( temp_output_9_0_g733 - 1.0 ) / temp_output_8_0_g733 ) ) ) * ( step( texCoord2_g733.y , ( temp_output_9_0_g733 / temp_output_8_0_g733 ) ) * 1.0 ) ) ) ) + ( _MRE10 * ( ( ( 1.0 - step( texCoord2_g728.x , ( ( temp_output_3_0_g728 - 1.0 ) / temp_output_7_0_g728 ) ) ) * ( step( texCoord2_g728.x , ( temp_output_3_0_g728 / temp_output_7_0_g728 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g728.y , ( ( temp_output_9_0_g728 - 1.0 ) / temp_output_8_0_g728 ) ) ) * ( step( texCoord2_g728.y , ( temp_output_9_0_g728 / temp_output_8_0_g728 ) ) * 1.0 ) ) ) ) + ( _MRE11 * ( ( ( 1.0 - step( texCoord2_g731.x , ( ( temp_output_3_0_g731 - 1.0 ) / temp_output_7_0_g731 ) ) ) * ( step( texCoord2_g731.x , ( temp_output_3_0_g731 / temp_output_7_0_g731 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g731.y , ( ( temp_output_9_0_g731 - 1.0 ) / temp_output_8_0_g731 ) ) ) * ( step( texCoord2_g731.y , ( temp_output_9_0_g731 / temp_output_8_0_g731 ) ) * 1.0 ) ) ) ) + ( _MRE12 * ( ( ( 1.0 - step( texCoord2_g734.x , ( ( temp_output_3_0_g734 - 1.0 ) / temp_output_7_0_g734 ) ) ) * ( step( texCoord2_g734.x , ( temp_output_3_0_g734 / temp_output_7_0_g734 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g734.y , ( ( temp_output_9_0_g734 - 1.0 ) / temp_output_8_0_g734 ) ) ) * ( step( texCoord2_g734.y , ( temp_output_9_0_g734 / temp_output_8_0_g734 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE13 * ( ( ( 1.0 - step( texCoord2_g723.x , ( ( temp_output_3_0_g723 - 1.0 ) / temp_output_7_0_g723 ) ) ) * ( step( texCoord2_g723.x , ( temp_output_3_0_g723 / temp_output_7_0_g723 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g723.y , ( ( temp_output_9_0_g723 - 1.0 ) / temp_output_8_0_g723 ) ) ) * ( step( texCoord2_g723.y , ( temp_output_9_0_g723 / temp_output_8_0_g723 ) ) * 1.0 ) ) ) ) + ( _MRE14 * ( ( ( 1.0 - step( texCoord2_g725.x , ( ( temp_output_3_0_g725 - 1.0 ) / temp_output_7_0_g725 ) ) ) * ( step( texCoord2_g725.x , ( temp_output_3_0_g725 / temp_output_7_0_g725 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g725.y , ( ( temp_output_9_0_g725 - 1.0 ) / temp_output_8_0_g725 ) ) ) * ( step( texCoord2_g725.y , ( temp_output_9_0_g725 / temp_output_8_0_g725 ) ) * 1.0 ) ) ) ) + ( _MRE15 * ( ( ( 1.0 - step( texCoord2_g724.x , ( ( temp_output_3_0_g724 - 1.0 ) / temp_output_7_0_g724 ) ) ) * ( step( texCoord2_g724.x , ( temp_output_3_0_g724 / temp_output_7_0_g724 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g724.y , ( ( temp_output_9_0_g724 - 1.0 ) / temp_output_8_0_g724 ) ) ) * ( step( texCoord2_g724.y , ( temp_output_9_0_g724 / temp_output_8_0_g724 ) ) * 1.0 ) ) ) ) + ( _MRE16 * ( ( ( 1.0 - step( texCoord2_g732.x , ( ( temp_output_3_0_g732 - 1.0 ) / temp_output_7_0_g732 ) ) ) * ( step( texCoord2_g732.x , ( temp_output_3_0_g732 / temp_output_7_0_g732 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g732.y , ( ( temp_output_9_0_g732 - 1.0 ) / temp_output_8_0_g732 ) ) ) * ( step( texCoord2_g732.y , ( temp_output_9_0_g732 / temp_output_8_0_g732 ) ) * 1.0 ) ) ) ) ) );
				
				surfaceDescription.Albedo = ( clampResult261 * temp_output_155_0 ).rgb;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = (temp_output_283_0).r;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = ( temp_output_155_0 * ( _EmissionPower1 * (temp_output_283_0).b ) ).rgb;
				surfaceDescription.Smoothness = ( 1.0 - (temp_output_283_0).g );
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				surfaceDescription.AlphaClipThresholdDepthPrepass = 0.5;
				surfaceDescription.AlphaClipThresholdDepthPostpass = 0.5;

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_DISTORTION
				surfaceDescription.Distortion = float2 ( 2, -1 );
				surfaceDescription.DistortionBlur = 1;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );
				ENCODE_INTO_GBUFFER( surfaceData, builtinData, posInput.positionSS, outGBuffer );
				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "META"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _GradientColor;
			float4 _MRE1;
			float4 _MRE2;
			float4 _MRE3;
			float4 _MRE4;
			float4 _MRE5;
			float4 _MRE6;
			float4 _MRE7;
			float4 _MRE8;
			float4 _MRE9;
			float4 _MRE10;
			float4 _MRE11;
			float4 _MRE12;
			float4 _MRE13;
			float4 _MRE14;
			float4 _MRE15;
			float4 _Color16;
			float4 _Color15;
			float4 _Color14;
			float4 _Color13;
			float4 _Color1;
			float4 _Color2;
			float4 _Color3;
			float4 _MRE16;
			float4 _Color5;
			float4 _Color6;
			float4 _Color4;
			float4 _Color8;
			float4 _Color9;
			float4 _Color10;
			float4 _Color11;
			float4 _Color12;
			float4 _Color7;
			float _GradientPower;
			float _GradientOffset;
			float _GradientScale;
			float _GradientIntensity;
			float _EmissionPower1;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _Gradient;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				bentNormalWS = surfaceData.normalWS;
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				builtinData.emissiveColor = surfaceDescription.Emission;

				#if (SHADERPASS == SHADERPASS_DISTORTION)
				builtinData.distortion = surfaceDescription.Distortion;
				builtinData.distortionBlur = surfaceDescription.DistortionBlur;
				#else
				builtinData.distortion = float2(0.0, 0.0);
				builtinData.distortionBlur = 0.0;
				#endif

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			CBUFFER_START(UnityMetaPass)
			bool4 unity_MetaVertexControl;
			bool4 unity_MetaFragmentControl;
			CBUFFER_END

			float unity_OneOverOutputBoost;
			float unity_MaxOutputValue;

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh  )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);

				outputPackedVaryingsMeshToPS.ase_texcoord.xy = inputMesh.uv0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float2 uv = float2(0.0, 0.0);
				if (unity_MetaVertexControl.x)
				{
					uv = inputMesh.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				}
				else if (unity_MetaVertexControl.y)
				{
					uv = inputMesh.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				}

				outputPackedVaryingsMeshToPS.positionCS = float4(uv * 2.0 - 1.0, inputMesh.positionOS.z > 0 ? 1.0e-4 : 0.0, 1.0);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv0 : TEXCOORD0;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv0 = v.uv0;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv0 = patch[0].uv0 * bary.x + patch[1].uv0 * bary.y + patch[2].uv0 * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			float4 Frag(PackedVaryingsMeshToPS packedInput  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);
				float3 V = float3(1.0, 1.0, 1.0);

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 texCoord255 = packedInput.ase_texcoord.xy * float2( 1,4 ) + float2( 0,0 );
				float4 clampResult234 = clamp( ( ( tex2D( _Gradient, texCoord255 ) + _GradientColor ) + ( 1.0 - _GradientIntensity ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 saferPower258 = max( (clampResult234*_GradientScale + _GradientOffset) , 0.0001 );
				float4 temp_cast_0 = (_GradientPower).xxxx;
				float2 texCoord2_g707 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g707 = 1.0;
				float temp_output_7_0_g707 = 4.0;
				float temp_output_9_0_g707 = 4.0;
				float temp_output_8_0_g707 = 4.0;
				float2 texCoord2_g710 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g710 = 2.0;
				float temp_output_7_0_g710 = 4.0;
				float temp_output_9_0_g710 = 4.0;
				float temp_output_8_0_g710 = 4.0;
				float2 texCoord2_g709 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g709 = 3.0;
				float temp_output_7_0_g709 = 4.0;
				float temp_output_9_0_g709 = 4.0;
				float temp_output_8_0_g709 = 4.0;
				float2 texCoord2_g706 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g706 = 4.0;
				float temp_output_7_0_g706 = 4.0;
				float temp_output_9_0_g706 = 4.0;
				float temp_output_8_0_g706 = 4.0;
				float2 texCoord2_g699 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g699 = 1.0;
				float temp_output_7_0_g699 = 4.0;
				float temp_output_9_0_g699 = 3.0;
				float temp_output_8_0_g699 = 4.0;
				float2 texCoord2_g700 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g700 = 2.0;
				float temp_output_7_0_g700 = 4.0;
				float temp_output_9_0_g700 = 3.0;
				float temp_output_8_0_g700 = 4.0;
				float2 texCoord2_g704 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g704 = 3.0;
				float temp_output_7_0_g704 = 4.0;
				float temp_output_9_0_g704 = 3.0;
				float temp_output_8_0_g704 = 4.0;
				float2 texCoord2_g696 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g696 = 4.0;
				float temp_output_7_0_g696 = 4.0;
				float temp_output_9_0_g696 = 3.0;
				float temp_output_8_0_g696 = 4.0;
				float2 texCoord2_g703 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g703 = 1.0;
				float temp_output_7_0_g703 = 4.0;
				float temp_output_9_0_g703 = 2.0;
				float temp_output_8_0_g703 = 4.0;
				float2 texCoord2_g701 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g701 = 2.0;
				float temp_output_7_0_g701 = 4.0;
				float temp_output_9_0_g701 = 2.0;
				float temp_output_8_0_g701 = 4.0;
				float2 texCoord2_g697 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g697 = 3.0;
				float temp_output_7_0_g697 = 4.0;
				float temp_output_9_0_g697 = 2.0;
				float temp_output_8_0_g697 = 4.0;
				float2 texCoord2_g698 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g698 = 4.0;
				float temp_output_7_0_g698 = 4.0;
				float temp_output_9_0_g698 = 2.0;
				float temp_output_8_0_g698 = 4.0;
				float2 texCoord2_g708 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g708 = 1.0;
				float temp_output_7_0_g708 = 4.0;
				float temp_output_9_0_g708 = 1.0;
				float temp_output_8_0_g708 = 4.0;
				float2 texCoord2_g702 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g702 = 2.0;
				float temp_output_7_0_g702 = 4.0;
				float temp_output_9_0_g702 = 1.0;
				float temp_output_8_0_g702 = 4.0;
				float2 texCoord2_g705 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g705 = 3.0;
				float temp_output_7_0_g705 = 4.0;
				float temp_output_9_0_g705 = 1.0;
				float temp_output_8_0_g705 = 4.0;
				float2 texCoord2_g689 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g689 = 4.0;
				float temp_output_7_0_g689 = 4.0;
				float temp_output_9_0_g689 = 1.0;
				float temp_output_8_0_g689 = 4.0;
				float4 temp_output_155_0 = ( ( ( _Color1 * ( ( ( 1.0 - step( texCoord2_g707.x , ( ( temp_output_3_0_g707 - 1.0 ) / temp_output_7_0_g707 ) ) ) * ( step( texCoord2_g707.x , ( temp_output_3_0_g707 / temp_output_7_0_g707 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g707.y , ( ( temp_output_9_0_g707 - 1.0 ) / temp_output_8_0_g707 ) ) ) * ( step( texCoord2_g707.y , ( temp_output_9_0_g707 / temp_output_8_0_g707 ) ) * 1.0 ) ) ) ) + ( _Color2 * ( ( ( 1.0 - step( texCoord2_g710.x , ( ( temp_output_3_0_g710 - 1.0 ) / temp_output_7_0_g710 ) ) ) * ( step( texCoord2_g710.x , ( temp_output_3_0_g710 / temp_output_7_0_g710 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g710.y , ( ( temp_output_9_0_g710 - 1.0 ) / temp_output_8_0_g710 ) ) ) * ( step( texCoord2_g710.y , ( temp_output_9_0_g710 / temp_output_8_0_g710 ) ) * 1.0 ) ) ) ) + ( _Color3 * ( ( ( 1.0 - step( texCoord2_g709.x , ( ( temp_output_3_0_g709 - 1.0 ) / temp_output_7_0_g709 ) ) ) * ( step( texCoord2_g709.x , ( temp_output_3_0_g709 / temp_output_7_0_g709 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g709.y , ( ( temp_output_9_0_g709 - 1.0 ) / temp_output_8_0_g709 ) ) ) * ( step( texCoord2_g709.y , ( temp_output_9_0_g709 / temp_output_8_0_g709 ) ) * 1.0 ) ) ) ) + ( _Color4 * ( ( ( 1.0 - step( texCoord2_g706.x , ( ( temp_output_3_0_g706 - 1.0 ) / temp_output_7_0_g706 ) ) ) * ( step( texCoord2_g706.x , ( temp_output_3_0_g706 / temp_output_7_0_g706 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g706.y , ( ( temp_output_9_0_g706 - 1.0 ) / temp_output_8_0_g706 ) ) ) * ( step( texCoord2_g706.y , ( temp_output_9_0_g706 / temp_output_8_0_g706 ) ) * 1.0 ) ) ) ) ) + ( ( _Color5 * ( ( ( 1.0 - step( texCoord2_g699.x , ( ( temp_output_3_0_g699 - 1.0 ) / temp_output_7_0_g699 ) ) ) * ( step( texCoord2_g699.x , ( temp_output_3_0_g699 / temp_output_7_0_g699 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g699.y , ( ( temp_output_9_0_g699 - 1.0 ) / temp_output_8_0_g699 ) ) ) * ( step( texCoord2_g699.y , ( temp_output_9_0_g699 / temp_output_8_0_g699 ) ) * 1.0 ) ) ) ) + ( _Color6 * ( ( ( 1.0 - step( texCoord2_g700.x , ( ( temp_output_3_0_g700 - 1.0 ) / temp_output_7_0_g700 ) ) ) * ( step( texCoord2_g700.x , ( temp_output_3_0_g700 / temp_output_7_0_g700 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g700.y , ( ( temp_output_9_0_g700 - 1.0 ) / temp_output_8_0_g700 ) ) ) * ( step( texCoord2_g700.y , ( temp_output_9_0_g700 / temp_output_8_0_g700 ) ) * 1.0 ) ) ) ) + ( _Color7 * ( ( ( 1.0 - step( texCoord2_g704.x , ( ( temp_output_3_0_g704 - 1.0 ) / temp_output_7_0_g704 ) ) ) * ( step( texCoord2_g704.x , ( temp_output_3_0_g704 / temp_output_7_0_g704 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g704.y , ( ( temp_output_9_0_g704 - 1.0 ) / temp_output_8_0_g704 ) ) ) * ( step( texCoord2_g704.y , ( temp_output_9_0_g704 / temp_output_8_0_g704 ) ) * 1.0 ) ) ) ) + ( _Color8 * ( ( ( 1.0 - step( texCoord2_g696.x , ( ( temp_output_3_0_g696 - 1.0 ) / temp_output_7_0_g696 ) ) ) * ( step( texCoord2_g696.x , ( temp_output_3_0_g696 / temp_output_7_0_g696 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g696.y , ( ( temp_output_9_0_g696 - 1.0 ) / temp_output_8_0_g696 ) ) ) * ( step( texCoord2_g696.y , ( temp_output_9_0_g696 / temp_output_8_0_g696 ) ) * 1.0 ) ) ) ) ) + ( ( _Color9 * ( ( ( 1.0 - step( texCoord2_g703.x , ( ( temp_output_3_0_g703 - 1.0 ) / temp_output_7_0_g703 ) ) ) * ( step( texCoord2_g703.x , ( temp_output_3_0_g703 / temp_output_7_0_g703 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g703.y , ( ( temp_output_9_0_g703 - 1.0 ) / temp_output_8_0_g703 ) ) ) * ( step( texCoord2_g703.y , ( temp_output_9_0_g703 / temp_output_8_0_g703 ) ) * 1.0 ) ) ) ) + ( _Color10 * ( ( ( 1.0 - step( texCoord2_g701.x , ( ( temp_output_3_0_g701 - 1.0 ) / temp_output_7_0_g701 ) ) ) * ( step( texCoord2_g701.x , ( temp_output_3_0_g701 / temp_output_7_0_g701 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g701.y , ( ( temp_output_9_0_g701 - 1.0 ) / temp_output_8_0_g701 ) ) ) * ( step( texCoord2_g701.y , ( temp_output_9_0_g701 / temp_output_8_0_g701 ) ) * 1.0 ) ) ) ) + ( _Color11 * ( ( ( 1.0 - step( texCoord2_g697.x , ( ( temp_output_3_0_g697 - 1.0 ) / temp_output_7_0_g697 ) ) ) * ( step( texCoord2_g697.x , ( temp_output_3_0_g697 / temp_output_7_0_g697 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g697.y , ( ( temp_output_9_0_g697 - 1.0 ) / temp_output_8_0_g697 ) ) ) * ( step( texCoord2_g697.y , ( temp_output_9_0_g697 / temp_output_8_0_g697 ) ) * 1.0 ) ) ) ) + ( _Color12 * ( ( ( 1.0 - step( texCoord2_g698.x , ( ( temp_output_3_0_g698 - 1.0 ) / temp_output_7_0_g698 ) ) ) * ( step( texCoord2_g698.x , ( temp_output_3_0_g698 / temp_output_7_0_g698 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g698.y , ( ( temp_output_9_0_g698 - 1.0 ) / temp_output_8_0_g698 ) ) ) * ( step( texCoord2_g698.y , ( temp_output_9_0_g698 / temp_output_8_0_g698 ) ) * 1.0 ) ) ) ) ) + ( ( _Color13 * ( ( ( 1.0 - step( texCoord2_g708.x , ( ( temp_output_3_0_g708 - 1.0 ) / temp_output_7_0_g708 ) ) ) * ( step( texCoord2_g708.x , ( temp_output_3_0_g708 / temp_output_7_0_g708 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g708.y , ( ( temp_output_9_0_g708 - 1.0 ) / temp_output_8_0_g708 ) ) ) * ( step( texCoord2_g708.y , ( temp_output_9_0_g708 / temp_output_8_0_g708 ) ) * 1.0 ) ) ) ) + ( _Color14 * ( ( ( 1.0 - step( texCoord2_g702.x , ( ( temp_output_3_0_g702 - 1.0 ) / temp_output_7_0_g702 ) ) ) * ( step( texCoord2_g702.x , ( temp_output_3_0_g702 / temp_output_7_0_g702 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g702.y , ( ( temp_output_9_0_g702 - 1.0 ) / temp_output_8_0_g702 ) ) ) * ( step( texCoord2_g702.y , ( temp_output_9_0_g702 / temp_output_8_0_g702 ) ) * 1.0 ) ) ) ) + ( _Color15 * ( ( ( 1.0 - step( texCoord2_g705.x , ( ( temp_output_3_0_g705 - 1.0 ) / temp_output_7_0_g705 ) ) ) * ( step( texCoord2_g705.x , ( temp_output_3_0_g705 / temp_output_7_0_g705 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g705.y , ( ( temp_output_9_0_g705 - 1.0 ) / temp_output_8_0_g705 ) ) ) * ( step( texCoord2_g705.y , ( temp_output_9_0_g705 / temp_output_8_0_g705 ) ) * 1.0 ) ) ) ) + ( _Color16 * ( ( ( 1.0 - step( texCoord2_g689.x , ( ( temp_output_3_0_g689 - 1.0 ) / temp_output_7_0_g689 ) ) ) * ( step( texCoord2_g689.x , ( temp_output_3_0_g689 / temp_output_7_0_g689 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g689.y , ( ( temp_output_9_0_g689 - 1.0 ) / temp_output_8_0_g689 ) ) ) * ( step( texCoord2_g689.y , ( temp_output_9_0_g689 / temp_output_8_0_g689 ) ) * 1.0 ) ) ) ) ) );
				float4 clampResult261 = clamp( ( pow( saferPower258 , temp_cast_0 ) + ( 1.0 - (temp_output_155_0).a ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
				
				float2 texCoord2_g722 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g722 = 1.0;
				float temp_output_7_0_g722 = 4.0;
				float temp_output_9_0_g722 = 4.0;
				float temp_output_8_0_g722 = 4.0;
				float2 texCoord2_g735 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g735 = 2.0;
				float temp_output_7_0_g735 = 4.0;
				float temp_output_9_0_g735 = 4.0;
				float temp_output_8_0_g735 = 4.0;
				float2 texCoord2_g714 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g714 = 3.0;
				float temp_output_7_0_g714 = 4.0;
				float temp_output_9_0_g714 = 4.0;
				float temp_output_8_0_g714 = 4.0;
				float2 texCoord2_g730 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g730 = 4.0;
				float temp_output_7_0_g730 = 4.0;
				float temp_output_9_0_g730 = 4.0;
				float temp_output_8_0_g730 = 4.0;
				float2 texCoord2_g729 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g729 = 1.0;
				float temp_output_7_0_g729 = 4.0;
				float temp_output_9_0_g729 = 3.0;
				float temp_output_8_0_g729 = 4.0;
				float2 texCoord2_g727 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g727 = 2.0;
				float temp_output_7_0_g727 = 4.0;
				float temp_output_9_0_g727 = 3.0;
				float temp_output_8_0_g727 = 4.0;
				float2 texCoord2_g736 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g736 = 3.0;
				float temp_output_7_0_g736 = 4.0;
				float temp_output_9_0_g736 = 3.0;
				float temp_output_8_0_g736 = 4.0;
				float2 texCoord2_g726 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g726 = 4.0;
				float temp_output_7_0_g726 = 4.0;
				float temp_output_9_0_g726 = 3.0;
				float temp_output_8_0_g726 = 4.0;
				float2 texCoord2_g733 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g733 = 1.0;
				float temp_output_7_0_g733 = 4.0;
				float temp_output_9_0_g733 = 2.0;
				float temp_output_8_0_g733 = 4.0;
				float2 texCoord2_g728 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g728 = 2.0;
				float temp_output_7_0_g728 = 4.0;
				float temp_output_9_0_g728 = 2.0;
				float temp_output_8_0_g728 = 4.0;
				float2 texCoord2_g731 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g731 = 3.0;
				float temp_output_7_0_g731 = 4.0;
				float temp_output_9_0_g731 = 2.0;
				float temp_output_8_0_g731 = 4.0;
				float2 texCoord2_g734 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g734 = 4.0;
				float temp_output_7_0_g734 = 4.0;
				float temp_output_9_0_g734 = 2.0;
				float temp_output_8_0_g734 = 4.0;
				float2 texCoord2_g723 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g723 = 1.0;
				float temp_output_7_0_g723 = 4.0;
				float temp_output_9_0_g723 = 1.0;
				float temp_output_8_0_g723 = 4.0;
				float2 texCoord2_g725 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g725 = 2.0;
				float temp_output_7_0_g725 = 4.0;
				float temp_output_9_0_g725 = 1.0;
				float temp_output_8_0_g725 = 4.0;
				float2 texCoord2_g724 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g724 = 3.0;
				float temp_output_7_0_g724 = 4.0;
				float temp_output_9_0_g724 = 1.0;
				float temp_output_8_0_g724 = 4.0;
				float2 texCoord2_g732 = packedInput.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g732 = 4.0;
				float temp_output_7_0_g732 = 4.0;
				float temp_output_9_0_g732 = 1.0;
				float temp_output_8_0_g732 = 4.0;
				float4 temp_output_283_0 = ( ( ( _MRE1 * ( ( ( 1.0 - step( texCoord2_g722.x , ( ( temp_output_3_0_g722 - 1.0 ) / temp_output_7_0_g722 ) ) ) * ( step( texCoord2_g722.x , ( temp_output_3_0_g722 / temp_output_7_0_g722 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g722.y , ( ( temp_output_9_0_g722 - 1.0 ) / temp_output_8_0_g722 ) ) ) * ( step( texCoord2_g722.y , ( temp_output_9_0_g722 / temp_output_8_0_g722 ) ) * 1.0 ) ) ) ) + ( _MRE2 * ( ( ( 1.0 - step( texCoord2_g735.x , ( ( temp_output_3_0_g735 - 1.0 ) / temp_output_7_0_g735 ) ) ) * ( step( texCoord2_g735.x , ( temp_output_3_0_g735 / temp_output_7_0_g735 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g735.y , ( ( temp_output_9_0_g735 - 1.0 ) / temp_output_8_0_g735 ) ) ) * ( step( texCoord2_g735.y , ( temp_output_9_0_g735 / temp_output_8_0_g735 ) ) * 1.0 ) ) ) ) + ( _MRE3 * ( ( ( 1.0 - step( texCoord2_g714.x , ( ( temp_output_3_0_g714 - 1.0 ) / temp_output_7_0_g714 ) ) ) * ( step( texCoord2_g714.x , ( temp_output_3_0_g714 / temp_output_7_0_g714 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g714.y , ( ( temp_output_9_0_g714 - 1.0 ) / temp_output_8_0_g714 ) ) ) * ( step( texCoord2_g714.y , ( temp_output_9_0_g714 / temp_output_8_0_g714 ) ) * 1.0 ) ) ) ) + ( _MRE4 * ( ( ( 1.0 - step( texCoord2_g730.x , ( ( temp_output_3_0_g730 - 1.0 ) / temp_output_7_0_g730 ) ) ) * ( step( texCoord2_g730.x , ( temp_output_3_0_g730 / temp_output_7_0_g730 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g730.y , ( ( temp_output_9_0_g730 - 1.0 ) / temp_output_8_0_g730 ) ) ) * ( step( texCoord2_g730.y , ( temp_output_9_0_g730 / temp_output_8_0_g730 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE5 * ( ( ( 1.0 - step( texCoord2_g729.x , ( ( temp_output_3_0_g729 - 1.0 ) / temp_output_7_0_g729 ) ) ) * ( step( texCoord2_g729.x , ( temp_output_3_0_g729 / temp_output_7_0_g729 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g729.y , ( ( temp_output_9_0_g729 - 1.0 ) / temp_output_8_0_g729 ) ) ) * ( step( texCoord2_g729.y , ( temp_output_9_0_g729 / temp_output_8_0_g729 ) ) * 1.0 ) ) ) ) + ( _MRE6 * ( ( ( 1.0 - step( texCoord2_g727.x , ( ( temp_output_3_0_g727 - 1.0 ) / temp_output_7_0_g727 ) ) ) * ( step( texCoord2_g727.x , ( temp_output_3_0_g727 / temp_output_7_0_g727 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g727.y , ( ( temp_output_9_0_g727 - 1.0 ) / temp_output_8_0_g727 ) ) ) * ( step( texCoord2_g727.y , ( temp_output_9_0_g727 / temp_output_8_0_g727 ) ) * 1.0 ) ) ) ) + ( _MRE7 * ( ( ( 1.0 - step( texCoord2_g736.x , ( ( temp_output_3_0_g736 - 1.0 ) / temp_output_7_0_g736 ) ) ) * ( step( texCoord2_g736.x , ( temp_output_3_0_g736 / temp_output_7_0_g736 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g736.y , ( ( temp_output_9_0_g736 - 1.0 ) / temp_output_8_0_g736 ) ) ) * ( step( texCoord2_g736.y , ( temp_output_9_0_g736 / temp_output_8_0_g736 ) ) * 1.0 ) ) ) ) + ( _MRE8 * ( ( ( 1.0 - step( texCoord2_g726.x , ( ( temp_output_3_0_g726 - 1.0 ) / temp_output_7_0_g726 ) ) ) * ( step( texCoord2_g726.x , ( temp_output_3_0_g726 / temp_output_7_0_g726 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g726.y , ( ( temp_output_9_0_g726 - 1.0 ) / temp_output_8_0_g726 ) ) ) * ( step( texCoord2_g726.y , ( temp_output_9_0_g726 / temp_output_8_0_g726 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE9 * ( ( ( 1.0 - step( texCoord2_g733.x , ( ( temp_output_3_0_g733 - 1.0 ) / temp_output_7_0_g733 ) ) ) * ( step( texCoord2_g733.x , ( temp_output_3_0_g733 / temp_output_7_0_g733 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g733.y , ( ( temp_output_9_0_g733 - 1.0 ) / temp_output_8_0_g733 ) ) ) * ( step( texCoord2_g733.y , ( temp_output_9_0_g733 / temp_output_8_0_g733 ) ) * 1.0 ) ) ) ) + ( _MRE10 * ( ( ( 1.0 - step( texCoord2_g728.x , ( ( temp_output_3_0_g728 - 1.0 ) / temp_output_7_0_g728 ) ) ) * ( step( texCoord2_g728.x , ( temp_output_3_0_g728 / temp_output_7_0_g728 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g728.y , ( ( temp_output_9_0_g728 - 1.0 ) / temp_output_8_0_g728 ) ) ) * ( step( texCoord2_g728.y , ( temp_output_9_0_g728 / temp_output_8_0_g728 ) ) * 1.0 ) ) ) ) + ( _MRE11 * ( ( ( 1.0 - step( texCoord2_g731.x , ( ( temp_output_3_0_g731 - 1.0 ) / temp_output_7_0_g731 ) ) ) * ( step( texCoord2_g731.x , ( temp_output_3_0_g731 / temp_output_7_0_g731 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g731.y , ( ( temp_output_9_0_g731 - 1.0 ) / temp_output_8_0_g731 ) ) ) * ( step( texCoord2_g731.y , ( temp_output_9_0_g731 / temp_output_8_0_g731 ) ) * 1.0 ) ) ) ) + ( _MRE12 * ( ( ( 1.0 - step( texCoord2_g734.x , ( ( temp_output_3_0_g734 - 1.0 ) / temp_output_7_0_g734 ) ) ) * ( step( texCoord2_g734.x , ( temp_output_3_0_g734 / temp_output_7_0_g734 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g734.y , ( ( temp_output_9_0_g734 - 1.0 ) / temp_output_8_0_g734 ) ) ) * ( step( texCoord2_g734.y , ( temp_output_9_0_g734 / temp_output_8_0_g734 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE13 * ( ( ( 1.0 - step( texCoord2_g723.x , ( ( temp_output_3_0_g723 - 1.0 ) / temp_output_7_0_g723 ) ) ) * ( step( texCoord2_g723.x , ( temp_output_3_0_g723 / temp_output_7_0_g723 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g723.y , ( ( temp_output_9_0_g723 - 1.0 ) / temp_output_8_0_g723 ) ) ) * ( step( texCoord2_g723.y , ( temp_output_9_0_g723 / temp_output_8_0_g723 ) ) * 1.0 ) ) ) ) + ( _MRE14 * ( ( ( 1.0 - step( texCoord2_g725.x , ( ( temp_output_3_0_g725 - 1.0 ) / temp_output_7_0_g725 ) ) ) * ( step( texCoord2_g725.x , ( temp_output_3_0_g725 / temp_output_7_0_g725 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g725.y , ( ( temp_output_9_0_g725 - 1.0 ) / temp_output_8_0_g725 ) ) ) * ( step( texCoord2_g725.y , ( temp_output_9_0_g725 / temp_output_8_0_g725 ) ) * 1.0 ) ) ) ) + ( _MRE15 * ( ( ( 1.0 - step( texCoord2_g724.x , ( ( temp_output_3_0_g724 - 1.0 ) / temp_output_7_0_g724 ) ) ) * ( step( texCoord2_g724.x , ( temp_output_3_0_g724 / temp_output_7_0_g724 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g724.y , ( ( temp_output_9_0_g724 - 1.0 ) / temp_output_8_0_g724 ) ) ) * ( step( texCoord2_g724.y , ( temp_output_9_0_g724 / temp_output_8_0_g724 ) ) * 1.0 ) ) ) ) + ( _MRE16 * ( ( ( 1.0 - step( texCoord2_g732.x , ( ( temp_output_3_0_g732 - 1.0 ) / temp_output_7_0_g732 ) ) ) * ( step( texCoord2_g732.x , ( temp_output_3_0_g732 / temp_output_7_0_g732 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g732.y , ( ( temp_output_9_0_g732 - 1.0 ) / temp_output_8_0_g732 ) ) ) * ( step( texCoord2_g732.y , ( temp_output_9_0_g732 / temp_output_8_0_g732 ) ) * 1.0 ) ) ) ) ) );
				
				surfaceDescription.Albedo = ( clampResult261 * temp_output_155_0 ).rgb;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = (temp_output_283_0).r;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = ( temp_output_155_0 * ( _EmissionPower1 * (temp_output_283_0).b ) ).rgb;
				surfaceDescription.Smoothness = ( 1.0 - (temp_output_283_0).g );
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);
				LightTransportData lightTransportData = GetLightTransportData(surfaceData, builtinData, bsdfData);

				float4 res = float4(0.0, 0.0, 0.0, 1.0);
				if (unity_MetaFragmentControl.x)
				{
					res.rgb = clamp(pow(abs(lightTransportData.diffuseColor), saturate(unity_OneOverOutputBoost)), 0, unity_MaxOutputValue);
				}

				if (unity_MetaFragmentControl.y)
				{
					res.rgb = lightTransportData.emissiveColor;
				}

				return res;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			Cull [_CullMode]
			ZWrite On
			ZClip [_ZClip]
			ZTest LEqual
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_SHADOWS

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			//#define USE_LEGACY_UNITY_MATRIX_VARIABLES

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _GradientColor;
			float4 _MRE1;
			float4 _MRE2;
			float4 _MRE3;
			float4 _MRE4;
			float4 _MRE5;
			float4 _MRE6;
			float4 _MRE7;
			float4 _MRE8;
			float4 _MRE9;
			float4 _MRE10;
			float4 _MRE11;
			float4 _MRE12;
			float4 _MRE13;
			float4 _MRE14;
			float4 _MRE15;
			float4 _Color16;
			float4 _Color15;
			float4 _Color14;
			float4 _Color13;
			float4 _Color1;
			float4 _Color2;
			float4 _Color3;
			float4 _MRE16;
			float4 _Color5;
			float4 _Color6;
			float4 _Color4;
			float4 _Color8;
			float4 _Color9;
			float4 _Color10;
			float4 _Color11;
			float4 _Color12;
			float4 _Color7;
			float _GradientPower;
			float _GradientOffset;
			float _GradientScale;
			float _GradientIntensity;
			float _EmissionPower1;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			
			void BuildSurfaceData(FragInputs fragInputs, inout AlphaSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				bentNormalWS = surfaceData.normalWS;

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(AlphaSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				#ifdef _ALPHATEST_SHADOW_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThresholdShadow );
				#else
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif
			
			void Frag( PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target0
							#ifdef WRITE_MSAA_DEPTH
							, out float1 depthColor : SV_Target1
							#endif
						#elif defined(WRITE_MSAA_DEPTH)
						, out float4 outNormalBuffer : SV_Target0
						, out float1 depthColor : SV_Target1
						#elif defined(SCENESELECTIONPASS)
						, out float4 outColor : SV_Target0
						#endif
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				AlphaSurfaceDescription surfaceDescription = (AlphaSurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ALPHATEST_SHADOW_ON
				surfaceDescription.AlphaClipThresholdShadow = 0.5;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }
			ColorMask 0

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#define SCENESELECTIONPASS
			#pragma editor_sync_compilation

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			CBUFFER_START( UnityPerMaterial )
			float4 _GradientColor;
			float4 _MRE1;
			float4 _MRE2;
			float4 _MRE3;
			float4 _MRE4;
			float4 _MRE5;
			float4 _MRE6;
			float4 _MRE7;
			float4 _MRE8;
			float4 _MRE9;
			float4 _MRE10;
			float4 _MRE11;
			float4 _MRE12;
			float4 _MRE13;
			float4 _MRE14;
			float4 _MRE15;
			float4 _Color16;
			float4 _Color15;
			float4 _Color14;
			float4 _Color13;
			float4 _Color1;
			float4 _Color2;
			float4 _Color3;
			float4 _MRE16;
			float4 _Color5;
			float4 _Color6;
			float4 _Color4;
			float4 _Color8;
			float4 _Color9;
			float4 _Color10;
			float4 _Color11;
			float4 _Color12;
			float4 _Color7;
			float _GradientPower;
			float _GradientOffset;
			float _GradientScale;
			float _GradientIntensity;
			float _EmissionPower1;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			int _ObjectId;
			int _PassValue;

			
			void BuildSurfaceData(FragInputs fragInputs, inout SceneSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				bentNormalWS = surfaceData.normalWS;

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SceneSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;
				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target0
							#ifdef WRITE_MSAA_DEPTH
							, out float1 depthColor : SV_Target1
							#endif
						#elif defined(WRITE_MSAA_DEPTH)
						, out float4 outNormalBuffer : SV_Target0
						, out float1 depthColor : SV_Target1
						#elif defined(SCENESELECTIONPASS)
						, out float4 outColor : SV_Target0
						#endif
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SceneSurfaceDescription surfaceDescription = (SceneSurfaceDescription)0;
				
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefDepth]
				WriteMask [_StencilWriteMaskDepth]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_DEPTH_ONLY
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _GradientColor;
			float4 _MRE1;
			float4 _MRE2;
			float4 _MRE3;
			float4 _MRE4;
			float4 _MRE5;
			float4 _MRE6;
			float4 _MRE7;
			float4 _MRE8;
			float4 _MRE9;
			float4 _MRE10;
			float4 _MRE11;
			float4 _MRE12;
			float4 _MRE13;
			float4 _MRE14;
			float4 _MRE15;
			float4 _Color16;
			float4 _Color15;
			float4 _Color14;
			float4 _Color13;
			float4 _Color1;
			float4 _Color2;
			float4 _Color3;
			float4 _MRE16;
			float4 _Color5;
			float4 _Color6;
			float4 _Color4;
			float4 _Color8;
			float4 _Color9;
			float4 _Color10;
			float4 _Color11;
			float4 _Color12;
			float4 _Color7;
			float _GradientPower;
			float _GradientOffset;
			float _GradientScale;
			float _GradientIntensity;
			float _EmissionPower1;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			
			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				bentNormalWS = surfaceData.normalWS;

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh )
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif

				inputMesh.normalOS =  inputMesh.normalOS ;
				inputMesh.tangentOS =  inputMesh.tangentOS ;

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				return outputPackedVaryingsMeshToPS;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
						#ifdef WRITE_NORMAL_BUFFER
						, out float4 outNormalBuffer : SV_Target0
							#ifdef WRITE_MSAA_DEPTH
							, out float1 depthColor : SV_Target1
							#endif
						#elif defined(WRITE_MSAA_DEPTH)
						, out float4 outNormalBuffer : SV_Target0
						, out float1 depthColor : SV_Target1
						#elif defined(SCENESELECTIONPASS)
						, out float4 outColor : SV_Target0
						#endif
						#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
						#endif
						
					)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );

				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);

				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;

				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false );
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 texCoord2_g722 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g722 = 1.0;
				float temp_output_7_0_g722 = 4.0;
				float temp_output_9_0_g722 = 4.0;
				float temp_output_8_0_g722 = 4.0;
				float2 texCoord2_g735 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g735 = 2.0;
				float temp_output_7_0_g735 = 4.0;
				float temp_output_9_0_g735 = 4.0;
				float temp_output_8_0_g735 = 4.0;
				float2 texCoord2_g714 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g714 = 3.0;
				float temp_output_7_0_g714 = 4.0;
				float temp_output_9_0_g714 = 4.0;
				float temp_output_8_0_g714 = 4.0;
				float2 texCoord2_g730 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g730 = 4.0;
				float temp_output_7_0_g730 = 4.0;
				float temp_output_9_0_g730 = 4.0;
				float temp_output_8_0_g730 = 4.0;
				float2 texCoord2_g729 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g729 = 1.0;
				float temp_output_7_0_g729 = 4.0;
				float temp_output_9_0_g729 = 3.0;
				float temp_output_8_0_g729 = 4.0;
				float2 texCoord2_g727 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g727 = 2.0;
				float temp_output_7_0_g727 = 4.0;
				float temp_output_9_0_g727 = 3.0;
				float temp_output_8_0_g727 = 4.0;
				float2 texCoord2_g736 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g736 = 3.0;
				float temp_output_7_0_g736 = 4.0;
				float temp_output_9_0_g736 = 3.0;
				float temp_output_8_0_g736 = 4.0;
				float2 texCoord2_g726 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g726 = 4.0;
				float temp_output_7_0_g726 = 4.0;
				float temp_output_9_0_g726 = 3.0;
				float temp_output_8_0_g726 = 4.0;
				float2 texCoord2_g733 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g733 = 1.0;
				float temp_output_7_0_g733 = 4.0;
				float temp_output_9_0_g733 = 2.0;
				float temp_output_8_0_g733 = 4.0;
				float2 texCoord2_g728 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g728 = 2.0;
				float temp_output_7_0_g728 = 4.0;
				float temp_output_9_0_g728 = 2.0;
				float temp_output_8_0_g728 = 4.0;
				float2 texCoord2_g731 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g731 = 3.0;
				float temp_output_7_0_g731 = 4.0;
				float temp_output_9_0_g731 = 2.0;
				float temp_output_8_0_g731 = 4.0;
				float2 texCoord2_g734 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g734 = 4.0;
				float temp_output_7_0_g734 = 4.0;
				float temp_output_9_0_g734 = 2.0;
				float temp_output_8_0_g734 = 4.0;
				float2 texCoord2_g723 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g723 = 1.0;
				float temp_output_7_0_g723 = 4.0;
				float temp_output_9_0_g723 = 1.0;
				float temp_output_8_0_g723 = 4.0;
				float2 texCoord2_g725 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g725 = 2.0;
				float temp_output_7_0_g725 = 4.0;
				float temp_output_9_0_g725 = 1.0;
				float temp_output_8_0_g725 = 4.0;
				float2 texCoord2_g724 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g724 = 3.0;
				float temp_output_7_0_g724 = 4.0;
				float temp_output_9_0_g724 = 1.0;
				float temp_output_8_0_g724 = 4.0;
				float2 texCoord2_g732 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g732 = 4.0;
				float temp_output_7_0_g732 = 4.0;
				float temp_output_9_0_g732 = 1.0;
				float temp_output_8_0_g732 = 4.0;
				float4 temp_output_283_0 = ( ( ( _MRE1 * ( ( ( 1.0 - step( texCoord2_g722.x , ( ( temp_output_3_0_g722 - 1.0 ) / temp_output_7_0_g722 ) ) ) * ( step( texCoord2_g722.x , ( temp_output_3_0_g722 / temp_output_7_0_g722 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g722.y , ( ( temp_output_9_0_g722 - 1.0 ) / temp_output_8_0_g722 ) ) ) * ( step( texCoord2_g722.y , ( temp_output_9_0_g722 / temp_output_8_0_g722 ) ) * 1.0 ) ) ) ) + ( _MRE2 * ( ( ( 1.0 - step( texCoord2_g735.x , ( ( temp_output_3_0_g735 - 1.0 ) / temp_output_7_0_g735 ) ) ) * ( step( texCoord2_g735.x , ( temp_output_3_0_g735 / temp_output_7_0_g735 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g735.y , ( ( temp_output_9_0_g735 - 1.0 ) / temp_output_8_0_g735 ) ) ) * ( step( texCoord2_g735.y , ( temp_output_9_0_g735 / temp_output_8_0_g735 ) ) * 1.0 ) ) ) ) + ( _MRE3 * ( ( ( 1.0 - step( texCoord2_g714.x , ( ( temp_output_3_0_g714 - 1.0 ) / temp_output_7_0_g714 ) ) ) * ( step( texCoord2_g714.x , ( temp_output_3_0_g714 / temp_output_7_0_g714 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g714.y , ( ( temp_output_9_0_g714 - 1.0 ) / temp_output_8_0_g714 ) ) ) * ( step( texCoord2_g714.y , ( temp_output_9_0_g714 / temp_output_8_0_g714 ) ) * 1.0 ) ) ) ) + ( _MRE4 * ( ( ( 1.0 - step( texCoord2_g730.x , ( ( temp_output_3_0_g730 - 1.0 ) / temp_output_7_0_g730 ) ) ) * ( step( texCoord2_g730.x , ( temp_output_3_0_g730 / temp_output_7_0_g730 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g730.y , ( ( temp_output_9_0_g730 - 1.0 ) / temp_output_8_0_g730 ) ) ) * ( step( texCoord2_g730.y , ( temp_output_9_0_g730 / temp_output_8_0_g730 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE5 * ( ( ( 1.0 - step( texCoord2_g729.x , ( ( temp_output_3_0_g729 - 1.0 ) / temp_output_7_0_g729 ) ) ) * ( step( texCoord2_g729.x , ( temp_output_3_0_g729 / temp_output_7_0_g729 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g729.y , ( ( temp_output_9_0_g729 - 1.0 ) / temp_output_8_0_g729 ) ) ) * ( step( texCoord2_g729.y , ( temp_output_9_0_g729 / temp_output_8_0_g729 ) ) * 1.0 ) ) ) ) + ( _MRE6 * ( ( ( 1.0 - step( texCoord2_g727.x , ( ( temp_output_3_0_g727 - 1.0 ) / temp_output_7_0_g727 ) ) ) * ( step( texCoord2_g727.x , ( temp_output_3_0_g727 / temp_output_7_0_g727 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g727.y , ( ( temp_output_9_0_g727 - 1.0 ) / temp_output_8_0_g727 ) ) ) * ( step( texCoord2_g727.y , ( temp_output_9_0_g727 / temp_output_8_0_g727 ) ) * 1.0 ) ) ) ) + ( _MRE7 * ( ( ( 1.0 - step( texCoord2_g736.x , ( ( temp_output_3_0_g736 - 1.0 ) / temp_output_7_0_g736 ) ) ) * ( step( texCoord2_g736.x , ( temp_output_3_0_g736 / temp_output_7_0_g736 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g736.y , ( ( temp_output_9_0_g736 - 1.0 ) / temp_output_8_0_g736 ) ) ) * ( step( texCoord2_g736.y , ( temp_output_9_0_g736 / temp_output_8_0_g736 ) ) * 1.0 ) ) ) ) + ( _MRE8 * ( ( ( 1.0 - step( texCoord2_g726.x , ( ( temp_output_3_0_g726 - 1.0 ) / temp_output_7_0_g726 ) ) ) * ( step( texCoord2_g726.x , ( temp_output_3_0_g726 / temp_output_7_0_g726 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g726.y , ( ( temp_output_9_0_g726 - 1.0 ) / temp_output_8_0_g726 ) ) ) * ( step( texCoord2_g726.y , ( temp_output_9_0_g726 / temp_output_8_0_g726 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE9 * ( ( ( 1.0 - step( texCoord2_g733.x , ( ( temp_output_3_0_g733 - 1.0 ) / temp_output_7_0_g733 ) ) ) * ( step( texCoord2_g733.x , ( temp_output_3_0_g733 / temp_output_7_0_g733 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g733.y , ( ( temp_output_9_0_g733 - 1.0 ) / temp_output_8_0_g733 ) ) ) * ( step( texCoord2_g733.y , ( temp_output_9_0_g733 / temp_output_8_0_g733 ) ) * 1.0 ) ) ) ) + ( _MRE10 * ( ( ( 1.0 - step( texCoord2_g728.x , ( ( temp_output_3_0_g728 - 1.0 ) / temp_output_7_0_g728 ) ) ) * ( step( texCoord2_g728.x , ( temp_output_3_0_g728 / temp_output_7_0_g728 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g728.y , ( ( temp_output_9_0_g728 - 1.0 ) / temp_output_8_0_g728 ) ) ) * ( step( texCoord2_g728.y , ( temp_output_9_0_g728 / temp_output_8_0_g728 ) ) * 1.0 ) ) ) ) + ( _MRE11 * ( ( ( 1.0 - step( texCoord2_g731.x , ( ( temp_output_3_0_g731 - 1.0 ) / temp_output_7_0_g731 ) ) ) * ( step( texCoord2_g731.x , ( temp_output_3_0_g731 / temp_output_7_0_g731 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g731.y , ( ( temp_output_9_0_g731 - 1.0 ) / temp_output_8_0_g731 ) ) ) * ( step( texCoord2_g731.y , ( temp_output_9_0_g731 / temp_output_8_0_g731 ) ) * 1.0 ) ) ) ) + ( _MRE12 * ( ( ( 1.0 - step( texCoord2_g734.x , ( ( temp_output_3_0_g734 - 1.0 ) / temp_output_7_0_g734 ) ) ) * ( step( texCoord2_g734.x , ( temp_output_3_0_g734 / temp_output_7_0_g734 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g734.y , ( ( temp_output_9_0_g734 - 1.0 ) / temp_output_8_0_g734 ) ) ) * ( step( texCoord2_g734.y , ( temp_output_9_0_g734 / temp_output_8_0_g734 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE13 * ( ( ( 1.0 - step( texCoord2_g723.x , ( ( temp_output_3_0_g723 - 1.0 ) / temp_output_7_0_g723 ) ) ) * ( step( texCoord2_g723.x , ( temp_output_3_0_g723 / temp_output_7_0_g723 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g723.y , ( ( temp_output_9_0_g723 - 1.0 ) / temp_output_8_0_g723 ) ) ) * ( step( texCoord2_g723.y , ( temp_output_9_0_g723 / temp_output_8_0_g723 ) ) * 1.0 ) ) ) ) + ( _MRE14 * ( ( ( 1.0 - step( texCoord2_g725.x , ( ( temp_output_3_0_g725 - 1.0 ) / temp_output_7_0_g725 ) ) ) * ( step( texCoord2_g725.x , ( temp_output_3_0_g725 / temp_output_7_0_g725 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g725.y , ( ( temp_output_9_0_g725 - 1.0 ) / temp_output_8_0_g725 ) ) ) * ( step( texCoord2_g725.y , ( temp_output_9_0_g725 / temp_output_8_0_g725 ) ) * 1.0 ) ) ) ) + ( _MRE15 * ( ( ( 1.0 - step( texCoord2_g724.x , ( ( temp_output_3_0_g724 - 1.0 ) / temp_output_7_0_g724 ) ) ) * ( step( texCoord2_g724.x , ( temp_output_3_0_g724 / temp_output_7_0_g724 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g724.y , ( ( temp_output_9_0_g724 - 1.0 ) / temp_output_8_0_g724 ) ) ) * ( step( texCoord2_g724.y , ( temp_output_9_0_g724 / temp_output_8_0_g724 ) ) * 1.0 ) ) ) ) + ( _MRE16 * ( ( ( 1.0 - step( texCoord2_g732.x , ( ( temp_output_3_0_g732 - 1.0 ) / temp_output_7_0_g732 ) ) ) * ( step( texCoord2_g732.x , ( temp_output_3_0_g732 / temp_output_7_0_g732 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g732.y , ( ( temp_output_9_0_g732 - 1.0 ) / temp_output_8_0_g732 ) ) ) * ( step( texCoord2_g732.y , ( temp_output_9_0_g732 / temp_output_8_0_g732 ) ) * 1.0 ) ) ) ) ) );
				
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.Smoothness = ( 1.0 - (temp_output_283_0).g );
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription, input, V, posInput, surfaceData, builtinData);

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );
				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.positionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.positionCS.z;
				#elif defined(SCENESELECTIONPASS)
				outColor = float4( _ObjectId, _PassValue, 1.0, 1.0 );
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Motion Vectors"
			Tags { "LightMode"="MotionVectors" }

			Cull [_CullMode]

			ZWrite On

			Stencil
			{
				Ref [_StencilRefMV]
				WriteMask [_StencilWriteMaskMV]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#define SHADERPASS SHADERPASS_MOTION_VECTORS
			#pragma multi_compile _ WRITE_NORMAL_BUFFER
			#pragma multi_compile _ WRITE_MSAA_DEPTH

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif
			
			CBUFFER_START( UnityPerMaterial )
			float4 _GradientColor;
			float4 _MRE1;
			float4 _MRE2;
			float4 _MRE3;
			float4 _MRE4;
			float4 _MRE5;
			float4 _MRE6;
			float4 _MRE7;
			float4 _MRE8;
			float4 _MRE9;
			float4 _MRE10;
			float4 _MRE11;
			float4 _MRE12;
			float4 _MRE13;
			float4 _MRE14;
			float4 _MRE15;
			float4 _Color16;
			float4 _Color15;
			float4 _Color14;
			float4 _Color13;
			float4 _Color1;
			float4 _Color2;
			float4 _Color3;
			float4 _MRE16;
			float4 _Color5;
			float4 _Color6;
			float4 _Color4;
			float4 _Color8;
			float4 _Color9;
			float4 _Color10;
			float4 _Color11;
			float4 _Color12;
			float4 _Color7;
			float _GradientPower;
			float _GradientOffset;
			float _GradientScale;
			float _GradientIntensity;
			float _EmissionPower1;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif


			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 vmeshPositionCS : SV_Position;
				float3 vmeshInterp00 : TEXCOORD0;
				float3 vpassInterpolators0 : TEXCOORD1; //interpolators0
				float3 vpassInterpolators1 : TEXCOORD2; //interpolators1
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};


			
			void BuildSurfaceData(FragInputs fragInputs, inout SmoothSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				bentNormalWS = surfaceData.normalWS;

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(SmoothSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				outputPackedVaryingsMeshToPS.ase_texcoord3.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue =  defaultVertexValue ;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS =  inputMesh.normalOS ;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);

				float3 VMESHpositionRWS = positionRWS;
				float4 VMESHpositionCS = TransformWorldToHClip(positionRWS);

				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(VMESHpositionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}

				outputPackedVaryingsMeshToPS.vmeshPositionCS = VMESHpositionCS;
				outputPackedVaryingsMeshToPS.vmeshInterp00.xyz = VMESHpositionRWS;

				outputPackedVaryingsMeshToPS.vpassInterpolators0 = float3(VPASSpositionCS.xyw);
				outputPackedVaryingsMeshToPS.vpassInterpolators1 = float3(VPASSpreviousPositionCS.xyw);
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float3 previousPositionOS : TEXCOORD4;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					float3 precomputedVelocity : TEXCOORD5;
				#endif
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.previousPositionOS = v.previousPositionOS;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
				o.precomputedVelocity = v.precomputedVelocity;
				#endif
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
				#if defined (_ADD_PRECOMPUTED_VELOCITY)
					o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
				#endif
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag( PackedVaryingsMeshToPS packedInput
				, out float4 outMotionVector : SV_Target0
				#ifdef WRITE_NORMAL_BUFFER
				, out float4 outNormalBuffer : SV_Target1
					#ifdef WRITE_MSAA_DEPTH
						, out float1 depthColor : SV_Target2
					#endif
				#elif defined(WRITE_MSAA_DEPTH)
				, out float4 outNormalBuffer : SV_Target1
				, out float1 depthColor : SV_Target2
				#endif

				#ifdef _DEPTHOFFSET_ON
					, out float outputDepth : SV_Depth
				#endif
				
				)
			{
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.vmeshPositionCS;
				input.positionRWS = packedInput.vmeshInterp00.xyz;

				PositionInputs posInput = GetPositionInput(input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS);

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				SurfaceData surfaceData;
				BuiltinData builtinData;

				SmoothSurfaceDescription surfaceDescription = (SmoothSurfaceDescription)0;
				float2 texCoord2_g722 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g722 = 1.0;
				float temp_output_7_0_g722 = 4.0;
				float temp_output_9_0_g722 = 4.0;
				float temp_output_8_0_g722 = 4.0;
				float2 texCoord2_g735 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g735 = 2.0;
				float temp_output_7_0_g735 = 4.0;
				float temp_output_9_0_g735 = 4.0;
				float temp_output_8_0_g735 = 4.0;
				float2 texCoord2_g714 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g714 = 3.0;
				float temp_output_7_0_g714 = 4.0;
				float temp_output_9_0_g714 = 4.0;
				float temp_output_8_0_g714 = 4.0;
				float2 texCoord2_g730 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g730 = 4.0;
				float temp_output_7_0_g730 = 4.0;
				float temp_output_9_0_g730 = 4.0;
				float temp_output_8_0_g730 = 4.0;
				float2 texCoord2_g729 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g729 = 1.0;
				float temp_output_7_0_g729 = 4.0;
				float temp_output_9_0_g729 = 3.0;
				float temp_output_8_0_g729 = 4.0;
				float2 texCoord2_g727 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g727 = 2.0;
				float temp_output_7_0_g727 = 4.0;
				float temp_output_9_0_g727 = 3.0;
				float temp_output_8_0_g727 = 4.0;
				float2 texCoord2_g736 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g736 = 3.0;
				float temp_output_7_0_g736 = 4.0;
				float temp_output_9_0_g736 = 3.0;
				float temp_output_8_0_g736 = 4.0;
				float2 texCoord2_g726 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g726 = 4.0;
				float temp_output_7_0_g726 = 4.0;
				float temp_output_9_0_g726 = 3.0;
				float temp_output_8_0_g726 = 4.0;
				float2 texCoord2_g733 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g733 = 1.0;
				float temp_output_7_0_g733 = 4.0;
				float temp_output_9_0_g733 = 2.0;
				float temp_output_8_0_g733 = 4.0;
				float2 texCoord2_g728 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g728 = 2.0;
				float temp_output_7_0_g728 = 4.0;
				float temp_output_9_0_g728 = 2.0;
				float temp_output_8_0_g728 = 4.0;
				float2 texCoord2_g731 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g731 = 3.0;
				float temp_output_7_0_g731 = 4.0;
				float temp_output_9_0_g731 = 2.0;
				float temp_output_8_0_g731 = 4.0;
				float2 texCoord2_g734 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g734 = 4.0;
				float temp_output_7_0_g734 = 4.0;
				float temp_output_9_0_g734 = 2.0;
				float temp_output_8_0_g734 = 4.0;
				float2 texCoord2_g723 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g723 = 1.0;
				float temp_output_7_0_g723 = 4.0;
				float temp_output_9_0_g723 = 1.0;
				float temp_output_8_0_g723 = 4.0;
				float2 texCoord2_g725 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g725 = 2.0;
				float temp_output_7_0_g725 = 4.0;
				float temp_output_9_0_g725 = 1.0;
				float temp_output_8_0_g725 = 4.0;
				float2 texCoord2_g724 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g724 = 3.0;
				float temp_output_7_0_g724 = 4.0;
				float temp_output_9_0_g724 = 1.0;
				float temp_output_8_0_g724 = 4.0;
				float2 texCoord2_g732 = packedInput.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g732 = 4.0;
				float temp_output_7_0_g732 = 4.0;
				float temp_output_9_0_g732 = 1.0;
				float temp_output_8_0_g732 = 4.0;
				float4 temp_output_283_0 = ( ( ( _MRE1 * ( ( ( 1.0 - step( texCoord2_g722.x , ( ( temp_output_3_0_g722 - 1.0 ) / temp_output_7_0_g722 ) ) ) * ( step( texCoord2_g722.x , ( temp_output_3_0_g722 / temp_output_7_0_g722 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g722.y , ( ( temp_output_9_0_g722 - 1.0 ) / temp_output_8_0_g722 ) ) ) * ( step( texCoord2_g722.y , ( temp_output_9_0_g722 / temp_output_8_0_g722 ) ) * 1.0 ) ) ) ) + ( _MRE2 * ( ( ( 1.0 - step( texCoord2_g735.x , ( ( temp_output_3_0_g735 - 1.0 ) / temp_output_7_0_g735 ) ) ) * ( step( texCoord2_g735.x , ( temp_output_3_0_g735 / temp_output_7_0_g735 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g735.y , ( ( temp_output_9_0_g735 - 1.0 ) / temp_output_8_0_g735 ) ) ) * ( step( texCoord2_g735.y , ( temp_output_9_0_g735 / temp_output_8_0_g735 ) ) * 1.0 ) ) ) ) + ( _MRE3 * ( ( ( 1.0 - step( texCoord2_g714.x , ( ( temp_output_3_0_g714 - 1.0 ) / temp_output_7_0_g714 ) ) ) * ( step( texCoord2_g714.x , ( temp_output_3_0_g714 / temp_output_7_0_g714 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g714.y , ( ( temp_output_9_0_g714 - 1.0 ) / temp_output_8_0_g714 ) ) ) * ( step( texCoord2_g714.y , ( temp_output_9_0_g714 / temp_output_8_0_g714 ) ) * 1.0 ) ) ) ) + ( _MRE4 * ( ( ( 1.0 - step( texCoord2_g730.x , ( ( temp_output_3_0_g730 - 1.0 ) / temp_output_7_0_g730 ) ) ) * ( step( texCoord2_g730.x , ( temp_output_3_0_g730 / temp_output_7_0_g730 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g730.y , ( ( temp_output_9_0_g730 - 1.0 ) / temp_output_8_0_g730 ) ) ) * ( step( texCoord2_g730.y , ( temp_output_9_0_g730 / temp_output_8_0_g730 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE5 * ( ( ( 1.0 - step( texCoord2_g729.x , ( ( temp_output_3_0_g729 - 1.0 ) / temp_output_7_0_g729 ) ) ) * ( step( texCoord2_g729.x , ( temp_output_3_0_g729 / temp_output_7_0_g729 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g729.y , ( ( temp_output_9_0_g729 - 1.0 ) / temp_output_8_0_g729 ) ) ) * ( step( texCoord2_g729.y , ( temp_output_9_0_g729 / temp_output_8_0_g729 ) ) * 1.0 ) ) ) ) + ( _MRE6 * ( ( ( 1.0 - step( texCoord2_g727.x , ( ( temp_output_3_0_g727 - 1.0 ) / temp_output_7_0_g727 ) ) ) * ( step( texCoord2_g727.x , ( temp_output_3_0_g727 / temp_output_7_0_g727 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g727.y , ( ( temp_output_9_0_g727 - 1.0 ) / temp_output_8_0_g727 ) ) ) * ( step( texCoord2_g727.y , ( temp_output_9_0_g727 / temp_output_8_0_g727 ) ) * 1.0 ) ) ) ) + ( _MRE7 * ( ( ( 1.0 - step( texCoord2_g736.x , ( ( temp_output_3_0_g736 - 1.0 ) / temp_output_7_0_g736 ) ) ) * ( step( texCoord2_g736.x , ( temp_output_3_0_g736 / temp_output_7_0_g736 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g736.y , ( ( temp_output_9_0_g736 - 1.0 ) / temp_output_8_0_g736 ) ) ) * ( step( texCoord2_g736.y , ( temp_output_9_0_g736 / temp_output_8_0_g736 ) ) * 1.0 ) ) ) ) + ( _MRE8 * ( ( ( 1.0 - step( texCoord2_g726.x , ( ( temp_output_3_0_g726 - 1.0 ) / temp_output_7_0_g726 ) ) ) * ( step( texCoord2_g726.x , ( temp_output_3_0_g726 / temp_output_7_0_g726 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g726.y , ( ( temp_output_9_0_g726 - 1.0 ) / temp_output_8_0_g726 ) ) ) * ( step( texCoord2_g726.y , ( temp_output_9_0_g726 / temp_output_8_0_g726 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE9 * ( ( ( 1.0 - step( texCoord2_g733.x , ( ( temp_output_3_0_g733 - 1.0 ) / temp_output_7_0_g733 ) ) ) * ( step( texCoord2_g733.x , ( temp_output_3_0_g733 / temp_output_7_0_g733 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g733.y , ( ( temp_output_9_0_g733 - 1.0 ) / temp_output_8_0_g733 ) ) ) * ( step( texCoord2_g733.y , ( temp_output_9_0_g733 / temp_output_8_0_g733 ) ) * 1.0 ) ) ) ) + ( _MRE10 * ( ( ( 1.0 - step( texCoord2_g728.x , ( ( temp_output_3_0_g728 - 1.0 ) / temp_output_7_0_g728 ) ) ) * ( step( texCoord2_g728.x , ( temp_output_3_0_g728 / temp_output_7_0_g728 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g728.y , ( ( temp_output_9_0_g728 - 1.0 ) / temp_output_8_0_g728 ) ) ) * ( step( texCoord2_g728.y , ( temp_output_9_0_g728 / temp_output_8_0_g728 ) ) * 1.0 ) ) ) ) + ( _MRE11 * ( ( ( 1.0 - step( texCoord2_g731.x , ( ( temp_output_3_0_g731 - 1.0 ) / temp_output_7_0_g731 ) ) ) * ( step( texCoord2_g731.x , ( temp_output_3_0_g731 / temp_output_7_0_g731 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g731.y , ( ( temp_output_9_0_g731 - 1.0 ) / temp_output_8_0_g731 ) ) ) * ( step( texCoord2_g731.y , ( temp_output_9_0_g731 / temp_output_8_0_g731 ) ) * 1.0 ) ) ) ) + ( _MRE12 * ( ( ( 1.0 - step( texCoord2_g734.x , ( ( temp_output_3_0_g734 - 1.0 ) / temp_output_7_0_g734 ) ) ) * ( step( texCoord2_g734.x , ( temp_output_3_0_g734 / temp_output_7_0_g734 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g734.y , ( ( temp_output_9_0_g734 - 1.0 ) / temp_output_8_0_g734 ) ) ) * ( step( texCoord2_g734.y , ( temp_output_9_0_g734 / temp_output_8_0_g734 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE13 * ( ( ( 1.0 - step( texCoord2_g723.x , ( ( temp_output_3_0_g723 - 1.0 ) / temp_output_7_0_g723 ) ) ) * ( step( texCoord2_g723.x , ( temp_output_3_0_g723 / temp_output_7_0_g723 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g723.y , ( ( temp_output_9_0_g723 - 1.0 ) / temp_output_8_0_g723 ) ) ) * ( step( texCoord2_g723.y , ( temp_output_9_0_g723 / temp_output_8_0_g723 ) ) * 1.0 ) ) ) ) + ( _MRE14 * ( ( ( 1.0 - step( texCoord2_g725.x , ( ( temp_output_3_0_g725 - 1.0 ) / temp_output_7_0_g725 ) ) ) * ( step( texCoord2_g725.x , ( temp_output_3_0_g725 / temp_output_7_0_g725 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g725.y , ( ( temp_output_9_0_g725 - 1.0 ) / temp_output_8_0_g725 ) ) ) * ( step( texCoord2_g725.y , ( temp_output_9_0_g725 / temp_output_8_0_g725 ) ) * 1.0 ) ) ) ) + ( _MRE15 * ( ( ( 1.0 - step( texCoord2_g724.x , ( ( temp_output_3_0_g724 - 1.0 ) / temp_output_7_0_g724 ) ) ) * ( step( texCoord2_g724.x , ( temp_output_3_0_g724 / temp_output_7_0_g724 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g724.y , ( ( temp_output_9_0_g724 - 1.0 ) / temp_output_8_0_g724 ) ) ) * ( step( texCoord2_g724.y , ( temp_output_9_0_g724 / temp_output_8_0_g724 ) ) * 1.0 ) ) ) ) + ( _MRE16 * ( ( ( 1.0 - step( texCoord2_g732.x , ( ( temp_output_3_0_g732 - 1.0 ) / temp_output_7_0_g732 ) ) ) * ( step( texCoord2_g732.x , ( temp_output_3_0_g732 / temp_output_7_0_g732 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g732.y , ( ( temp_output_9_0_g732 - 1.0 ) / temp_output_8_0_g732 ) ) ) * ( step( texCoord2_g732.y , ( temp_output_9_0_g732 / temp_output_8_0_g732 ) ) * 1.0 ) ) ) ) ) );
				
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.Smoothness = ( 1.0 - (temp_output_283_0).g );
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				GetSurfaceAndBuiltinData( surfaceDescription, input, V, posInput, surfaceData, builtinData );

				float4 VPASSpositionCS = float4(packedInput.vpassInterpolators0.xy, 0.0, packedInput.vpassInterpolators0.z);
				float4 VPASSpreviousPositionCS = float4(packedInput.vpassInterpolators1.xy, 0.0, packedInput.vpassInterpolators1.z);

				#ifdef _DEPTHOFFSET_ON
				VPASSpositionCS.w += builtinData.depthOffset;
				VPASSpreviousPositionCS.w += builtinData.depthOffset;
				#endif

				float2 motionVector = CalculateMotionVector( VPASSpositionCS, VPASSpreviousPositionCS );
				EncodeMotionVector( motionVector * 0.5, outMotionVector );

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if( forceNoMotion )
					outMotionVector = float4( 2.0, 0.0, 0.0, 0.0 );

				#ifdef WRITE_NORMAL_BUFFER
				EncodeIntoNormalBuffer( ConvertSurfaceDataToNormalData( surfaceData ), posInput.positionSS, outNormalBuffer );

				#ifdef WRITE_MSAA_DEPTH
				depthColor = packedInput.vmeshPositionCS.z;
				#endif
				#elif defined(WRITE_MSAA_DEPTH)
				outNormalBuffer = float4( 0.0, 0.0, 0.0, 1.0 );
				depthColor = packedInput.vmeshPositionCS.z;
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="Forward" }

			Blend [_SrcBlend] [_DstBlend], [_AlphaSrcBlend] [_AlphaDstBlend]
			Cull [_CullModeForward]
			ZTest [_ZTestDepthEqualForOpaque]
			ZWrite [_ZWrite]

			Stencil
			{
				Ref [_StencilRef]
				WriteMask [_StencilWriteMask]
				Comp Always
				Pass Replace
				Fail Keep
				ZFail Keep
			}


			ColorMask [_ColorMaskTransparentVel] 1

			HLSLPROGRAM

			#define _SPECULAR_OCCLUSION_FROM_AO 1
			#define ASE_SRP_VERSION 999999


			#pragma shader_feature _SURFACE_TYPE_TRANSPARENT
			#pragma shader_feature_local _DOUBLESIDED_ON
			#pragma shader_feature_local _ _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
			#pragma shader_feature_local _ENABLE_FOG_ON_TRANSPARENT
			#pragma shader_feature_local _ALPHATEST_ON

			#if !defined(DEBUG_DISPLAY) && defined(_ALPHATEST_ON)
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#endif

			#define SHADERPASS SHADERPASS_FORWARD
			#pragma multi_compile _ DEBUG_DISPLAY
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile DECALS_OFF DECALS_3RT DECALS_4RT
			#pragma multi_compile USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
			#pragma multi_compile SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH

			#pragma vertex Vert
			#pragma fragment Frag

			//#define UNITY_MATERIAL_LIT

			#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define OUTPUT_SPLIT_LIGHTING
			#endif

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl"

			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
			#ifdef DEBUG_DISPLAY
				#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
			#endif

			// CBuffer must be declared before Material.hlsl since it internaly uses _BlendMode now
			CBUFFER_START( UnityPerMaterial )
			float4 _GradientColor;
			float4 _MRE1;
			float4 _MRE2;
			float4 _MRE3;
			float4 _MRE4;
			float4 _MRE5;
			float4 _MRE6;
			float4 _MRE7;
			float4 _MRE8;
			float4 _MRE9;
			float4 _MRE10;
			float4 _MRE11;
			float4 _MRE12;
			float4 _MRE13;
			float4 _MRE14;
			float4 _MRE15;
			float4 _Color16;
			float4 _Color15;
			float4 _Color14;
			float4 _Color13;
			float4 _Color1;
			float4 _Color2;
			float4 _Color3;
			float4 _MRE16;
			float4 _Color5;
			float4 _Color6;
			float4 _Color4;
			float4 _Color8;
			float4 _Color9;
			float4 _Color10;
			float4 _Color11;
			float4 _Color12;
			float4 _Color7;
			float _GradientPower;
			float _GradientOffset;
			float _GradientScale;
			float _GradientIntensity;
			float _EmissionPower1;
			float4 _EmissionColor;
			float _AlphaCutoff;
			float _RenderQueueType;
			#ifdef _ADD_PRECOMPUTED_VELOCITY
			float _AddPrecomputedVelocity;
			#endif
			float _StencilRef;
			float _StencilWriteMask;
			float _StencilRefDepth;
			float _StencilWriteMaskDepth;
			float _StencilRefMV;
			float _StencilWriteMaskMV;
			float _StencilRefDistortionVec;
			float _StencilWriteMaskDistortionVec;
			float _StencilWriteMaskGBuffer;
			float _StencilRefGBuffer;
			float _ZTestGBuffer;
			float _RequireSplitLighting;
			float _ReceivesSSR;
			float _SurfaceType;
			float _BlendMode;
			float _SrcBlend;
			float _DstBlend;
			float _AlphaSrcBlend;
			float _AlphaDstBlend;
			float _ZWrite;
			float _TransparentZWrite;
			float _CullMode;
			float _TransparentSortPriority;
			float _EnableFogOnTransparent;
			float _CullModeForward;
			float _TransparentCullMode;
			float _ZTestDepthEqualForOpaque;
			float _ZTestTransparent;
			float _TransparentBackfaceEnable;
			float _AlphaCutoffEnable;
			float _UseShadowThreshold;
			float _DoubleSidedEnable;
			float _DoubleSidedNormalMode;
			float4 _DoubleSidedConstants;
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			sampler2D _Gradient;


			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
			#define HAS_LIGHTLOOP
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
			#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"

			

			#if defined(_DOUBLESIDED_ON) && !defined(ASE_NEED_CULLFACE)
				#define ASE_NEED_CULLFACE 1
			#endif

			struct AttributesMesh
			{
				float3 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryingsMeshToPS
			{
				float4 positionCS : SV_Position;
				float3 interp00 : TEXCOORD0;
				float3 interp01 : TEXCOORD1;
				float4 interp02 : TEXCOORD2;
				float4 interp03 : TEXCOORD3;
				float4 interp04 : TEXCOORD4;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 vpassPositionCS : TEXCOORD5;
					float3 vpassPreviousPositionCS : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				#if defined(SHADER_STAGE_FRAGMENT) && defined(ASE_NEED_CULLFACE)
				FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			
			void BuildSurfaceData(FragInputs fragInputs, inout GlobalSurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
			{
				ZERO_INITIALIZE(SurfaceData, surfaceData);

				surfaceData.specularOcclusion = 1.0;

				// surface data
				surfaceData.baseColor =					surfaceDescription.Albedo;
				surfaceData.perceptualSmoothness =		surfaceDescription.Smoothness;
				surfaceData.ambientOcclusion =			surfaceDescription.Occlusion;
				surfaceData.metallic =					surfaceDescription.Metallic;
				surfaceData.coatMask =					surfaceDescription.CoatMask;

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceData.specularOcclusion =			surfaceDescription.SpecularOcclusion;
				#endif
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.subsurfaceMask =			surfaceDescription.SubsurfaceMask;
				#endif
				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceData.thickness =					surfaceDescription.Thickness;
				#endif
				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceData.diffusionProfileHash =		asuint(surfaceDescription.DiffusionProfile);
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.specularColor =				surfaceDescription.Specular;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.anisotropy =				surfaceDescription.Anisotropy;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.iridescenceMask =			surfaceDescription.IridescenceMask;
				surfaceData.iridescenceThickness =		surfaceDescription.IridescenceThickness;
				#endif

				// refraction
				#ifdef _HAS_REFRACTION
				if( _EnableSSRefraction )
				{
					surfaceData.ior = surfaceDescription.RefractionIndex;
					surfaceData.transmittanceColor = surfaceDescription.RefractionColor;
					surfaceData.atDistance = surfaceDescription.RefractionDistance;

					surfaceData.transmittanceMask = ( 1.0 - surfaceDescription.Alpha );
					surfaceDescription.Alpha = 1.0;
				}
				else
				{
					surfaceData.ior = 1.0;
					surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
					surfaceData.atDistance = 1.0;
					surfaceData.transmittanceMask = 0.0;
					surfaceDescription.Alpha = 1.0;
				}
				#else
				surfaceData.ior = 1.0;
				surfaceData.transmittanceColor = float3( 1.0, 1.0, 1.0 );
				surfaceData.atDistance = 1.0;
				surfaceData.transmittanceMask = 0.0;
				#endif


				// material features
				surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
				#endif
				#ifdef _MATERIAL_FEATURE_TRANSMISSION
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
				#endif
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;
				#endif
				#ifdef ASE_LIT_CLEAR_COAT
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
				#endif
				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
				#endif
				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
				#endif

				// others
				#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
				surfaceData.baseColor *= ( 1.0 - Max3( surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b ) );
				#endif
				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				// normals
				float3 normalTS = float3(0.0f, 0.0f, 1.0f);
				normalTS = surfaceDescription.Normal;
				GetNormalWS( fragInputs, normalTS, surfaceData.normalWS, doubleSidedConstants );

				surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

				bentNormalWS = surfaceData.normalWS;
				#ifdef ASE_BENT_NORMAL
				GetNormalWS( fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants );
				#endif

				surfaceData.tangentWS = normalize( fragInputs.tangentToWorld[ 0 ].xyz );
				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceData.tangentWS = TransformTangentToWorld( surfaceDescription.Tangent, fragInputs.tangentToWorld );
				#endif
				surfaceData.tangentWS = Orthonormalize( surfaceData.tangentWS, surfaceData.normalWS );

				// decals
				#if HAVE_DECALS
				if( _EnableDecals )
				{
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs.tangentToWorld[2], surfaceDescription.Alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
				#endif

				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO( V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness( surfaceData.perceptualSmoothness ) );
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
				surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion( ClampNdotV( dot( surfaceData.normalWS, V ) ), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness( surfaceData.perceptualSmoothness ) );
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceData.perceptualSmoothness = GeometricNormalFiltering( surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[ 2 ], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold );
				#endif

				// debug
				#if defined(DEBUG_DISPLAY)
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					surfaceData.metallic = 0;
				}
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
				#endif
			}

			void GetSurfaceAndBuiltinData(GlobalSurfaceDescription surfaceDescription, FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData)
			{
				#ifdef LOD_FADE_CROSSFADE
				LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
				#endif

				#ifdef _DOUBLESIDED_ON
				float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
				#else
				float3 doubleSidedConstants = float3( 1.0, 1.0, 1.0 );
				#endif

				ApplyDoubleSidedFlipOrMirror( fragInputs, doubleSidedConstants );

				#ifdef _ALPHATEST_ON
				DoAlphaTest( surfaceDescription.Alpha, surfaceDescription.AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
				builtinData.depthOffset = surfaceDescription.DepthOffset;
				ApplyDepthOffsetPositionInput( V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput );
				#endif

				float3 bentNormalWS;
				BuildSurfaceData( fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS );

				InitBuiltinData( posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[ 2 ], fragInputs.texCoord1, fragInputs.texCoord2, builtinData );

				#ifdef _ASE_BAKEDGI
				builtinData.bakeDiffuseLighting = surfaceDescription.BakedGI;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				builtinData.backBakeDiffuseLighting = surfaceDescription.BakedBackGI;
				#endif

				builtinData.emissiveColor = surfaceDescription.Emission;

				PostInitBuiltinData(V, posInput, surfaceData, builtinData);
			}

			AttributesMesh ApplyMeshModification(AttributesMesh inputMesh, float3 timeParameters, inout PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS )
			{
				_TimeParameters.xyz = timeParameters;
				outputPackedVaryingsMeshToPS.ase_texcoord7.xy = inputMesh.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				outputPackedVaryingsMeshToPS.ase_texcoord7.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				float3 defaultVertexValue = inputMesh.positionOS.xyz;
				#else
				float3 defaultVertexValue = float3( 0, 0, 0 );
				#endif
				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
				inputMesh.positionOS.xyz = vertexValue;
				#else
				inputMesh.positionOS.xyz += vertexValue;
				#endif
				inputMesh.normalOS = inputMesh.normalOS;
				inputMesh.tangentOS = inputMesh.tangentOS;
				return inputMesh;
			}

			PackedVaryingsMeshToPS VertexFunction(AttributesMesh inputMesh)
			{
				PackedVaryingsMeshToPS outputPackedVaryingsMeshToPS = (PackedVaryingsMeshToPS)0;
				AttributesMesh defaultMesh = inputMesh;

				UNITY_SETUP_INSTANCE_ID(inputMesh);
				UNITY_TRANSFER_INSTANCE_ID(inputMesh, outputPackedVaryingsMeshToPS);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( outputPackedVaryingsMeshToPS );

				inputMesh = ApplyMeshModification( inputMesh, _TimeParameters.xyz, outputPackedVaryingsMeshToPS);

				float3 positionRWS = TransformObjectToWorld(inputMesh.positionOS);
				float3 normalWS = TransformObjectToWorldNormal(inputMesh.normalOS);
				float4 tangentWS = float4(TransformObjectToWorldDir(inputMesh.tangentOS.xyz), inputMesh.tangentOS.w);

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
				float4 VPASSpreviousPositionCS;
				float4 VPASSpositionCS = mul(UNITY_MATRIX_UNJITTERED_VP, float4(positionRWS, 1.0));

				bool forceNoMotion = unity_MotionVectorsParams.y == 0.0;
				if (forceNoMotion)
				{
					VPASSpreviousPositionCS = float4(0.0, 0.0, 0.0, 1.0);
				}
				else
				{
					bool hasDeformation = unity_MotionVectorsParams.x > 0.0;
					float3 effectivePositionOS = (hasDeformation ? inputMesh.previousPositionOS : defaultMesh.positionOS);
					#if defined(_ADD_PRECOMPUTED_VELOCITY)
					effectivePositionOS -= inputMesh.precomputedVelocity;
					#endif

					#if defined(HAVE_MESH_MODIFICATION)
						AttributesMesh previousMesh = defaultMesh;
						previousMesh.positionOS = effectivePositionOS ;
						PackedVaryingsMeshToPS test = (PackedVaryingsMeshToPS)0;
						float3 curTime = _TimeParameters.xyz;
						previousMesh = ApplyMeshModification(previousMesh, _LastTimeParameters.xyz, test);
						_TimeParameters.xyz = curTime;
						float3 previousPositionRWS = TransformPreviousObjectToWorld(previousMesh.positionOS);
					#else
						float3 previousPositionRWS = TransformPreviousObjectToWorld(effectivePositionOS);
					#endif

					#ifdef ATTRIBUTES_NEED_NORMAL
						float3 normalWS = TransformPreviousObjectToWorldNormal(defaultMesh.normalOS);
					#else
						float3 normalWS = float3(0.0, 0.0, 0.0);
					#endif

					#if defined(HAVE_VERTEX_MODIFICATION)
						//ApplyVertexModification(inputMesh, normalWS, previousPositionRWS, _LastTimeParameters.xyz);
					#endif

					VPASSpreviousPositionCS = mul(UNITY_MATRIX_PREV_VP, float4(previousPositionRWS, 1.0));
				}
				#endif

				outputPackedVaryingsMeshToPS.positionCS = TransformWorldToHClip(positionRWS);
				outputPackedVaryingsMeshToPS.interp00.xyz = positionRWS;
				outputPackedVaryingsMeshToPS.interp01.xyz = normalWS;
				outputPackedVaryingsMeshToPS.interp02.xyzw = tangentWS;
				outputPackedVaryingsMeshToPS.interp03.xyzw = inputMesh.uv1;
				outputPackedVaryingsMeshToPS.interp04.xyzw = inputMesh.uv2;

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outputPackedVaryingsMeshToPS.vpassPositionCS = float3(VPASSpositionCS.xyw);
					outputPackedVaryingsMeshToPS.vpassPreviousPositionCS = float3(VPASSpreviousPositionCS.xyw);
				#endif
				return outputPackedVaryingsMeshToPS;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float3 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 uv1 : TEXCOORD1;
				float4 uv2 : TEXCOORD2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					float3 previousPositionOS : TEXCOORD4;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						float3 precomputedVelocity : TEXCOORD5;
					#endif
				#endif
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl Vert ( AttributesMesh v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.positionOS = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.uv1 = v.uv1;
				o.uv2 = v.uv2;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = v.previousPositionOS;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = v.precomputedVelocity;
					#endif
				#endif
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				float3 cameraPos = 0;
				#else
				float3 cameraPos = _WorldSpaceCameraPos;
				#endif
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), cameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, GetObjectToWorldMatrix(), cameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(float4(v[0].positionOS,1), float4(v[1].positionOS,1), float4(v[2].positionOS,1), edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), cameraPos, _ScreenParams, _FrustumPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			PackedVaryingsMeshToPS DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				AttributesMesh o = (AttributesMesh) 0;
				o.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.uv1 = patch[0].uv1 * bary.x + patch[1].uv1 * bary.y + patch[2].uv1 * bary.z;
				o.uv2 = patch[0].uv2 * bary.x + patch[1].uv2 * bary.y + patch[2].uv2 * bary.z;
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					o.previousPositionOS = patch[0].previousPositionOS * bary.x + patch[1].previousPositionOS * bary.y + patch[2].previousPositionOS * bary.z;
					#if defined (_ADD_PRECOMPUTED_VELOCITY)
						o.precomputedVelocity = patch[0].precomputedVelocity * bary.x + patch[1].precomputedVelocity * bary.y + patch[2].precomputedVelocity * bary.z;
					#endif
				#endif
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			PackedVaryingsMeshToPS Vert ( AttributesMesh v )
			{
				return VertexFunction( v );
			}
			#endif

			void Frag(PackedVaryingsMeshToPS packedInput,
					#ifdef OUTPUT_SPLIT_LIGHTING
						out float4 outColor : SV_Target0,
						out float4 outDiffuseLighting : SV_Target1,
						OUTPUT_SSSBUFFER(outSSSBuffer)
					#else
						out float4 outColor : SV_Target0
					#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						, out float4 outMotionVec : SV_Target1
					#endif
					#endif
					#ifdef _DEPTHOFFSET_ON
						, out float outputDepth : SV_Depth
					#endif
					
						)
			{
				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
					outMotionVec = float4(2.0, 0.0, 0.0, 0.0);
				#endif

				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( packedInput );
				UNITY_SETUP_INSTANCE_ID( packedInput );
				float3 positionRWS = packedInput.interp00.xyz;
				float3 normalWS = packedInput.interp01.xyz;
				float4 tangentWS = packedInput.interp02.xyzw;

				FragInputs input;
				ZERO_INITIALIZE(FragInputs, input);
				input.tangentToWorld = k_identity3x3;
				input.positionSS = packedInput.positionCS;
				input.positionRWS = positionRWS;
				input.tangentToWorld = BuildTangentToWorld(tangentWS, normalWS);
				input.texCoord1 = packedInput.interp03.xyzw;
				input.texCoord2 = packedInput.interp04.xyzw;

				#if _DOUBLESIDED_ON && SHADER_STAGE_FRAGMENT
				input.isFrontFace = IS_FRONT_VFACE( packedInput.cullFace, true, false);
				#elif SHADER_STAGE_FRAGMENT
				#if defined(ASE_NEED_CULLFACE)
				input.isFrontFace = IS_FRONT_VFACE(packedInput.cullFace, true, false);
				#endif
				#endif
				half isFrontFace = input.isFrontFace;

				input.positionSS.xy = _OffScreenRendering > 0 ? (input.positionSS.xy * _OffScreenDownsampleFactor) : input.positionSS.xy;
				uint2 tileIndex = uint2(input.positionSS.xy) / GetTileSize ();

				PositionInputs posInput = GetPositionInput( input.positionSS.xy, _ScreenSize.zw, input.positionSS.z, input.positionSS.w, input.positionRWS.xyz, tileIndex );

				float3 V = GetWorldSpaceNormalizeViewDir(input.positionRWS);

				GlobalSurfaceDescription surfaceDescription = (GlobalSurfaceDescription)0;
				float2 texCoord255 = packedInput.ase_texcoord7.xy * float2( 1,4 ) + float2( 0,0 );
				float4 clampResult234 = clamp( ( ( tex2D( _Gradient, texCoord255 ) + _GradientColor ) + ( 1.0 - _GradientIntensity ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 saferPower258 = max( (clampResult234*_GradientScale + _GradientOffset) , 0.0001 );
				float4 temp_cast_0 = (_GradientPower).xxxx;
				float2 texCoord2_g707 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g707 = 1.0;
				float temp_output_7_0_g707 = 4.0;
				float temp_output_9_0_g707 = 4.0;
				float temp_output_8_0_g707 = 4.0;
				float2 texCoord2_g710 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g710 = 2.0;
				float temp_output_7_0_g710 = 4.0;
				float temp_output_9_0_g710 = 4.0;
				float temp_output_8_0_g710 = 4.0;
				float2 texCoord2_g709 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g709 = 3.0;
				float temp_output_7_0_g709 = 4.0;
				float temp_output_9_0_g709 = 4.0;
				float temp_output_8_0_g709 = 4.0;
				float2 texCoord2_g706 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g706 = 4.0;
				float temp_output_7_0_g706 = 4.0;
				float temp_output_9_0_g706 = 4.0;
				float temp_output_8_0_g706 = 4.0;
				float2 texCoord2_g699 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g699 = 1.0;
				float temp_output_7_0_g699 = 4.0;
				float temp_output_9_0_g699 = 3.0;
				float temp_output_8_0_g699 = 4.0;
				float2 texCoord2_g700 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g700 = 2.0;
				float temp_output_7_0_g700 = 4.0;
				float temp_output_9_0_g700 = 3.0;
				float temp_output_8_0_g700 = 4.0;
				float2 texCoord2_g704 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g704 = 3.0;
				float temp_output_7_0_g704 = 4.0;
				float temp_output_9_0_g704 = 3.0;
				float temp_output_8_0_g704 = 4.0;
				float2 texCoord2_g696 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g696 = 4.0;
				float temp_output_7_0_g696 = 4.0;
				float temp_output_9_0_g696 = 3.0;
				float temp_output_8_0_g696 = 4.0;
				float2 texCoord2_g703 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g703 = 1.0;
				float temp_output_7_0_g703 = 4.0;
				float temp_output_9_0_g703 = 2.0;
				float temp_output_8_0_g703 = 4.0;
				float2 texCoord2_g701 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g701 = 2.0;
				float temp_output_7_0_g701 = 4.0;
				float temp_output_9_0_g701 = 2.0;
				float temp_output_8_0_g701 = 4.0;
				float2 texCoord2_g697 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g697 = 3.0;
				float temp_output_7_0_g697 = 4.0;
				float temp_output_9_0_g697 = 2.0;
				float temp_output_8_0_g697 = 4.0;
				float2 texCoord2_g698 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g698 = 4.0;
				float temp_output_7_0_g698 = 4.0;
				float temp_output_9_0_g698 = 2.0;
				float temp_output_8_0_g698 = 4.0;
				float2 texCoord2_g708 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g708 = 1.0;
				float temp_output_7_0_g708 = 4.0;
				float temp_output_9_0_g708 = 1.0;
				float temp_output_8_0_g708 = 4.0;
				float2 texCoord2_g702 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g702 = 2.0;
				float temp_output_7_0_g702 = 4.0;
				float temp_output_9_0_g702 = 1.0;
				float temp_output_8_0_g702 = 4.0;
				float2 texCoord2_g705 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g705 = 3.0;
				float temp_output_7_0_g705 = 4.0;
				float temp_output_9_0_g705 = 1.0;
				float temp_output_8_0_g705 = 4.0;
				float2 texCoord2_g689 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g689 = 4.0;
				float temp_output_7_0_g689 = 4.0;
				float temp_output_9_0_g689 = 1.0;
				float temp_output_8_0_g689 = 4.0;
				float4 temp_output_155_0 = ( ( ( _Color1 * ( ( ( 1.0 - step( texCoord2_g707.x , ( ( temp_output_3_0_g707 - 1.0 ) / temp_output_7_0_g707 ) ) ) * ( step( texCoord2_g707.x , ( temp_output_3_0_g707 / temp_output_7_0_g707 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g707.y , ( ( temp_output_9_0_g707 - 1.0 ) / temp_output_8_0_g707 ) ) ) * ( step( texCoord2_g707.y , ( temp_output_9_0_g707 / temp_output_8_0_g707 ) ) * 1.0 ) ) ) ) + ( _Color2 * ( ( ( 1.0 - step( texCoord2_g710.x , ( ( temp_output_3_0_g710 - 1.0 ) / temp_output_7_0_g710 ) ) ) * ( step( texCoord2_g710.x , ( temp_output_3_0_g710 / temp_output_7_0_g710 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g710.y , ( ( temp_output_9_0_g710 - 1.0 ) / temp_output_8_0_g710 ) ) ) * ( step( texCoord2_g710.y , ( temp_output_9_0_g710 / temp_output_8_0_g710 ) ) * 1.0 ) ) ) ) + ( _Color3 * ( ( ( 1.0 - step( texCoord2_g709.x , ( ( temp_output_3_0_g709 - 1.0 ) / temp_output_7_0_g709 ) ) ) * ( step( texCoord2_g709.x , ( temp_output_3_0_g709 / temp_output_7_0_g709 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g709.y , ( ( temp_output_9_0_g709 - 1.0 ) / temp_output_8_0_g709 ) ) ) * ( step( texCoord2_g709.y , ( temp_output_9_0_g709 / temp_output_8_0_g709 ) ) * 1.0 ) ) ) ) + ( _Color4 * ( ( ( 1.0 - step( texCoord2_g706.x , ( ( temp_output_3_0_g706 - 1.0 ) / temp_output_7_0_g706 ) ) ) * ( step( texCoord2_g706.x , ( temp_output_3_0_g706 / temp_output_7_0_g706 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g706.y , ( ( temp_output_9_0_g706 - 1.0 ) / temp_output_8_0_g706 ) ) ) * ( step( texCoord2_g706.y , ( temp_output_9_0_g706 / temp_output_8_0_g706 ) ) * 1.0 ) ) ) ) ) + ( ( _Color5 * ( ( ( 1.0 - step( texCoord2_g699.x , ( ( temp_output_3_0_g699 - 1.0 ) / temp_output_7_0_g699 ) ) ) * ( step( texCoord2_g699.x , ( temp_output_3_0_g699 / temp_output_7_0_g699 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g699.y , ( ( temp_output_9_0_g699 - 1.0 ) / temp_output_8_0_g699 ) ) ) * ( step( texCoord2_g699.y , ( temp_output_9_0_g699 / temp_output_8_0_g699 ) ) * 1.0 ) ) ) ) + ( _Color6 * ( ( ( 1.0 - step( texCoord2_g700.x , ( ( temp_output_3_0_g700 - 1.0 ) / temp_output_7_0_g700 ) ) ) * ( step( texCoord2_g700.x , ( temp_output_3_0_g700 / temp_output_7_0_g700 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g700.y , ( ( temp_output_9_0_g700 - 1.0 ) / temp_output_8_0_g700 ) ) ) * ( step( texCoord2_g700.y , ( temp_output_9_0_g700 / temp_output_8_0_g700 ) ) * 1.0 ) ) ) ) + ( _Color7 * ( ( ( 1.0 - step( texCoord2_g704.x , ( ( temp_output_3_0_g704 - 1.0 ) / temp_output_7_0_g704 ) ) ) * ( step( texCoord2_g704.x , ( temp_output_3_0_g704 / temp_output_7_0_g704 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g704.y , ( ( temp_output_9_0_g704 - 1.0 ) / temp_output_8_0_g704 ) ) ) * ( step( texCoord2_g704.y , ( temp_output_9_0_g704 / temp_output_8_0_g704 ) ) * 1.0 ) ) ) ) + ( _Color8 * ( ( ( 1.0 - step( texCoord2_g696.x , ( ( temp_output_3_0_g696 - 1.0 ) / temp_output_7_0_g696 ) ) ) * ( step( texCoord2_g696.x , ( temp_output_3_0_g696 / temp_output_7_0_g696 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g696.y , ( ( temp_output_9_0_g696 - 1.0 ) / temp_output_8_0_g696 ) ) ) * ( step( texCoord2_g696.y , ( temp_output_9_0_g696 / temp_output_8_0_g696 ) ) * 1.0 ) ) ) ) ) + ( ( _Color9 * ( ( ( 1.0 - step( texCoord2_g703.x , ( ( temp_output_3_0_g703 - 1.0 ) / temp_output_7_0_g703 ) ) ) * ( step( texCoord2_g703.x , ( temp_output_3_0_g703 / temp_output_7_0_g703 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g703.y , ( ( temp_output_9_0_g703 - 1.0 ) / temp_output_8_0_g703 ) ) ) * ( step( texCoord2_g703.y , ( temp_output_9_0_g703 / temp_output_8_0_g703 ) ) * 1.0 ) ) ) ) + ( _Color10 * ( ( ( 1.0 - step( texCoord2_g701.x , ( ( temp_output_3_0_g701 - 1.0 ) / temp_output_7_0_g701 ) ) ) * ( step( texCoord2_g701.x , ( temp_output_3_0_g701 / temp_output_7_0_g701 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g701.y , ( ( temp_output_9_0_g701 - 1.0 ) / temp_output_8_0_g701 ) ) ) * ( step( texCoord2_g701.y , ( temp_output_9_0_g701 / temp_output_8_0_g701 ) ) * 1.0 ) ) ) ) + ( _Color11 * ( ( ( 1.0 - step( texCoord2_g697.x , ( ( temp_output_3_0_g697 - 1.0 ) / temp_output_7_0_g697 ) ) ) * ( step( texCoord2_g697.x , ( temp_output_3_0_g697 / temp_output_7_0_g697 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g697.y , ( ( temp_output_9_0_g697 - 1.0 ) / temp_output_8_0_g697 ) ) ) * ( step( texCoord2_g697.y , ( temp_output_9_0_g697 / temp_output_8_0_g697 ) ) * 1.0 ) ) ) ) + ( _Color12 * ( ( ( 1.0 - step( texCoord2_g698.x , ( ( temp_output_3_0_g698 - 1.0 ) / temp_output_7_0_g698 ) ) ) * ( step( texCoord2_g698.x , ( temp_output_3_0_g698 / temp_output_7_0_g698 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g698.y , ( ( temp_output_9_0_g698 - 1.0 ) / temp_output_8_0_g698 ) ) ) * ( step( texCoord2_g698.y , ( temp_output_9_0_g698 / temp_output_8_0_g698 ) ) * 1.0 ) ) ) ) ) + ( ( _Color13 * ( ( ( 1.0 - step( texCoord2_g708.x , ( ( temp_output_3_0_g708 - 1.0 ) / temp_output_7_0_g708 ) ) ) * ( step( texCoord2_g708.x , ( temp_output_3_0_g708 / temp_output_7_0_g708 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g708.y , ( ( temp_output_9_0_g708 - 1.0 ) / temp_output_8_0_g708 ) ) ) * ( step( texCoord2_g708.y , ( temp_output_9_0_g708 / temp_output_8_0_g708 ) ) * 1.0 ) ) ) ) + ( _Color14 * ( ( ( 1.0 - step( texCoord2_g702.x , ( ( temp_output_3_0_g702 - 1.0 ) / temp_output_7_0_g702 ) ) ) * ( step( texCoord2_g702.x , ( temp_output_3_0_g702 / temp_output_7_0_g702 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g702.y , ( ( temp_output_9_0_g702 - 1.0 ) / temp_output_8_0_g702 ) ) ) * ( step( texCoord2_g702.y , ( temp_output_9_0_g702 / temp_output_8_0_g702 ) ) * 1.0 ) ) ) ) + ( _Color15 * ( ( ( 1.0 - step( texCoord2_g705.x , ( ( temp_output_3_0_g705 - 1.0 ) / temp_output_7_0_g705 ) ) ) * ( step( texCoord2_g705.x , ( temp_output_3_0_g705 / temp_output_7_0_g705 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g705.y , ( ( temp_output_9_0_g705 - 1.0 ) / temp_output_8_0_g705 ) ) ) * ( step( texCoord2_g705.y , ( temp_output_9_0_g705 / temp_output_8_0_g705 ) ) * 1.0 ) ) ) ) + ( _Color16 * ( ( ( 1.0 - step( texCoord2_g689.x , ( ( temp_output_3_0_g689 - 1.0 ) / temp_output_7_0_g689 ) ) ) * ( step( texCoord2_g689.x , ( temp_output_3_0_g689 / temp_output_7_0_g689 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g689.y , ( ( temp_output_9_0_g689 - 1.0 ) / temp_output_8_0_g689 ) ) ) * ( step( texCoord2_g689.y , ( temp_output_9_0_g689 / temp_output_8_0_g689 ) ) * 1.0 ) ) ) ) ) );
				float4 clampResult261 = clamp( ( pow( saferPower258 , temp_cast_0 ) + ( 1.0 - (temp_output_155_0).a ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,1 ) );
				
				float2 texCoord2_g722 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g722 = 1.0;
				float temp_output_7_0_g722 = 4.0;
				float temp_output_9_0_g722 = 4.0;
				float temp_output_8_0_g722 = 4.0;
				float2 texCoord2_g735 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g735 = 2.0;
				float temp_output_7_0_g735 = 4.0;
				float temp_output_9_0_g735 = 4.0;
				float temp_output_8_0_g735 = 4.0;
				float2 texCoord2_g714 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g714 = 3.0;
				float temp_output_7_0_g714 = 4.0;
				float temp_output_9_0_g714 = 4.0;
				float temp_output_8_0_g714 = 4.0;
				float2 texCoord2_g730 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g730 = 4.0;
				float temp_output_7_0_g730 = 4.0;
				float temp_output_9_0_g730 = 4.0;
				float temp_output_8_0_g730 = 4.0;
				float2 texCoord2_g729 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g729 = 1.0;
				float temp_output_7_0_g729 = 4.0;
				float temp_output_9_0_g729 = 3.0;
				float temp_output_8_0_g729 = 4.0;
				float2 texCoord2_g727 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g727 = 2.0;
				float temp_output_7_0_g727 = 4.0;
				float temp_output_9_0_g727 = 3.0;
				float temp_output_8_0_g727 = 4.0;
				float2 texCoord2_g736 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g736 = 3.0;
				float temp_output_7_0_g736 = 4.0;
				float temp_output_9_0_g736 = 3.0;
				float temp_output_8_0_g736 = 4.0;
				float2 texCoord2_g726 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g726 = 4.0;
				float temp_output_7_0_g726 = 4.0;
				float temp_output_9_0_g726 = 3.0;
				float temp_output_8_0_g726 = 4.0;
				float2 texCoord2_g733 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g733 = 1.0;
				float temp_output_7_0_g733 = 4.0;
				float temp_output_9_0_g733 = 2.0;
				float temp_output_8_0_g733 = 4.0;
				float2 texCoord2_g728 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g728 = 2.0;
				float temp_output_7_0_g728 = 4.0;
				float temp_output_9_0_g728 = 2.0;
				float temp_output_8_0_g728 = 4.0;
				float2 texCoord2_g731 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g731 = 3.0;
				float temp_output_7_0_g731 = 4.0;
				float temp_output_9_0_g731 = 2.0;
				float temp_output_8_0_g731 = 4.0;
				float2 texCoord2_g734 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g734 = 4.0;
				float temp_output_7_0_g734 = 4.0;
				float temp_output_9_0_g734 = 2.0;
				float temp_output_8_0_g734 = 4.0;
				float2 texCoord2_g723 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g723 = 1.0;
				float temp_output_7_0_g723 = 4.0;
				float temp_output_9_0_g723 = 1.0;
				float temp_output_8_0_g723 = 4.0;
				float2 texCoord2_g725 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g725 = 2.0;
				float temp_output_7_0_g725 = 4.0;
				float temp_output_9_0_g725 = 1.0;
				float temp_output_8_0_g725 = 4.0;
				float2 texCoord2_g724 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g724 = 3.0;
				float temp_output_7_0_g724 = 4.0;
				float temp_output_9_0_g724 = 1.0;
				float temp_output_8_0_g724 = 4.0;
				float2 texCoord2_g732 = packedInput.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float temp_output_3_0_g732 = 4.0;
				float temp_output_7_0_g732 = 4.0;
				float temp_output_9_0_g732 = 1.0;
				float temp_output_8_0_g732 = 4.0;
				float4 temp_output_283_0 = ( ( ( _MRE1 * ( ( ( 1.0 - step( texCoord2_g722.x , ( ( temp_output_3_0_g722 - 1.0 ) / temp_output_7_0_g722 ) ) ) * ( step( texCoord2_g722.x , ( temp_output_3_0_g722 / temp_output_7_0_g722 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g722.y , ( ( temp_output_9_0_g722 - 1.0 ) / temp_output_8_0_g722 ) ) ) * ( step( texCoord2_g722.y , ( temp_output_9_0_g722 / temp_output_8_0_g722 ) ) * 1.0 ) ) ) ) + ( _MRE2 * ( ( ( 1.0 - step( texCoord2_g735.x , ( ( temp_output_3_0_g735 - 1.0 ) / temp_output_7_0_g735 ) ) ) * ( step( texCoord2_g735.x , ( temp_output_3_0_g735 / temp_output_7_0_g735 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g735.y , ( ( temp_output_9_0_g735 - 1.0 ) / temp_output_8_0_g735 ) ) ) * ( step( texCoord2_g735.y , ( temp_output_9_0_g735 / temp_output_8_0_g735 ) ) * 1.0 ) ) ) ) + ( _MRE3 * ( ( ( 1.0 - step( texCoord2_g714.x , ( ( temp_output_3_0_g714 - 1.0 ) / temp_output_7_0_g714 ) ) ) * ( step( texCoord2_g714.x , ( temp_output_3_0_g714 / temp_output_7_0_g714 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g714.y , ( ( temp_output_9_0_g714 - 1.0 ) / temp_output_8_0_g714 ) ) ) * ( step( texCoord2_g714.y , ( temp_output_9_0_g714 / temp_output_8_0_g714 ) ) * 1.0 ) ) ) ) + ( _MRE4 * ( ( ( 1.0 - step( texCoord2_g730.x , ( ( temp_output_3_0_g730 - 1.0 ) / temp_output_7_0_g730 ) ) ) * ( step( texCoord2_g730.x , ( temp_output_3_0_g730 / temp_output_7_0_g730 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g730.y , ( ( temp_output_9_0_g730 - 1.0 ) / temp_output_8_0_g730 ) ) ) * ( step( texCoord2_g730.y , ( temp_output_9_0_g730 / temp_output_8_0_g730 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE5 * ( ( ( 1.0 - step( texCoord2_g729.x , ( ( temp_output_3_0_g729 - 1.0 ) / temp_output_7_0_g729 ) ) ) * ( step( texCoord2_g729.x , ( temp_output_3_0_g729 / temp_output_7_0_g729 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g729.y , ( ( temp_output_9_0_g729 - 1.0 ) / temp_output_8_0_g729 ) ) ) * ( step( texCoord2_g729.y , ( temp_output_9_0_g729 / temp_output_8_0_g729 ) ) * 1.0 ) ) ) ) + ( _MRE6 * ( ( ( 1.0 - step( texCoord2_g727.x , ( ( temp_output_3_0_g727 - 1.0 ) / temp_output_7_0_g727 ) ) ) * ( step( texCoord2_g727.x , ( temp_output_3_0_g727 / temp_output_7_0_g727 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g727.y , ( ( temp_output_9_0_g727 - 1.0 ) / temp_output_8_0_g727 ) ) ) * ( step( texCoord2_g727.y , ( temp_output_9_0_g727 / temp_output_8_0_g727 ) ) * 1.0 ) ) ) ) + ( _MRE7 * ( ( ( 1.0 - step( texCoord2_g736.x , ( ( temp_output_3_0_g736 - 1.0 ) / temp_output_7_0_g736 ) ) ) * ( step( texCoord2_g736.x , ( temp_output_3_0_g736 / temp_output_7_0_g736 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g736.y , ( ( temp_output_9_0_g736 - 1.0 ) / temp_output_8_0_g736 ) ) ) * ( step( texCoord2_g736.y , ( temp_output_9_0_g736 / temp_output_8_0_g736 ) ) * 1.0 ) ) ) ) + ( _MRE8 * ( ( ( 1.0 - step( texCoord2_g726.x , ( ( temp_output_3_0_g726 - 1.0 ) / temp_output_7_0_g726 ) ) ) * ( step( texCoord2_g726.x , ( temp_output_3_0_g726 / temp_output_7_0_g726 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g726.y , ( ( temp_output_9_0_g726 - 1.0 ) / temp_output_8_0_g726 ) ) ) * ( step( texCoord2_g726.y , ( temp_output_9_0_g726 / temp_output_8_0_g726 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE9 * ( ( ( 1.0 - step( texCoord2_g733.x , ( ( temp_output_3_0_g733 - 1.0 ) / temp_output_7_0_g733 ) ) ) * ( step( texCoord2_g733.x , ( temp_output_3_0_g733 / temp_output_7_0_g733 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g733.y , ( ( temp_output_9_0_g733 - 1.0 ) / temp_output_8_0_g733 ) ) ) * ( step( texCoord2_g733.y , ( temp_output_9_0_g733 / temp_output_8_0_g733 ) ) * 1.0 ) ) ) ) + ( _MRE10 * ( ( ( 1.0 - step( texCoord2_g728.x , ( ( temp_output_3_0_g728 - 1.0 ) / temp_output_7_0_g728 ) ) ) * ( step( texCoord2_g728.x , ( temp_output_3_0_g728 / temp_output_7_0_g728 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g728.y , ( ( temp_output_9_0_g728 - 1.0 ) / temp_output_8_0_g728 ) ) ) * ( step( texCoord2_g728.y , ( temp_output_9_0_g728 / temp_output_8_0_g728 ) ) * 1.0 ) ) ) ) + ( _MRE11 * ( ( ( 1.0 - step( texCoord2_g731.x , ( ( temp_output_3_0_g731 - 1.0 ) / temp_output_7_0_g731 ) ) ) * ( step( texCoord2_g731.x , ( temp_output_3_0_g731 / temp_output_7_0_g731 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g731.y , ( ( temp_output_9_0_g731 - 1.0 ) / temp_output_8_0_g731 ) ) ) * ( step( texCoord2_g731.y , ( temp_output_9_0_g731 / temp_output_8_0_g731 ) ) * 1.0 ) ) ) ) + ( _MRE12 * ( ( ( 1.0 - step( texCoord2_g734.x , ( ( temp_output_3_0_g734 - 1.0 ) / temp_output_7_0_g734 ) ) ) * ( step( texCoord2_g734.x , ( temp_output_3_0_g734 / temp_output_7_0_g734 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g734.y , ( ( temp_output_9_0_g734 - 1.0 ) / temp_output_8_0_g734 ) ) ) * ( step( texCoord2_g734.y , ( temp_output_9_0_g734 / temp_output_8_0_g734 ) ) * 1.0 ) ) ) ) ) + ( ( _MRE13 * ( ( ( 1.0 - step( texCoord2_g723.x , ( ( temp_output_3_0_g723 - 1.0 ) / temp_output_7_0_g723 ) ) ) * ( step( texCoord2_g723.x , ( temp_output_3_0_g723 / temp_output_7_0_g723 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g723.y , ( ( temp_output_9_0_g723 - 1.0 ) / temp_output_8_0_g723 ) ) ) * ( step( texCoord2_g723.y , ( temp_output_9_0_g723 / temp_output_8_0_g723 ) ) * 1.0 ) ) ) ) + ( _MRE14 * ( ( ( 1.0 - step( texCoord2_g725.x , ( ( temp_output_3_0_g725 - 1.0 ) / temp_output_7_0_g725 ) ) ) * ( step( texCoord2_g725.x , ( temp_output_3_0_g725 / temp_output_7_0_g725 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g725.y , ( ( temp_output_9_0_g725 - 1.0 ) / temp_output_8_0_g725 ) ) ) * ( step( texCoord2_g725.y , ( temp_output_9_0_g725 / temp_output_8_0_g725 ) ) * 1.0 ) ) ) ) + ( _MRE15 * ( ( ( 1.0 - step( texCoord2_g724.x , ( ( temp_output_3_0_g724 - 1.0 ) / temp_output_7_0_g724 ) ) ) * ( step( texCoord2_g724.x , ( temp_output_3_0_g724 / temp_output_7_0_g724 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g724.y , ( ( temp_output_9_0_g724 - 1.0 ) / temp_output_8_0_g724 ) ) ) * ( step( texCoord2_g724.y , ( temp_output_9_0_g724 / temp_output_8_0_g724 ) ) * 1.0 ) ) ) ) + ( _MRE16 * ( ( ( 1.0 - step( texCoord2_g732.x , ( ( temp_output_3_0_g732 - 1.0 ) / temp_output_7_0_g732 ) ) ) * ( step( texCoord2_g732.x , ( temp_output_3_0_g732 / temp_output_7_0_g732 ) ) * 1.0 ) ) * ( ( 1.0 - step( texCoord2_g732.y , ( ( temp_output_9_0_g732 - 1.0 ) / temp_output_8_0_g732 ) ) ) * ( step( texCoord2_g732.y , ( temp_output_9_0_g732 / temp_output_8_0_g732 ) ) * 1.0 ) ) ) ) ) );
				
				surfaceDescription.Albedo = ( clampResult261 * temp_output_155_0 ).rgb;
				surfaceDescription.Normal = float3( 0, 0, 1 );
				surfaceDescription.BentNormal = float3( 0, 0, 1 );
				surfaceDescription.CoatMask = 0;
				surfaceDescription.Metallic = (temp_output_283_0).r;

				#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
				surfaceDescription.Specular = 0;
				#endif

				surfaceDescription.Emission = ( temp_output_155_0 * ( _EmissionPower1 * (temp_output_283_0).b ) ).rgb;
				surfaceDescription.Smoothness = ( 1.0 - (temp_output_283_0).g );
				surfaceDescription.Occlusion = 1;
				surfaceDescription.Alpha = 1;

				#ifdef _ALPHATEST_ON
				surfaceDescription.AlphaClipThreshold = _AlphaCutoff;
				#endif

				#ifdef _ENABLE_GEOMETRIC_SPECULAR_AA
				surfaceDescription.SpecularAAScreenSpaceVariance = 0;
				surfaceDescription.SpecularAAThreshold = 0;
				#endif

				#ifdef _SPECULAR_OCCLUSION_CUSTOM
				surfaceDescription.SpecularOcclusion = 0;
				#endif

				#if defined(_HAS_REFRACTION) || defined(_MATERIAL_FEATURE_TRANSMISSION)
				surfaceDescription.Thickness = 1;
				#endif

				#ifdef _HAS_REFRACTION
				surfaceDescription.RefractionIndex = 1;
				surfaceDescription.RefractionColor = float3( 1, 1, 1 );
				surfaceDescription.RefractionDistance = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
				surfaceDescription.SubsurfaceMask = 1;
				#endif

				#if defined( _MATERIAL_FEATURE_SUBSURFACE_SCATTERING ) || defined( _MATERIAL_FEATURE_TRANSMISSION )
				surfaceDescription.DiffusionProfile = 0;
				#endif

				#ifdef _MATERIAL_FEATURE_ANISOTROPY
				surfaceDescription.Anisotropy = 1;
				surfaceDescription.Tangent = float3( 1, 0, 0 );
				#endif

				#ifdef _MATERIAL_FEATURE_IRIDESCENCE
				surfaceDescription.IridescenceMask = 0;
				surfaceDescription.IridescenceThickness = 0;
				#endif

				#ifdef _ASE_BAKEDGI
				surfaceDescription.BakedGI = 0;
				#endif
				#ifdef _ASE_BAKEDBACKGI
				surfaceDescription.BakedBackGI = 0;
				#endif

				#ifdef _DEPTHOFFSET_ON
				surfaceDescription.DepthOffset = 0;
				#endif

				SurfaceData surfaceData;
				BuiltinData builtinData;
				GetSurfaceAndBuiltinData(surfaceDescription,input, V, posInput, surfaceData, builtinData);

				BSDFData bsdfData = ConvertSurfaceDataToBSDFData(input.positionSS.xy, surfaceData);

				PreLightData preLightData = GetPreLightData(V, posInput, bsdfData);

				outColor = float4(0.0, 0.0, 0.0, 0.0);
				#ifdef DEBUG_DISPLAY
				#ifdef OUTPUT_SPLIT_LIGHTING
					outDiffuseLighting = 0;
					ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#endif

				bool viewMaterial = false;
				int bufferSize = int(_DebugViewMaterialArray[0].x);
				if (bufferSize != 0)
				{
					bool needLinearToSRGB = false;
					float3 result = float3(1.0, 0.0, 1.0);

					for (int index = 1; index <= bufferSize; index++)
					{
						int indexMaterialProperty = int(_DebugViewMaterialArray[index].x);

						if (indexMaterialProperty != 0)
						{
							viewMaterial = true;

							GetPropertiesDataDebug(indexMaterialProperty, result, needLinearToSRGB);
							GetVaryingsDataDebug(indexMaterialProperty, input, result, needLinearToSRGB);
							GetBuiltinDataDebug(indexMaterialProperty, builtinData, posInput, result, needLinearToSRGB);
							GetSurfaceDataDebug(indexMaterialProperty, surfaceData, result, needLinearToSRGB);
							GetBSDFDataDebug(indexMaterialProperty, bsdfData, result, needLinearToSRGB);
						}
					}

					if (!needLinearToSRGB)
						result = SRGBToLinear(max(0, result));

					outColor = float4(result, 1.0);
				}

				if (!viewMaterial)
				{
					if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_DIFFUSE_COLOR || _DebugFullScreenMode == FULLSCREENDEBUGMODE_VALIDATE_SPECULAR_COLOR)
					{
						float3 result = float3(0.0, 0.0, 0.0);

						GetPBRValidatorDebug(surfaceData, result);

						outColor = float4(result, 1.0f);
					}
					else if (_DebugFullScreenMode == FULLSCREENDEBUGMODE_TRANSPARENCY_OVERDRAW)
					{
						float4 result = _DebugTransparencyOverdrawWeight * float4(TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_COST, TRANSPARENCY_OVERDRAW_A);
						outColor = result;
					}
					else
				#endif
					{
				#ifdef _SURFACE_TYPE_TRANSPARENT
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_TRANSPARENT;
				#else
						uint featureFlags = LIGHT_FEATURE_MASK_FLAGS_OPAQUE;
				#endif
					
						LightLoopOutput lightLoopOutput;
						LightLoop(V, posInput, preLightData, bsdfData, builtinData, featureFlags, lightLoopOutput);

						// Alias
						float3 diffuseLighting = lightLoopOutput.diffuseLighting;
						float3 specularLighting = lightLoopOutput.specularLighting;
					
						diffuseLighting *= GetCurrentExposureMultiplier();
						specularLighting *= GetCurrentExposureMultiplier();

				#ifdef OUTPUT_SPLIT_LIGHTING
						if (_EnableSubsurfaceScattering != 0 && ShouldOutputSplitLighting(bsdfData))
						{
							outColor = float4(specularLighting, 1.0);
							outDiffuseLighting = float4(TagLightingForSSS(diffuseLighting), 1.0);
						}
						else
						{
							outColor = float4(diffuseLighting + specularLighting, 1.0);
							outDiffuseLighting = 0;
						}
						ENCODE_INTO_SSSBUFFER(surfaceData, posInput.positionSS, outSSSBuffer);
				#else
						outColor = ApplyBlendMode(diffuseLighting, specularLighting, builtinData.opacity);
						outColor = EvaluateAtmosphericScattering(posInput, V, outColor);
				#endif

				#ifdef _WRITE_TRANSPARENT_MOTION_VECTOR
						float4 VPASSpositionCS = float4(packedInput.vpassPositionCS.xy, 0.0, packedInput.vpassPositionCS.z);
						float4 VPASSpreviousPositionCS = float4(packedInput.vpassPreviousPositionCS.xy, 0.0, packedInput.vpassPreviousPositionCS.z);

						bool forceNoMotion = any(unity_MotionVectorsParams.yw == 0.0);
						if (!forceNoMotion)
						{
							float2 motionVec = CalculateMotionVector(VPASSpositionCS, VPASSpreviousPositionCS);
							EncodeMotionVector(motionVec * 0.5, outMotionVec);
							outMotionVec.zw = 1.0;
						}
				#endif
					}

				#ifdef DEBUG_DISPLAY
				}
				#endif

				#ifdef _DEPTHOFFSET_ON
				outputDepth = posInput.deviceDepth;
				#endif
			}
			ENDHLSL
		}
		
	}
	CustomEditor "Rendering.HighDefinition.LightingShaderGraphGUI"
	
	
}
/*ASEBEGIN
Version=18800
309;162;1266;746;-1359.479;752.4547;1.48811;True;False
Node;AmplifyShaderEditor.TextureCoordinatesNode;255;615.0826,-371.7701;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,4;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;154;-195.6228,411.2479;Float;False;Property;_Color4;Color 4;3;0;Create;True;0;0;0;False;0;False;0.1544118,0.5451319,1,0.253;0.9533468,1,0.1544118,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;180;-232.3431,1940.419;Float;False;Property;_Color10;Color 10;9;0;Create;True;0;0;0;False;0;False;0.362069,0.4411765,0,0.759;0.362069,0.4411765,0,0.759;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;182;-220.2247,2417.44;Float;False;Property;_Color12;Color 12;11;0;Create;True;0;0;0;False;0;False;0.5073529,0.1574544,0,0.128;0.5073529,0.1574544,0,0.128;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;150;-207.7412,-66.93771;Float;False;Property;_Color2;Color 2;1;0;Create;True;0;0;0;False;0;False;1,0.1544118,0.8017241,0.253;1,0.1544118,0.8017241,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;156;-195.9079,947.3851;Float;False;Property;_Color6;Color 6;5;0;Create;True;0;0;0;False;0;False;0.2720588,0.1294625,0,0.097;1,0.4519259,0.1529412,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;183;-224.4024,1681.061;Float;False;Property;_Color9;Color 9;8;0;Create;True;0;0;0;False;1;Space(10);False;0.3164301,0,0.7058823,0.134;0.1529412,0.9929401,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;218;-229.103,3176.23;Float;False;Property;_Color15;Color 15;14;0;Create;True;0;0;0;False;0;False;1,0,0,0.391;1,0,0,0.391;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;157;-182.3802,1181.25;Float;False;Property;_Color7;Color 7;6;0;Create;True;0;0;0;False;0;False;0.1544118,0.6151115,1,0.178;0.9099331,0.9264706,0.6267301,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;230;859.2263,-398.1579;Inherit;True;Property;_Gradient;Gradient;33;1;[SingleLineTexture];Create;True;0;0;0;False;1;Header(Gradient);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;217;-264.3738,3419.386;Float;False;Property;_Color16;Color 16;15;0;Create;True;0;0;0;False;0;False;0.4080882,0.75,0.4811866,0.134;0.4080882,0.75,0.4811865,0.134;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;229;874.0561,-170.8387;Float;False;Property;_GradientColor;Gradient Color;35;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;228;845.7399,12.46821;Float;False;Property;_GradientIntensity;Gradient Intensity;34;0;Create;True;0;0;0;False;0;False;0.75;0.75;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;181;-218.8154,2174.284;Float;False;Property;_Color11;Color 11;10;0;Create;True;0;0;0;False;0;False;0.6691177,0.6691177,0.6691177,0.647;0.6691177,0.6691177,0.6691177,0.647;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;158;-183.7895,1424.406;Float;False;Property;_Color8;Color 8;7;0;Create;True;0;0;0;False;0;False;0.4849697,0.5008695,0.5073529,0.078;0.1544118,0.1602434,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;159;-187.9672,688.0273;Float;False;Property;_Color5;Color 5;4;0;Create;True;0;0;0;False;1;Space(10);False;0.9533468,1,0.1544118,0.553;0.2669384,0.3207547,0.0226949,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;152;-194.2135,166.9271;Float;False;Property;_Color3;Color 3;2;0;Create;True;0;0;0;False;0;False;0.2535501,0.1544118,1,0.541;0.2535501,0.1544118,1,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;213;-234.6901,2683.007;Float;False;Property;_Color13;Color 13;12;0;Create;True;0;0;0;False;1;Space(10);False;1,0.5586207,0,0.272;1,0.5586207,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;23;-199.8005,-326.2955;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;0;False;1;Header(Albedo (A Gradient));False;1,0.1544118,0.1544118,0.291;1,0.1544118,0.1544118,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;214;-242.6307,2942.365;Float;False;Property;_Color14;Color 14;13;0;Create;True;0;0;0;False;0;False;0,0.8025862,0.875,0.047;0,0.8025862,0.875,0.047;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;224;86.61465,3181.071;Inherit;True;ColorShartSlot;-1;;705;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;149;107.9764,-62.09709;Inherit;True;ColorShartSlot;-1;;710;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;151;121.5042,171.7677;Inherit;True;ColorShartSlot;-1;;709;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;216;81.02762,2687.848;Inherit;True;ColorShartSlot;-1;;708;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;232;1156.605,-68.40891;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;145;115.9171,-321.4549;Inherit;True;ColorShartSlot;-1;;707;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;231;1182.122,-372.6908;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;153;122.0185,414.924;Inherit;True;ColorShartSlot;-1;;706;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;161;133.3375,1186.091;Inherit;True;ColorShartSlot;-1;;704;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;185;97.41646,2422.281;Inherit;True;ColorShartSlot;-1;;698;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;223;73.08682,2945.046;Inherit;True;ColorShartSlot;-1;;702;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;187;83.37437,1945.26;Inherit;True;ColorShartSlot;-1;;701;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;160;119.8096,952.2258;Inherit;True;ColorShartSlot;-1;;700;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;163;127.7504,692.868;Inherit;True;ColorShartSlot;-1;;699;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;186;96.90227,2179.125;Inherit;True;ColorShartSlot;-1;;697;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;162;133.8517,1429.247;Inherit;True;ColorShartSlot;-1;;696;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;222;87.12894,3424.227;Inherit;True;ColorShartSlot;-1;;689;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;188;91.31517,1685.902;Inherit;True;ColorShartSlot;-1;;703;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;291;881.6017,5108.58;Float;False;Property;_MRE13;MRE 13;28;0;Create;True;0;0;0;False;1;Space(10);False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;263;924.805,2591.167;Float;False;Property;_MRE3;MRE 3;18;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;262;888.3417,3297.014;Float;False;Property;_MRE6;MRE 6;21;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;264;887.6243,3070.586;Float;False;Property;_MRE5;MRE 5;20;0;Create;True;0;0;0;False;1;Space(10);False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;266;927.7203,2799.667;Float;False;Property;_MRE4;MRE 4;19;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;268;920.3644,2166.243;Float;False;Property;_MRE1;MRE 1;16;0;Create;True;0;0;0;False;1;Header(Metallic(R) Rough(G) Emmission(B));False;0,1,0,0;0,0.117647,0.4117647,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;265;928.9007,2379.895;Float;False;Property;_MRE2;MRE 2;17;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;290;881.4436,4270.979;Float;False;Property;_MRE10;MRE 10;25;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;269;876.3038,4037.208;Float;False;Property;_MRE9;MRE 9;24;0;Create;True;0;0;0;False;1;Space(10);False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;184;686.7443,1260.558;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;270;881.4384,3724.796;Float;False;Property;_MRE8;MRE 8;23;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;293;888.8267,5554.006;Float;False;Property;_MRE15;MRE 15;30;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;225;683.3512,1524.765;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;164;688.9302,993.4156;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;267;883.4818,3508.669;Float;False;Property;_MRE7;MRE 7;22;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;292;886.7413,5342.351;Float;False;Property;_MRE14;MRE 14;29;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;233;1367.421,-383.9108;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;294;884.4691,5770.134;Float;False;Property;_MRE16;MRE 16;31;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;288;881.2148,4482.635;Float;False;Property;_MRE11;MRE 11;26;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;146;688.2412,727.387;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;287;879.1714,4698.762;Float;False;Property;_MRE12;MRE 12;27;0;Create;True;0;0;0;False;0;False;0,1,0,0;0,1,0,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;285;1189.334,4470.5;Inherit;True;ColorShartSlot;-1;;731;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;3;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;238;1648.681,-135.2692;Float;False;Property;_GradientScale;Gradient Scale;36;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;239;1655.499,-42.52599;Float;False;Property;_GradientOffset;Gradient Offset;37;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;279;1189.043,3496.534;Inherit;True;ColorShartSlot;-1;;736;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;3;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;271;1202.304,2381.9;Inherit;True;ColorShartSlot;-1;;735;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;2;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;286;1180.335,4692.998;Inherit;True;ColorShartSlot;-1;;734;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;4;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;272;1173.398,4034.921;Inherit;True;ColorShartSlot;-1;;733;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;1;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;298;1185.632,5764.37;Inherit;True;ColorShartSlot;-1;;732;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;4;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;234;1652.17,-392.4709;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;155;1016.686,1030.498;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;273;1187.369,3281.62;Inherit;True;ColorShartSlot;-1;;727;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;2;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;278;1189.738,3073.549;Inherit;True;ColorShartSlot;-1;;729;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;1;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;289;1187.66,4255.586;Inherit;True;ColorShartSlot;-1;;728;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;2;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;276;1182.602,3719.032;Inherit;True;ColorShartSlot;-1;;726;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;4;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;296;1192.958,5326.958;Inherit;True;ColorShartSlot;-1;;725;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;2;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;297;1194.631,5541.872;Inherit;True;ColorShartSlot;-1;;724;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;3;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;295;1178.695,5106.292;Inherit;True;ColorShartSlot;-1;;723;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;1;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;275;1204.517,2165.975;Inherit;True;ColorShartSlot;-1;;722;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;1;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;274;1200.378,2592.315;Inherit;True;ColorShartSlot;-1;;714;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;3;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;277;1200.345,2802.812;Inherit;True;ColorShartSlot;-1;;730;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;1,1,1,1;False;3;FLOAT;4;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;237;1929.951,-353.3528;Inherit;True;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;299;1571.928,5274.19;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;282;1553.285,3234.033;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;280;1566.631,4202.819;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;281;1569.768,2500.448;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;245;1659.99,53.90989;Float;False;Property;_GradientPower;Gradient Power;38;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;256;2060.061,-74.53971;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;283;1960.203,2821.543;Inherit;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;258;2237.497,-354.0456;Inherit;True;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;259;2282.192,-66.26985;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;302;2524.654,1230.847;Inherit;False;Property;_EmissionPower1;Emission Power;32;0;Create;True;0;0;0;False;1;Header(Emmision);False;1;4.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;301;2514.004,1365.87;Inherit;True;False;False;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;260;2530.138,-355.3468;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;261;2796.672,-358.3472;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,1;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;306;2576.238,929.5774;Inherit;True;False;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;303;2828.549,1217.506;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;284;2918.832,2649.558;Inherit;True;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;305;2944.843,925.5689;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;307;2570.26,731.6305;Inherit;True;True;False;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;304;3114.618,1152.562;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;236;3433.932,229.384;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;317;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPostpass;0;9;TransparentDepthPostpass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;True;-25;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPostpass;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;308;4040.206,769.1205;Float;False;True;-1;2;Rendering.HighDefinition.LightingShaderGraphGUI;0;2;Malbers/Color4x4v2;53b46d85872c5b24c8f4f0a1c3fe4c87;True;GBuffer;0;0;GBuffer;35;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;True;True;0;True;-13;255;False;-1;255;True;-12;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;0;True;-14;False;True;1;LightMode=GBuffer;False;0;;0;0;Standard;41;Surface Type;0;  Rendering Pass;1;  Refraction Model;0;    Blending Mode;0;    Blend Preserves Specular;1;  Receive Fog;1;  Back Then Front Rendering;0;  Transparent Depth Prepass;0;  Transparent Depth Postpass;0;  Transparent Writes Motion Vector;0;  Distortion;0;    Distortion Mode;0;    Distortion Depth Test;1;  ZWrite;0;  Z Test;4;Double-Sided;0;Alpha Clipping;0;  Use Shadow Threshold;0;Material Type,InvertActionOnDeselection;0;  Energy Conserving Specular;1;  Transmission;1;Receive Decals;1;Receives SSR;1;Motion Vectors;1;  Add Precomputed Velocity;0;Specular AA;0;Specular Occlusion Mode;1;Override Baked GI;0;Depth Offset;0;DOTS Instancing;0;LOD CrossFade;0;Tessellation;0;  Phong;0;  Strength;0.5,False,-1;  Type;0;  Tess;16,False,-1;  Min;10,False,-1;  Max;25,False,-1;  Edge Length;16,False,-1;  Max Displacement;25,False,-1;Vertex Position;1;0;11;True;True;True;True;True;True;False;False;False;False;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;309;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;META;0;1;META;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;310;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;False;False;False;False;False;False;True;0;True;-25;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;311;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;SceneSelectionPass;0;3;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;312;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;DepthOnly;0;4;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;True;True;0;True;-6;255;False;-1;255;True;-7;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;313;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Motion Vectors;0;5;Motion Vectors;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;False;False;False;False;False;False;False;False;False;True;0;True;-25;False;False;False;False;True;True;0;True;-8;255;False;-1;255;True;-9;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;1;False;-1;False;False;True;1;LightMode=MotionVectors;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;314;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Distortion;0;6;Distortion;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;4;1;False;-1;1;False;-1;4;1;False;-1;1;False;-1;True;1;False;-1;1;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;True;0;True;-10;255;False;-1;255;True;-11;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;2;False;-1;True;3;False;-1;False;True;1;LightMode=DistortionVectors;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;315;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentBackface;0;7;TransparentBackface;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;True;1;False;-1;False;True;True;True;True;True;0;True;-44;False;False;False;True;0;True;-23;True;0;True;-31;False;True;1;LightMode=TransparentBackface;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;318;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;Forward;0;10;Forward;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;0;True;-19;0;True;-20;1;0;True;-21;0;True;-22;False;False;False;False;False;False;False;False;True;0;True;-28;False;True;True;True;True;True;0;True;-44;False;False;True;True;0;True;-4;255;False;-1;255;True;-5;7;False;-1;3;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;True;0;True;-23;True;0;True;-30;False;True;1;LightMode=Forward;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;316;4040.206,769.1205;Float;False;False;-1;2;Rendering.HighDefinition.LitShaderGraphGUI;0;1;New Amplify Shader;53b46d85872c5b24c8f4f0a1c3fe4c87;True;TransparentDepthPrepass;0;8;TransparentDepthPrepass;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderPipeline=HDRenderPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;5;0;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;True;0;True;-25;True;False;False;False;False;0;False;-1;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=TransparentDepthPrepass;False;0;;0;0;Standard;0;False;0
WireConnection;230;1;255;0
WireConnection;224;38;218;0
WireConnection;149;38;150;0
WireConnection;151;38;152;0
WireConnection;216;38;213;0
WireConnection;232;0;228;0
WireConnection;145;38;23;0
WireConnection;231;0;230;0
WireConnection;231;1;229;0
WireConnection;153;38;154;0
WireConnection;161;38;157;0
WireConnection;185;38;182;0
WireConnection;223;38;214;0
WireConnection;187;38;180;0
WireConnection;160;38;156;0
WireConnection;163;38;159;0
WireConnection;186;38;181;0
WireConnection;162;38;158;0
WireConnection;222;38;217;0
WireConnection;188;38;183;0
WireConnection;184;0;188;0
WireConnection;184;1;187;0
WireConnection;184;2;186;0
WireConnection;184;3;185;0
WireConnection;225;0;216;0
WireConnection;225;1;223;0
WireConnection;225;2;224;0
WireConnection;225;3;222;0
WireConnection;164;0;163;0
WireConnection;164;1;160;0
WireConnection;164;2;161;0
WireConnection;164;3;162;0
WireConnection;233;0;231;0
WireConnection;233;1;232;0
WireConnection;146;0;145;0
WireConnection;146;1;149;0
WireConnection;146;2;151;0
WireConnection;146;3;153;0
WireConnection;285;38;288;0
WireConnection;279;38;267;0
WireConnection;271;38;265;0
WireConnection;286;38;287;0
WireConnection;272;38;269;0
WireConnection;298;38;294;0
WireConnection;234;0;233;0
WireConnection;155;0;146;0
WireConnection;155;1;164;0
WireConnection;155;2;184;0
WireConnection;155;3;225;0
WireConnection;273;38;262;0
WireConnection;278;38;264;0
WireConnection;289;38;290;0
WireConnection;276;38;270;0
WireConnection;296;38;292;0
WireConnection;297;38;293;0
WireConnection;295;38;291;0
WireConnection;275;38;268;0
WireConnection;274;38;263;0
WireConnection;277;38;266;0
WireConnection;237;0;234;0
WireConnection;237;1;238;0
WireConnection;237;2;239;0
WireConnection;299;0;295;0
WireConnection;299;1;296;0
WireConnection;299;2;297;0
WireConnection;299;3;298;0
WireConnection;282;0;278;0
WireConnection;282;1;273;0
WireConnection;282;2;279;0
WireConnection;282;3;276;0
WireConnection;280;0;272;0
WireConnection;280;1;289;0
WireConnection;280;2;285;0
WireConnection;280;3;286;0
WireConnection;281;0;275;0
WireConnection;281;1;271;0
WireConnection;281;2;274;0
WireConnection;281;3;277;0
WireConnection;256;0;155;0
WireConnection;283;0;281;0
WireConnection;283;1;282;0
WireConnection;283;2;280;0
WireConnection;283;3;299;0
WireConnection;258;0;237;0
WireConnection;258;1;245;0
WireConnection;259;0;256;0
WireConnection;301;0;283;0
WireConnection;260;0;258;0
WireConnection;260;1;259;0
WireConnection;261;0;260;0
WireConnection;306;0;283;0
WireConnection;303;0;302;0
WireConnection;303;1;301;0
WireConnection;284;0;283;0
WireConnection;305;0;306;0
WireConnection;307;0;283;0
WireConnection;304;0;155;0
WireConnection;304;1;303;0
WireConnection;236;0;261;0
WireConnection;236;1;155;0
WireConnection;308;0;236;0
WireConnection;308;4;307;0
WireConnection;308;6;304;0
WireConnection;308;7;305;0
ASEEND*/
//CHKSM=7D7CACAAB0763180302441BDA15F217E500E4D38