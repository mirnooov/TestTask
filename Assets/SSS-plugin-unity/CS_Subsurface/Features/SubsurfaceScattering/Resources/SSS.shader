Shader "Hidden/SSS"
{
    CGINCLUDE

    // Tweak parameters for the Disney SSS below.
    #define SSS_BILATERAL_FILTER  1
    #define SSS_CLAMP_ARTIFACT    0
    #define SSS_DEBUG_LOD         0
    #define SSS_DEBUG_NORMAL_VS   0

    // Do not modify these.
    #define SSS_USE_TANGENT_PLANE 0 //Currenty don't have access to WS normals for this to function.
    #define SSS_PASS              1
    #define MILLIMETERS_PER_METER 1000
    #define CENTIMETERS_PER_METER 100

    //-------------------------------------------------------------------------------------
    // Include
    //-------------------------------------------------------------------------------------

    #include "Common.cginc"

    //-------------------------------------------------------------------------------------
    // Inputs & outputs
    //-------------------------------------------------------------------------------------


    float  _WorldScales[SSS_N_PROFILES];                                         // Size of the world unit in meters
#ifdef SSS_MODEL_DISNEY
    float4x4 _ViewMatrix, _ProjMatrix;                                           // TEMP: make these global
    float  _FilterKernelsNearField[SSS_N_PROFILES][SSS_N_SAMPLES_NEAR_FIELD][2]; // 0 = radius, 1 = reciprocal of the PDF
    float  _FilterKernelsFarField[SSS_N_PROFILES][SSS_N_SAMPLES_FAR_FIELD][2];   // 0 = radius, 1 = reciprocal of the PDF
#else
    float4 _FilterKernelsBasic[SSS_N_PROFILES][SSS_BASIC_N_SAMPLES];             // RGB = weights, A = radial distance
    float4 _HalfRcpWeightedVariances[SSS_BASIC_N_SAMPLES];                       // RGB for chromatic, A for achromatic
#endif

    TEXTURE2D(_IrradianceSource);             // Includes transmitted light
    TEXTURE2D(_SSSSpecular);
    TEXTURE2D(_SSSParams);
    TEXTURE2D(_CameraGBufferTexture0);
    TEXTURE2D(_CameraDepthTexture);

    //-------------------------------------------------------------------------------------
    // Implementation
    //-------------------------------------------------------------------------------------

    // Computes the value of the integrand over a disk: (2 * PI * r) * KernelVal().
    // N.b.: the returned value is multiplied by 4. It is irrelevant due to weight renormalization.
    float3 KernelValCircle(float r, float3 S)
    {
        float3 expOneThird = exp(((-1.0 / 3.0) * r) * S);
        return /* 0.25 * */ S * (expOneThird + expOneThird * expOneThird * expOneThird);
    }

    // Computes F(r)/P(r), s.t. r = sqrt(a^2 + b^2).
    // Rescaling of the PDF is handled by 'totalWeight'.
    float3 ComputeBilateralWeight(float a2, float b, float mmPerUnit, float3 S, float rcpPdf)
    {
    #if (SSS_BILATERAL_FILTER == 0)
        b = 0;
    #endif

    #if SSS_USE_TANGENT_PLANE
        // Both 'a2' and 'b2' require unit conversion.
        float r = sqrt(a2 + b * b) * mmPerUnit;
    #else
        // Only 'b2' requires unit conversion.
        float r = sqrt(a2 + (b * mmPerUnit) * (b * mmPerUnit));
    #endif

    #if SSS_CLAMP_ARTIFACT
        return saturate(KernelValCircle(r, S) * rcpPdf);
    #else
        return KernelValCircle(r, S) * rcpPdf;
    #endif
    }

    #define SSS_ITER(i, n, kernel, profileID, shapeParam, centerPosUnSS, centerPosVS,   \
                        useTangentPlane, tangentX, tangentY, mmPerUnit, pixelsPerMm,       \
                        totalIrradiance, totalWeight)                                      \
    {                                                                                   \
        float  r   = kernel[profileID][i][0];                                           \
        /* The relative sample position is known at compile time. */                    \
        float  phi = SampleDiskFibonacci(i, n).y;                                       \
        float2 vec = r * float2(cos(phi), sin(phi));                                    \
                                                                                        \
        /* Compute the screen-space position and the associated irradiance. */          \
        float2 position; float3 irradiance;                                             \
        /* Compute the squared distance (in mm) in the screen-aligned plane. */         \
        float dXY2;                                                                     \
                                                                                        \
        if (useTangentPlane)                                                            \
        {                                                                               \
            /* 'vec' is given relative to the tangent frame. */                         \
            float3 relPosVS   = vec.x * tangentX + vec.y * tangentY;                    \
            float3 positionVS = centerPosVS + relPosVS;                                 \
            float4 positionCS = mul(_ProjMatrix, float4(positionVS, 1));                \
            float2 positionSS = positionCS.xy * (rcp(positionCS.w) * 0.5) + 0.5;        \
                                                                                        \
            position   = positionSS * 1; /*_ScreenSize.xy;*/                            \
            irradiance = LOAD_TEXTURE2D(_IrradianceSource, position).rgb;               \
            dXY2       = dot(relPosVS.xy, relPosVS.xy);                                 \
        }                                                                               \
        else                                                                            \
        {                                                                               \
            /* 'vec' is given directly in screen-space. */                              \
            position   = centerPosUnSS + vec * pixelsPerMm;                             \
            irradiance = LOAD_TEXTURE2D(_IrradianceSource, position).rgb;               \
            dXY2       = r * r;                                                         \
        }                                                                               \
                                                                                        \
        /* TODO: see if making this a [branch] improves performance. */                 \
        [flatten]                                                                       \
        if (any(irradiance))                                                            \
        {                                                                               \
            /* Apply bilateral weighting. */                                            \
            float  z = LOAD_TEXTURE2D(_CameraDepthTexture, position).r;                   \
            float  d = LinearEyeDepth(z);                               				\
            float  t = d - centerPosVS.z;                                               \
            float  p = kernel[profileID][i][1];                                         \
            float3 w = ComputeBilateralWeight(dXY2, t, mmPerUnit, shapeParam, p);       \
                                                                                        \
            totalIrradiance += w * irradiance;                                          \
            totalWeight     += w;                                                       \
        }                                                                               \
        else                                                                            \
        {                                                                               \
            /*************************************************************************/ \
            /* The irradiance is 0. This could happen for 3 reasons.                 */ \
            /* Most likely, the surface fragment does not have an SSS material.      */ \
            /* Alternatively, our sample comes from a region without any geometry.   */ \
            /* Finally, the surface fragment could be completely shadowed.           */ \
            /* Our blur is energy-preserving, so 'centerWeight' should be set to 0.  */ \
            /* We do not terminate the loop since we want to gather the contribution */ \
            /* of the remaining samples (e.g. in case of hair covering skin).        */ \
            /* Note: See comment in the output of deferred.shader                    */ \
            /*************************************************************************/ \
        }                                                                               \
    }

    #define SSS_LOOP(n, kernel, profileID, shapeParam, centerPosUnSS, centerPosVS,      \
                        useTangentPlane, tangentX, tangentY, mmPerUnit, pixelsPerMm,       \
                        totalIrradiance, totalWeight)                                      \
    {                                                                                   \
        float  centerRadius = kernel[profileID][0][0];                                  \
        float  centerRcpPdf = kernel[profileID][0][1];                                  \
        float3 centerWeight = KernelValCircle(centerRadius, shapeParam) * centerRcpPdf; \
                                                                                        \
        totalIrradiance = centerWeight * centerIrradiance;                              \
        totalWeight     = centerWeight;                                                 \
                                                                                        \
        /* Integrate over the screen-aligned or tangent plane in the view space. */     \
        [unroll]                                                                        \
        for (uint i = 1; i < n; i++)                                                    \
        {                                                                               \
            SSS_ITER(i, n, kernel, profileID, shapeParam, centerPosUnSS, centerPosVS,   \
                        useTangentPlane, tangentX, tangentY, mmPerUnit, pixelsPerMm,       \
                        totalIrradiance, totalWeight)                                      \
        }                                                                               \
    }

    float4 Frag(ProceduralVaryings input) : SV_Target
    {
        PositionInputs posInput = GetPositionInput(input.positionCS.xy, _ScreenParams.zw - 1.0, uint2(0,0));

        fixed4 params 	    = LOAD_TEXTURE2D(_SSSParams, posInput.unPositionSS);

        int    profileID   = UnpackByte(params.a);
        float  distScale   = params.r;

    #ifdef SSS_MODEL_DISNEY
        float3 shapeParam  = _ShapeParams[profileID].rgb;
        float  maxDistance = _ShapeParams[profileID].a;
    #else
        float  maxDistance = _FilterKernelsBasic[profileID][SSS_BASIC_N_SAMPLES - 1].a;
    #endif

        // Take the first (central) sample.
        // TODO: copy its neighborhood into LDS.
        float2 centerPosition   = posInput.unPositionSS;
        float3 centerIrradiance = LOAD_TEXTURE2D(_IrradianceSource, centerPosition).rgb;

        // Reconstruct the view-space position.
        float2 centerPosSS = posInput.positionSS;
        float2 cornerPosSS = centerPosSS + 0.5 * (_ScreenParams.zw - 1.0);
        float  centerDepth = LOAD_TEXTURE2D(_CameraDepthTexture, centerPosition).r;
        float3 centerPosVS = ComputeViewSpacePosition(centerPosSS, centerDepth, _InvProjMatrix);
        float3 cornerPosVS = ComputeViewSpacePosition(cornerPosSS, centerDepth, _InvProjMatrix);

    #ifdef SSS_MODEL_DISNEY
        // Rescaling the filter is equivalent to inversely scaling the world.
        float mmPerUnit  = MILLIMETERS_PER_METER * (_WorldScales[profileID] / distScale);
        float unitsPerMm = rcp(mmPerUnit);

        // Compute the view-space dimensions of the pixel as a quad projected onto geometry.
        float2 unitsPerPixel = 2 * abs(cornerPosVS.xy - centerPosVS.xy);
        float2 pixelsPerMm   = rcp(unitsPerPixel) * unitsPerMm;

        // We perform point sampling. Therefore, we can avoid the cost
        // of filtering if we stay within the bounds of the current pixel.
        // We use the value of 1 instead of 0.5 as an optimization.
        // N.b.: our LoD selection algorithm is the same regardless of
        // whether we integrate over the tangent plane or not, since we
        // don't want the orientation of the tangent plane to create
        // divergence of execution across the warp.
        float maxDistInPixels = maxDistance * max(pixelsPerMm.x, pixelsPerMm.y);

        [branch]
        if (distScale == 0 || maxDistInPixels < 1)
        {
            #if SSS_DEBUG_LOD
                return float4(0, 0, 1, 1);
            #else
                float3 specular = LOAD_TEXTURE2D(_SSSSpecular, posInput.unPositionSS);
                float3 albedo   = LOAD_TEXTURE2D(_CameraGBufferTexture0, posInput.unPositionSS);
                return float4(specular + (sqrt(albedo) * centerIrradiance), 1);
            #endif
        }

        const bool useTangentPlane = SSS_USE_TANGENT_PLANE != 0;

        // Compute the tangent frame in view space.
        float3 normalVS = float3(0,0,0);//mul((float3x3)_ViewMatrix, bsdfData.normalWS);
        float3 tangentX = float3(0,0,0);//GetLocalFrame(normalVS)[0] * unitsPerMm;
        float3 tangentY = float3(0,0,0);//GetLocalFrame(normalVS)[1] * unitsPerMm;

    #if SSS_DEBUG_NORMAL_VS
        // We expect the view-space normal to be front-facing.
        //if (normalVS.z >= 0) return float4(1, 0, 0, 1);
    #endif

        // Accumulate filtered irradiance and bilateral weights (for renormalization).
        float3 totalIrradiance, totalWeight;

        // Use fewer samples for SS regions smaller than 5x5 pixels (rotated by 45 degrees).
        [branch]
        if (maxDistInPixels < SSS_LOD_THRESHOLD)
        {
            #if SSS_DEBUG_LOD
                return float4(0.5, 0.5, 0, 1);
            #else
                SSS_LOOP(SSS_N_SAMPLES_FAR_FIELD, _FilterKernelsFarField,
                            profileID, shapeParam, centerPosition, centerPosVS,
                            useTangentPlane, tangentX, tangentY, mmPerUnit, pixelsPerMm,
                            totalIrradiance, totalWeight)
            #endif
        }
        else
        {
            #if SSS_DEBUG_LOD
                return float4(1, 0, 0, 1);
            #else
                SSS_LOOP(SSS_N_SAMPLES_NEAR_FIELD, _FilterKernelsNearField,
                            profileID, shapeParam, centerPosition, centerPosVS,
                            useTangentPlane, tangentX, tangentY, mmPerUnit, pixelsPerMm,
                            totalIrradiance, totalWeight)
            #endif
        }
    #else
        // Rescaling the filter is equivalent to inversely scaling the world.
        float  metersPerUnit = _WorldScales[profileID] / distScale * SSS_BASIC_DISTANCE_SCALE;
        float  centimPerUnit = CENTIMETERS_PER_METER * metersPerUnit;
        // Compute the view-space dimensions of the pixel as a quad projected onto geometry.
        float2 unitsPerPixel = 2 * abs(cornerPosVS.xy - centerPosVS.xy);
        float2 pixelsPerCm   = rcp(centimPerUnit * unitsPerPixel);

        // Compute the filtering direction.
    #ifdef SSS_FILTER_HORIZONTAL_AND_COMBINE
        float2 unitDirection = float2(1, 0);
    #else
        float2 unitDirection = float2(0, 1);
    #endif

        float2   scaledDirection  = pixelsPerCm * unitDirection;
        float    phi              = 0; // Random rotation; unused for now
        float2x2 rotationMatrix   = float2x2(cos(phi), -sin(phi), sin(phi), cos(phi));
        float2   rotatedDirection = mul(rotationMatrix, scaledDirection);

        // Load (1 / (2 * WeightedVariance)) for bilateral weighting.
    #if RBG_BILATERAL_WEIGHTS
        float3 halfRcpVariance = _HalfRcpWeightedVariances[profileID].rgb;
    #else
        float  halfRcpVariance = _HalfRcpWeightedVariances[profileID].a;
    #endif

    #ifndef SSS_FILTER_HORIZONTAL_AND_COMBINE
        //diffuseColor = float3(1, 1, 1);
    #endif

        // Take the first (central) sample.
        float2 samplePosition   = posInput.unPositionSS;
        float3 sampleWeight     = _FilterKernelsBasic[profileID][0].rgb;
        float3 sampleIrradiance = LOAD_TEXTURE2D(_IrradianceSource, samplePosition).rgb;

        // We perform point sampling. Therefore, we can avoid the cost
        // of filtering if we stay within the bounds of the current pixel.
        // We use the value of 1 instead of 0.5 as an optimization.
        float maxDistInPixels = maxDistance * max(pixelsPerCm.x, pixelsPerCm.y);

        [branch]
        if (distScale == 0 || maxDistInPixels < 1)
        {
            float3 specular = LOAD_TEXTURE2D(_SSSSpecular, posInput.unPositionSS);
            return float4(specular + sampleIrradiance, 1);
        }

        // Accumulate filtered irradiance and bilateral weights (for renormalization).
        float3 totalIrradiance = sampleWeight * sampleIrradiance;
        float3 totalWeight     = sampleWeight;

        [unroll]
        for (int i = 1; i < SSS_BASIC_N_SAMPLES; i++)
        {
            samplePosition   = posInput.unPositionSS + rotatedDirection * _FilterKernelsBasic[profileID][i].a;
            sampleWeight     = _FilterKernelsBasic[profileID][i].rgb;
            sampleIrradiance = LOAD_TEXTURE2D(_IrradianceSource, samplePosition).rgb;

            [flatten]
            if (any(sampleIrradiance))
            {
                // Apply bilateral weighting.
                // Ref #1: Skin Rendering by Pseudo–Separable Cross Bilateral Filtering.
                // Ref #2: Separable SSS, Supplementary Materials, Section E.
                float rawDepth    = LOAD_TEXTURE2D(_CameraDepthTexture, samplePosition).r;
                float sampleDepth = LinearEyeDepth(rawDepth);
                float zDistance   = centimPerUnit * sampleDepth - (centimPerUnit * centerPosVS.z);
                sampleWeight     *= exp(-zDistance * zDistance * halfRcpVariance);

                totalIrradiance += sampleWeight * sampleIrradiance;
                totalWeight     += sampleWeight;
            }
            else
            {
                // The irradiance is 0. This could happen for 3 reasons.
                // Most likely, the surface fragment does not have an SSS material.
                // Alternatively, our sample comes from a region without any geometry.
                // Finally, the surface fragment could be completely shadowed.
                // Our blur is energy-preserving, so 'centerWeight' should be set to 0.
                // We do not terminate the loop since we want to gather the contribution
                // of the remaining samples (e.g. in case of hair covering skin).
            }
        }
    #endif


    #ifndef SSS_FILTER_HORIZONTAL_AND_COMBINE
        return float4((1.0 * totalIrradiance / totalWeight), 1);
    #else
        float3 specular = LOAD_TEXTURE2D(_SSSSpecular, posInput.unPositionSS);
        float3 albedo   = LOAD_TEXTURE2D(_CameraGBufferTexture0, posInput.unPositionSS);
        return float4(specular + (sqrt(albedo) * totalIrradiance / totalWeight), 1);
    #endif

    }
    ENDCG

    SubShader
    {
        Pass
        {
            Stencil
            {
                Ref  1 // StencilBits.SSS
                Comp Equal
                Pass Keep
            }

            Cull   Off
            ZTest  Always
            ZWrite Off
            Blend  One Zero

            CGPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 ps4 metal // TEMP: until we go further in dev
            // #pragma enable_d3d11_debug_symbols

            #pragma multi_compile SSS_MODEL_BASIC SSS_MODEL_DISNEY

            #pragma vertex   VertProcedural
            #pragma fragment Frag

            ENDCG
        }

        Pass
        {
            Stencil
            {
                Ref  1 // StencilBits.SSS
                Comp Equal
                Pass Keep
            }

            Cull   Off
            ZTest  Always
            ZWrite Off
            Blend  One Zero

            CGPROGRAM
            #pragma target 4.5
            #pragma only_renderers d3d11 ps4 metal // TEMP: until we go further in dev
            // #pragma enable_d3d11_debug_symbols

            #pragma multi_compile SSS_MODEL_BASIC SSS_MODEL_DISNEY
            #pragma multi_compile SSS_FILTER_HORIZONTAL_AND_COMBINE

            #pragma vertex   VertProcedural
            #pragma fragment Frag


            ENDCG
        }
    }
    Fallback Off
}