Shader "CustomRenderTexture/MirrorDisplacementTexture"
{
    Properties
	{
        _Tex("Mask Texture", 2D) = "white" {}
        //_Tex2("Ramp Texture", 2D) = "white" {}

        [Enum(ABS, 0, ZeroOne, 1)] _NoiseRange("Noise Range", Float) = 0
        _NoiseFreq("Noise Frequency", Float) = 9.0
		_FlowSpeed("Noise Flow (u, v, w)", Vector) = (1,1,1)

		_DisplacementProps("Displacement (scale, offset)", Vector) = (4.25, -.3, 0, 0)

		_PeakProps("Peak (scale, power, maxClamp)", Vector) = (1, 3, 999, 0)

		_WaveProps("Wave (scale, power, offset, minClamp)", Vector) = (1,1,-.6,0)

		_SineProps("Sine (scale, freq, speed)", Vector) = (.3, 12, 24, 0)
        [Enum(Multiply, 0, Add, 1)] _SineOp("Sine Combiner", Float) = 0

		_Rotation("Rotation", Float) = -.65
	
    }

    SubShader
    {
        Lighting Off
        Blend One Zero

        Pass
        {
            CGPROGRAM
            #include "UnityCustomRenderTexture.cginc"
			#include "noiseSimplex.cginc"
            #pragma vertex CustomRenderTextureVertexShader
            #pragma fragment frag
            #pragma target 3.0

			#define PI				(3.1415926535)
			#define TWO_PI			(2.0*PI)
			#define PI_OVER_TWO		(0.5*PI)
			#define PI_OVER_FOUR	(0.25*PI)

			// Globals
			float4 _TimelineTime;

            sampler2D   _Tex;
            //sampler2D   _Tex2;

			float		_NoiseRange;
			float		_NoiseFreq;
			float3		_FlowSpeed;

			float		_Rotation;
			float4		_DisplacementProps;

			float4		_PeakProps;

			float4		_WaveProps;

			float4		_SineProps;
			float		_SineOp;

			inline float2x2 mat_rot(float theta)
			{
				float c = cos(theta);
				float s = sin(theta);
				float2x2 mat = {c, -s, s, c};
				return mat;
			}

			inline float2 uv_rot(float2 uv, float theta)
			{
				float2x2 rotation = mat_rot(theta);
				float2 uvp = mul(rotation, uv - float2(0.5,0.5)) + float2(0.5,0.5);
				return uvp;
			}

			inline float wave_sin(float p)
			{
				return sin(p * TWO_PI);
			}

			inline float wave_square(float p)
			{
				float f = frac(p);
				return (f < 0.5) ? 1.0 : -1.0;
			}

			inline float3 noiseCoords(float2 uv, float time, float freq, float3 flowSpeed)
			{
				float3 coords = float3(uv.x, uv.y, 0);
				coords += time * flowSpeed * float3(-1, 1, 1);
				coords *= float3(freq, freq, 1);			
				return coords;
			}

			inline float noiseWave(float noise, float power, float offset, float minClamp)
			{
				float wave = 1.0 - noise;
				wave = pow(wave, power);
				wave += offset;			
				wave = max(wave, minClamp);
				return wave;
			}

			inline float sineWave(float2 uv, float time, float freq, float speed, float scale)
			{
				float v = wave_sin((uv.x * freq - time * speed)) * scale + (1.0-scale);
				return v;
			}


			inline float fx_simplex(float2 uv, float time, float freq, float3 flowSpeed, float4 peakProps, float4 waveProps, float4 sineProps, float4 displaceProps, float noiseRangeMode)
			{
				float noise = snoise(noiseCoords(uv, time, freq, flowSpeed));

				if(noiseRangeMode==0)
					noise = saturate(abs(noise));
				else
					noise = saturate(noise * 0.5 + 0.5);

				float wave = noiseWave(noise, waveProps.y, waveProps.z, waveProps.w) * waveProps.x;
				float peaks = min(saturate(pow(noise, peakProps.y) ) * peakProps.x, peakProps.z);
				float sine = sineWave(uv, time, sineProps.y, sineProps.z, sineProps.x);
				
				float result = 0;
				if(_SineOp==0)
					result = (wave + peaks) * sine * displaceProps.x + displaceProps.y;
				else
					result = (wave + peaks + sine) * displaceProps.x + displaceProps.y;
				
				return result;
			}


            float4 frag(v2f_customrendertexture IN) : COLOR
            {
				float time = _Time.x;//_TimelineTime.x;
				float2 uv = IN.localTexcoord.xy;
				uv.x = (uv.x >= 0.5) ? uv.x : 1.0 - uv.x;
				float disp = fx_simplex(uv_rot(uv, _Rotation), time, _NoiseFreq, _FlowSpeed, _PeakProps, _WaveProps, _SineProps, _DisplacementProps, _NoiseRange);

				return disp * tex2D(_Tex, IN.localTexcoord.xy).a;
            }
            ENDCG
        }
    }
}
