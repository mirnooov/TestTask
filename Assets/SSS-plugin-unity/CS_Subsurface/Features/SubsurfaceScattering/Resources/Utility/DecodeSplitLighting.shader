Shader "Hidden/DecodeSplitLighting"
{
	Properties{
    }

	SubShader{
		Pass{
			Name "SSS"
			Cull Off ZWrite Off ZTest Always
			
			Stencil	{
				Ref 1
				Comp Equal
				Pass Keep
			}

			CGPROGRAM
			#pragma target 4.5

			#pragma vertex   VertProcedural
			#pragma fragment FragDecode

            #include "../Common.cginc"

            struct PixelOutput
            {
                half4 diffuse  : SV_Target0;
                half4 specular : SV_Target1;
            };

            Texture2D _EncodedLighting;
            PixelOutput FragDecode(ProceduralVaryings i){
                PositionInputs posInput = GetPositionInput(i.positionCS.xy, _ScreenParams.zw - 1.0, uint2(0,0));
		        half4 lighting = _EncodedLighting.Load(int3(posInput.unPositionSS.xy, 0));

                half3 diffuse;
                half3 specular;
				DecodeSplitLighting(lighting.rgb, lighting.a, diffuse, specular);

				PixelOutput o;
                UNITY_INITIALIZE_OUTPUT(PixelOutput, o);
                o.diffuse  = half4(diffuse,  1.0);
                o.specular = half4(specular, 1.0);
                return o;
            }

			ENDCG
		}
	}
Fallback Off
}