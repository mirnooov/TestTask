Shader "CustomRenderTexture/MirrorRenderNormals"
{
    Properties
	{
        _Tex("Displacement Texture", 2D) = "white" {}
        //_NormalStrength("Normal Strength", Range(0.0, 1.0)) = 1.0
		_NormalStrength("Normal Strength", Float) = 1.0
		_Displacement("Displacement", Float) = 1.0

    }

    SubShader
    {
        Lighting Off
        Blend One Zero

        Pass
        {
            CGPROGRAM
            #include "UnityCustomRenderTexture.cginc"
            #pragma vertex CustomRenderTextureVertexShader
            #pragma fragment frag
            #pragma target 5.0

            sampler2D   _Tex;
			float _NormalStrength;
			float _Displacement;
			

            float4 frag(v2f_customrendertexture IN) : COLOR
            {
                float disp = tex2D(_Tex, IN.localTexcoord.xy).r * _NormalStrength * _Displacement;

				float dudx = ddx_fine(IN.localTexcoord.x);
				float dudy = ddy_fine(IN.localTexcoord.y);

				float3 dx = float3(dudx, 0, ddx_fine(disp));
				float3 dy = float3(0, dudy, ddy_fine(disp));
				float3 n = normalize(cross(dx, dy));
				float3 cn = n * 0.5 + 0.5;
				return float4(cn, 1.0);
            }
            ENDCG
        }
    }
}
