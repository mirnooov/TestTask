using System;

using UnityEngine;
#if UNITY_EDITOR
    using UnityEditor;
#endif

namespace UnityEngine.PostProcessing
{
    public class SssConstants
    {
        public const int SSS_N_PROFILES           = 8;  // Max. number of profiles, including the slot taken by the neutral profile
        public const int SSS_NEUTRAL_PROFILE_ID   = SSS_N_PROFILES - 1; // Does not result in blurring
        public const int SSS_N_SAMPLES_NEAR_FIELD = 55; // Used for extreme close ups; must be a Fibonacci number
        public const int SSS_N_SAMPLES_FAR_FIELD  = 21; // Used at a regular distance; must be a Fibonacci number
        public const int SSS_LOD_THRESHOLD        = 4;  // The LoD threshold of the near-field kernel (in pixels)
        public const int SSS_TRSM_MODE_NONE       = 0;
        public const int SSS_TRSM_MODE_THIN       = 1;
        public const int SSS_BASIC_N_SAMPLES      = 25; // Must be an odd number
        public const int SSS_BASIC_DISTANCE_SCALE = 3;  // SSS distance units per centimeter
    }

    [Serializable]
    public class SubsurfaceScatteringProfile : ScriptableObject
    {
        public enum TexturingMode    : uint { PreAndPostScatter = 0, PostScatter = 1 };
        public enum TransmissionMode : uint { None = SssConstants.SSS_TRSM_MODE_NONE, ThinObject = SssConstants.SSS_TRSM_MODE_THIN, Regular };

        [ColorUsage(false, true, 0f, 8f, 0.125f, 3f)]
        public Color            scatteringDistance;         // Per color channel (no meaningful units)
        [ColorUsage(false)]
        public Color            transmissionTint;           // Color, 0 to 1
        public TexturingMode    texturingMode;
        public TransmissionMode transmissionMode;
        public Vector2          thicknessRemap;             // X = min, Y = max (in millimeters)
        public float            worldScale;                 // Size of the world unit in meters
        [HideInInspector]
        public int              settingsIndex;              // SubsurfaceScatteringSettings.profiles[i]
        [SerializeField]
        Vector3                 m_ShapeParam;               // RGB = shape parameter: S = 1 / D
        [SerializeField]
        float                   m_MaxRadius;                // In millimeters
        [SerializeField]
        Vector2[]               m_FilterKernelNearField;    // X = radius, Y = reciprocal of the PDF
        [SerializeField]
        Vector2[]               m_FilterKernelFarField;     // X = radius, Y = reciprocal of the PDF
        [ColorUsage(false, true, 0f, 8f, 0.125f, 3f)]
        public Color            scatterDistance1;
        [ColorUsage(false, true, 0f, 8f, 0.125f, 3f)]
        public Color            scatterDistance2;
        [Range(0f, 1f)]
        public float            lerpWeight;
        [SerializeField]
        Vector4                 m_HalfRcpWeightedVariances;
        [SerializeField]
        Vector4[]               m_FilterKernelBasic;

        [ColorUsage(false)]
        public Color colorBleedAO;

        // --- Public Methods ---

        public SubsurfaceScatteringProfile()
        {
            scatteringDistance = Color.grey;
            transmissionTint   = Color.white;
            texturingMode      = TexturingMode.PreAndPostScatter;
            transmissionMode   = TransmissionMode.None;
            thicknessRemap     = new Vector2(0.0f, 5.0f);
            worldScale         = 1.0f;
            settingsIndex      = SssConstants.SSS_NEUTRAL_PROFILE_ID; // Updated by SubsurfaceScatteringSettings.OnValidate() once assigned
            scatterDistance1   = new Color(0.3f, 0.3f, 0.3f, 0.0f);
            scatterDistance2   = new Color(0.5f, 0.5f, 0.5f, 0.0f);
            lerpWeight         = 1.0f;
            colorBleedAO = Color.black;

            BuildKernel();
        }

        // Ref: Approximate Reflectance Profiles for Efficient Subsurface Scattering by Pixar.
        public void BuildKernel()
        {
            if (m_FilterKernelNearField == null || m_FilterKernelNearField.Length != SssConstants.SSS_N_SAMPLES_NEAR_FIELD)
            {
                m_FilterKernelNearField = new Vector2[SssConstants.SSS_N_SAMPLES_NEAR_FIELD];
            }

            if (m_FilterKernelFarField == null || m_FilterKernelFarField.Length != SssConstants.SSS_N_SAMPLES_FAR_FIELD)
            {
                m_FilterKernelFarField = new Vector2[SssConstants.SSS_N_SAMPLES_FAR_FIELD];
            }

            // Clamp to avoid artifacts.
            m_ShapeParam   = new Vector3();
            m_ShapeParam.x = 1.0f / Mathf.Max(0.001f, scatteringDistance.r);
            m_ShapeParam.y = 1.0f / Mathf.Max(0.001f, scatteringDistance.g);
            m_ShapeParam.z = 1.0f / Mathf.Max(0.001f, scatteringDistance.b);

            // We importance sample the color channel with the widest scattering distance.
            float s = Mathf.Min(m_ShapeParam.x, m_ShapeParam.y, m_ShapeParam.z);

            // Importance sample the normalized diffusion profile for the computed value of 's'.
            // ------------------------------------------------------------------------------------
            // R(r, s)   = s * (Exp[-r * s] + Exp[-r * s / 3]) / (8 * Pi * r)
            // PDF(r, s) = s * (Exp[-r * s] + Exp[-r * s / 3]) / 4
            // CDF(r, s) = 1 - 1/4 * Exp[-r * s] - 3/4 * Exp[-r * s / 3]
            // ------------------------------------------------------------------------------------
            
            // Importance sample the near field kernel.
            for (int i = 0, n = SssConstants.SSS_N_SAMPLES_NEAR_FIELD; i < n; i++)
            {
                float p = (i + 0.5f) * (1.0f / n);
                float r = KernelCdfInverse(p, s);
                
                // N.b.: computation of normalized weights, and multiplication by the surface albedo
                // of the actual geometry is performed at runtime (in the shader).
                m_FilterKernelNearField[i].x = r;
                m_FilterKernelNearField[i].y = 1.0f / KernelPdf(r, s);
            }

            m_MaxRadius = m_FilterKernelNearField[SssConstants.SSS_N_SAMPLES_NEAR_FIELD - 1].x;

            // Importance sample the far field kernel.
            for (int i = 0, n = SssConstants.SSS_N_SAMPLES_FAR_FIELD; i < n; i++)
            {
                float p = (i + 0.5f) * (1.0f / n);
                float r = KernelCdfInverse(p, s);

                // N.b.: computation of normalized weights, and multiplication by the surface albedo
                // of the actual geometry is performed at runtime (in the shader).
                m_FilterKernelFarField[i].x = r;
                m_FilterKernelFarField[i].y = 1.0f / KernelPdf(r, s);
            }

            UpdateKernelAndVarianceData();
        }

        public void UpdateKernelAndVarianceData()
        {
            const int numSamples    = SssConstants.SSS_BASIC_N_SAMPLES;
            const int distanceScale = SssConstants.SSS_BASIC_DISTANCE_SCALE;

            if (m_FilterKernelBasic == null || m_FilterKernelBasic.Length != numSamples)
            {
                m_FilterKernelBasic = new Vector4[numSamples];
            }

            // Apply the three-sigma rule, and rescale.
            Color stdDev1 = ((1.0f / 3.0f) * distanceScale) * scatterDistance1;
            Color stdDev2 = ((1.0f / 3.0f) * distanceScale) * scatterDistance2;

            // Our goal is to blur the image using a filter which is represented
            // as a product of a linear combination of two normalized 1D Gaussians
            // as suggested by Jimenez et al. in "Separable Subsurface Scattering".
            // A normalized (i.e. energy-preserving) 1D Gaussian with the mean of 0
            // is defined as follows: G1(x, v) = exp(-x * x / (2 * v)) / sqrt(2 * Pi * v),
            // where 'v' is variance and 'x' is the radial distance from the origin.
            // Using the weight 'w', our 1D and the resulting 2D filters are given as:
            // A1(v1, v2, w, x)    = G1(x, v1) * (1 - w) + G1(r, v2) * w,
            // A2(v1, v2, w, x, y) = A1(v1, v2, w, x) * A1(v1, v2, w, y).
            // The resulting filter function is a non-Gaussian PDF.
            // It is separable by design, but generally not radially symmetric.

            // N.b.: our scattering distance is rather limited. Therefore, in order to allow
            // for a greater range of standard deviation values for flatter profiles,
            // we rescale the world using 'distanceScale', effectively reducing the SSS
            // distance units from centimeters to (1 / distanceScale).

            // Find the widest Gaussian across 3 color channels.
            float maxStdDev1 = Mathf.Max(stdDev1.r, stdDev1.g, stdDev1.b);
            float maxStdDev2 = Mathf.Max(stdDev2.r, stdDev2.g, stdDev2.b);

            Vector3 weightSum = new Vector3(0, 0, 0);

            float step = 1.0f / (numSamples - 1);

            // Importance sample the linear combination of two Gaussians.
            for (int i = 0; i < numSamples; i++)
            {
                // Generate 'u' on (0, 0.5] and (0.5, 1).
                float u = (i <= numSamples / 2) ? 0.5f - i * step // The center and to the left
                                                : i * step;       // From the center to the right

                u = Mathf.Clamp(u, 0.001f, 0.999f);

                float pos = GaussianCombinationCdfInverse(u, maxStdDev1, maxStdDev2, lerpWeight);
                float pdf = GaussianCombination(pos, maxStdDev1, maxStdDev2, lerpWeight);

                Vector3 val;
                val.x = GaussianCombination(pos, stdDev1.r, stdDev2.r, lerpWeight);
                val.y = GaussianCombination(pos, stdDev1.g, stdDev2.g, lerpWeight);
                val.z = GaussianCombination(pos, stdDev1.b, stdDev2.b, lerpWeight);

                // We do not divide by 'numSamples' since we will renormalize, anyway.
                m_FilterKernelBasic[i].x = val.x * (1 / pdf);
                m_FilterKernelBasic[i].y = val.y * (1 / pdf);
                m_FilterKernelBasic[i].z = val.z * (1 / pdf);
                m_FilterKernelBasic[i].w = pos;

                weightSum.x += m_FilterKernelBasic[i].x;
                weightSum.y += m_FilterKernelBasic[i].y;
                weightSum.z += m_FilterKernelBasic[i].z;
            }

            // Renormalize the weights to conserve energy.
            for (int i = 0; i < numSamples; i++)
            {
                m_FilterKernelBasic[i].x *= 1 / weightSum.x;
                m_FilterKernelBasic[i].y *= 1 / weightSum.y;
                m_FilterKernelBasic[i].z *= 1 / weightSum.z;
            }

            Vector4 weightedStdDev;
            weightedStdDev.x = Mathf.Lerp(stdDev1.r,  stdDev2.r,  lerpWeight);
            weightedStdDev.y = Mathf.Lerp(stdDev1.g,  stdDev2.g,  lerpWeight);
            weightedStdDev.z = Mathf.Lerp(stdDev1.b,  stdDev2.b,  lerpWeight);
            weightedStdDev.w = Mathf.Lerp(maxStdDev1, maxStdDev2, lerpWeight);

            // Store (1 / (2 * WeightedVariance)) per color channel.
            m_HalfRcpWeightedVariances.x = 0.5f / (weightedStdDev.x * weightedStdDev.x);
            m_HalfRcpWeightedVariances.y = 0.5f / (weightedStdDev.y * weightedStdDev.y);
            m_HalfRcpWeightedVariances.z = 0.5f / (weightedStdDev.z * weightedStdDev.z);
            m_HalfRcpWeightedVariances.w = 0.5f / (weightedStdDev.w * weightedStdDev.w);
        }

        public Vector3 shapeParameter
        {
            // Set in BuildKernel().
            get { return m_ShapeParam; }
        }

        public float maxRadius
        {
            // Set in BuildKernel().
            get { return m_MaxRadius; }
        }

        public Vector2[] filterKernelNearField
        {
            // Set in BuildKernel().
            get { return m_FilterKernelNearField; }
        }
        
        public Vector2[] filterKernelFarField
        {
            // Set in BuildKernel().
            get { return m_FilterKernelFarField; }
        }

        public Vector4[] filterKernelBasic
        {
            // Set via UpdateKernelAndVarianceData().
            get { return m_FilterKernelBasic; }
        }

        public Vector4 halfRcpWeightedVariances
        {
            // Set via UpdateKernelAndVarianceData().
            get { return m_HalfRcpWeightedVariances; }
        }

        // --- Private Methods ---

        static float KernelVal(float r, float s)
        {
            return s * (Mathf.Exp(-r * s) + Mathf.Exp(-r * s * (1.0f / 3.0f))) / (8.0f * Mathf.PI * r);
        }

        // Computes the value of the integrand over a disk: (2 * PI * r) * KernelVal().
        static float KernelValCircle(float r, float s)
        {
            return 0.25f * s * (Mathf.Exp(-r * s) + Mathf.Exp(-r * s * (1.0f / 3.0f)));
        }

        static float KernelPdf(float r, float s)
        {
            return KernelValCircle(r, s);
        }

        static float KernelCdf(float r, float s)
        {
            return 1.0f - 0.25f * Mathf.Exp(-r * s) - 0.75f * Mathf.Exp(-r * s * (1.0f / 3.0f));
        }

        static float KernelCdfDerivative1(float r, float s)
        {
            return 0.25f * s * Mathf.Exp(-r * s) * (1.0f + Mathf.Exp(r * s * (2.0f / 3.0f)));
        }

        static float KernelCdfDerivative2(float r, float s)
        {
            return (-1.0f / 12.0f) * s * s * Mathf.Exp(-r * s) * (3.0f + Mathf.Exp(r * s * (2.0f / 3.0f)));
        }

        // The CDF is not analytically invertible, so we use Halley's Method of root finding.
        // { f(r, s, p) = CDF(r, s) - p = 0 } with the initial guess { r = (10^p - 1) / s }.
        static float KernelCdfInverse(float p, float s)
        {
            // Supply the initial guess.
            float r = (Mathf.Pow(10.0f, p) - 1.0f) / s;
            float t = float.MaxValue;

            while (true)
            {
                float f0 = KernelCdf(r, s) - p;
                float f1 = KernelCdfDerivative1(r, s);
                float f2 = KernelCdfDerivative2(r, s);
                float dr = f0 / (f1 * (1.0f - f0 * f2 / (2.0f * f1 * f1)));

                if (Mathf.Abs(dr) < t)
                {
                    r = r - dr;
                    t = Mathf.Abs(dr);
                }
                else
                {
                    // Converged to the best result.
                    break;
                }
            }

            return r;
        }

        static float Gaussian(float x, float stdDev)
        {
            float variance = stdDev * stdDev;
            return Mathf.Exp(-x * x / (2 * variance)) / Mathf.Sqrt(2 * Mathf.PI * variance);
        }

        static float GaussianCombination(float x, float stdDev1, float stdDev2, float lerpWeight)
        {
            return Mathf.Lerp(Gaussian(x, stdDev1), Gaussian(x, stdDev2), lerpWeight);
        }

        static float RationalApproximation(float t)
        {
            // Abramowitz and Stegun formula 26.2.23.
            // The absolute value of the error should be less than 4.5 e-4.
            float[] c = {2.515517f, 0.802853f, 0.010328f};
            float[] d = {1.432788f, 0.189269f, 0.001308f};
            return t - ((c[2] * t + c[1]) * t + c[0]) / (((d[2] * t + d[1]) * t + d[0]) * t + 1.0f);
        }

        // Ref: https://www.johndcook.com/blog/csharp_phi_inverse/
        static float NormalCdfInverse(float p, float stdDev)
        {
            float x;

            if (p < 0.5)
            {
                // F^-1(p) = - G^-1(p)
                x = -RationalApproximation(Mathf.Sqrt(-2.0f * Mathf.Log(p)));
            }
            else
            {
                // F^-1(p) = G^-1(1-p)
                x = RationalApproximation(Mathf.Sqrt(-2.0f * Mathf.Log(1.0f - p)));
            }

            return x * stdDev;
        }

        static float GaussianCombinationCdfInverse(float p, float stdDev1, float stdDev2, float lerpWeight)
        {
            return Mathf.Lerp(NormalCdfInverse(p, stdDev1), NormalCdfInverse(p, stdDev2), lerpWeight);
        }
    }


    #if UNITY_EDITOR
    public class SubsurfaceScatteringProfileFactory
    {
        [MenuItem("Assets/Create/Subsurface Scattering Profile", priority = 202)]
        static void MenuCreateSubsurfaceScatteringProfile()
        {
            Texture2D icon = EditorGUIUtility.FindTexture("ScriptableObject Icon");
            ProjectWindowUtil.StartNameEditingIfProjectWindowExists(0,
                ScriptableObject.CreateInstance<DoCreateSubsurfaceScatteringProfile>(),
                "New SSS Profile.asset", icon, null);
        }

        public static SubsurfaceScatteringProfile CreateSssProfileAtPath(string path)
        {
            var profile  = ScriptableObject.CreateInstance<SubsurfaceScatteringProfile>();
            profile.name = System.IO.Path.GetFileName(path);
            AssetDatabase.CreateAsset(profile, path);
            return profile;
        }
    }

    class DoCreateSubsurfaceScatteringProfile : UnityEditor.ProjectWindowCallback.EndNameEditAction
    {
        public override void Action(int instanceId, string pathName, string resourceFile)
        {
            var profiles = SubsurfaceScatteringProfileFactory.CreateSssProfileAtPath(pathName);
            ProjectWindowUtil.ShowCreatedAsset(profiles);
        }
    }

    [CustomEditor(typeof(SubsurfaceScatteringProfile))]
    public class SubsurfaceScatteringProfileEditor : Editor
    {
        private class Styles
        {
            public readonly GUIContent   sssProfilePreview0           = new GUIContent("Profile Preview");
            public readonly GUIContent   sssProfilePreview1           = new GUIContent("Shows the fraction of light scattered from the source (center).");
            public readonly GUIContent   sssProfilePreview2           = new GUIContent("The distance to the boundary of the image corresponds to the Max Radius.");
            public readonly GUIContent   sssProfilePreview3           = new GUIContent("Note that the intensity of pixels around the center may be clipped.");
            public readonly GUIContent   sssTransmittancePreview0     = new GUIContent("Transmittance Preview");
            public readonly GUIContent   sssTransmittancePreview1     = new GUIContent("Shows the fraction of light passing through the object for thickness values from the remap.");
            public readonly GUIContent   sssTransmittancePreview2     = new GUIContent("Can be viewed as a cross section of a slab of material illuminated by white light from the left.");
            public readonly GUIContent   sssProfileScatteringDistance = new GUIContent("Scattering Distance", "Determines the shape of the profile, and the blur radius of the filter per color channel. Alpha is ignored.");
            public readonly GUIContent   sssProfileTransmissionTint   = new GUIContent("Transmission tint", "Color which tints transmitted light. Alpha is ignored.");
            public readonly GUIContent   sssProfileMaxRadius          = new GUIContent("Max Radius", "Effective radius of the filter (in millimeters). The blur is energy-preserving, so a wide filter results in a large area with small contributions of individual samples. Reducing the distance increases the sharpness of the result.");
            public readonly GUIContent   sssTexturingMode             = new GUIContent("Texturing Mode", "Specifies when the diffuse texture should be applied.");
            public readonly GUIContent[] sssTexturingModeOptions      = new GUIContent[2]
            {
                new GUIContent("Pre- and post-scatter", "Texturing is performed during both the lighting and the SSS passes. Slightly blurs the diffuse texture. Choose this mode if your diffuse texture contains little to no SSS lighting."),
                new GUIContent("Post-scatter",          "Texturing is performed only during the SSS pass. Effectively preserves the sharpness of the diffuse texture. Choose this mode if your diffuse texture already contains SSS lighting (e.g. a photo of skin).")
            };
            public readonly GUIContent   sssProfileTransmissionMode = new GUIContent("Transmission Mode", "Configures the simulation of light passing through thin objects. Depends on the thickness value (which is applied in the normal direction).");
            public readonly GUIContent[] sssTransmissionModeOptions = new GUIContent[3]
            {
                new GUIContent("None",         "Disables transmission. Choose this mode for completely opaque, or very thick translucent objects."),
                new GUIContent("Thin Object",  "Choose this mode for thin objects, such as paper or leaves. Transmitted light reuses the shadowing state of the surface."),
                new GUIContent("Regular",      "Choose this mode for moderately thick objects. For performance reasons, transmitted light ignores occlusion (shadows).")
            };
            public readonly GUIContent   sssProfileMinMaxThickness = new GUIContent("Min-Max Thickness", "Shows the values of the thickness remap below (in millimeters).");
            public readonly GUIContent   sssProfileThicknessRemap  = new GUIContent("Thickness Remap", "Remaps the thickness parameter from [0, 1] to the desired range (in millimeters).");
            public readonly GUIContent   sssProfileWorldScale      = new GUIContent("World Scale", "Size of the world unit in meters.");

            public readonly GUIContent   sssProfileScatterDistance1 = new GUIContent("Scattering Distance #1", "The radius (in centimeters) of the 1st Gaussian filter, one per color channel. Alpha is ignored. The blur is energy-preserving, so a wide filter results in a large area with small contributions of individual samples. Smaller values increase the sharpness.");
            public readonly GUIContent   sssProfileScatterDistance2 = new GUIContent("Scattering Distance #2", "The radius (in centimeters) of the 2nd Gaussian filter, one per color channel. Alpha is ignored. The blur is energy-preserving, so a wide filter results in a large area with small contributions of individual samples. Smaller values increase the sharpness.");
            public readonly GUIContent   sssProfileLerpWeight       = new GUIContent("Filter Interpolation", "Controls linear interpolation between the two Gaussian filters.");

            public readonly GUIContent sssProfileColorBleedAO = new GUIContent("Color Bleed AO", "For faking GI in subsurface objects");

            public readonly GUIStyle     centeredMiniBoldLabel     = new GUIStyle(GUI.skin.label);

            public Styles()
            {
                centeredMiniBoldLabel.alignment = TextAnchor.MiddleCenter;
                centeredMiniBoldLabel.fontSize  = 10;
                centeredMiniBoldLabel.fontStyle = FontStyle.Bold;
            }
        }

        private static Styles styles
        {
            get
            {
                if (s_Styles == null)
                {
                    s_Styles = new Styles();
                }
                return s_Styles;
            }
        }

        private static Styles      s_Styles = null;

        private RenderTexture      m_ProfileImage, m_TransmittanceImage;
        private Material           m_ProfileMaterial, m_TransmittanceMaterial;
        private SerializedProperty m_ScatteringDistance, m_MaxRadius, m_ShapeParam, m_TransmissionTint,
                                    m_TexturingMode, m_TransmissionMode, m_ThicknessRemap, m_WorldScale;
        private SerializedProperty m_ScatterDistance1, m_ScatterDistance2, m_LerpWeight;

        private SerializedProperty m_ColorBleedAO;

        private SubsurfaceScatteringModel.Settings m_SSSSettings;


        void OnEnable()
        {
            var behavior = FindObjectOfType<PostProcessingBehaviour>();
            if(behavior != null){
                 m_SSSSettings = behavior.profile.subsurfaceScattering.settings;
            }
           
            m_ScatteringDistance    = serializedObject.FindProperty("scatteringDistance");
            m_MaxRadius             = serializedObject.FindProperty("m_MaxRadius");
            m_ShapeParam            = serializedObject.FindProperty("m_ShapeParam");
            m_TransmissionTint      = serializedObject.FindProperty("transmissionTint");
            m_TexturingMode         = serializedObject.FindProperty("texturingMode");
            m_TransmissionMode      = serializedObject.FindProperty("transmissionMode");
            m_ThicknessRemap        = serializedObject.FindProperty("thicknessRemap");
            m_WorldScale            = serializedObject.FindProperty("worldScale");

            m_ColorBleedAO = serializedObject.FindProperty("colorBleedAO");

            m_ScatterDistance1      = serializedObject.FindProperty("scatterDistance1");
            m_ScatterDistance2      = serializedObject.FindProperty("scatterDistance2");
            m_LerpWeight            = serializedObject.FindProperty("lerpWeight");


            // These shaders don't need to be reference by RenderPipelineResource as they are not use at runtime
            m_ProfileMaterial       = SSSSUtils.CreateEngineMaterial("Hidden/DrawSssProfile");
            m_TransmittanceMaterial = SSSSUtils.CreateEngineMaterial("Hidden/DrawTransmittanceGraph");

            m_ProfileImage          = new RenderTexture(256, 256, 0, RenderTextureFormat.DefaultHDR);
            m_TransmittanceImage    = new RenderTexture( 16, 256, 0, RenderTextureFormat.DefaultHDR);
        }

        public override void OnInspectorGUI()
        {
            serializedObject.Update();

            bool useDisneySSS;
            {
                useDisneySSS = m_SSSSettings.useDisneySSS;
            }

            EditorGUI.BeginChangeCheck();
            {
                if (useDisneySSS)
                {
                    EditorGUILayout.PropertyField(m_ScatteringDistance, styles.sssProfileScatteringDistance);
                
                    GUI.enabled = false;
                    EditorGUILayout.PropertyField(m_MaxRadius, styles.sssProfileMaxRadius);
                    GUI.enabled = true;
                }
                else
                {
                    EditorGUILayout.PropertyField(m_ScatterDistance1, styles.sssProfileScatterDistance1);
                    EditorGUILayout.PropertyField(m_ScatterDistance2, styles.sssProfileScatterDistance2);
                    EditorGUILayout.PropertyField(m_LerpWeight,       styles.sssProfileLerpWeight);
                }

                m_TexturingMode.intValue    = EditorGUILayout.Popup(styles.sssTexturingMode,           m_TexturingMode.intValue,    styles.sssTexturingModeOptions);
                m_TransmissionMode.intValue = EditorGUILayout.Popup(styles.sssProfileTransmissionMode, m_TransmissionMode.intValue, styles.sssTransmissionModeOptions);

                EditorGUILayout.PropertyField(m_TransmissionTint,   styles.sssProfileTransmissionTint);
                EditorGUILayout.PropertyField(m_ThicknessRemap, styles.sssProfileMinMaxThickness);
                Vector2 thicknessRemap = m_ThicknessRemap.vector2Value;
                EditorGUILayout.MinMaxSlider(styles.sssProfileThicknessRemap, ref thicknessRemap.x, ref thicknessRemap.y, 0.0f, 50.0f);
                m_ThicknessRemap.vector2Value = thicknessRemap;
                EditorGUILayout.PropertyField(m_WorldScale, styles.sssProfileWorldScale);

                EditorGUILayout.PropertyField(m_ColorBleedAO, styles.sssProfileColorBleedAO);

                EditorGUILayout.Space();
                EditorGUILayout.LabelField(styles.sssProfilePreview0, styles.centeredMiniBoldLabel);
                EditorGUILayout.LabelField(styles.sssProfilePreview1, EditorStyles.centeredGreyMiniLabel);
                EditorGUILayout.LabelField(styles.sssProfilePreview2, EditorStyles.centeredGreyMiniLabel);
                EditorGUILayout.LabelField(styles.sssProfilePreview3, EditorStyles.centeredGreyMiniLabel);
                EditorGUILayout.Space();
            }

            float   r = m_MaxRadius.floatValue;
            Vector3 S = m_ShapeParam.vector3Value;
            Vector4 T = m_TransmissionTint.colorValue;
            Vector2 R = m_ThicknessRemap.vector2Value;
            bool transmissionEnabled = m_TransmissionMode.intValue != (int)SubsurfaceScatteringProfile.TransmissionMode.None;

            // Draw the profile.
            m_ProfileMaterial.SetFloat( "_MaxRadius",  r);
            m_ProfileMaterial.SetVector("_ShapeParam", S);
            
            SSSSUtils.SelectKeyword(m_ProfileMaterial, "SSS_MODEL_DISNEY", "SSS_MODEL_BASIC", useDisneySSS);
            // Apply the three-sigma rule, and rescale.
            float   s       = (1.0f / 3.0f) * SssConstants.SSS_BASIC_DISTANCE_SCALE;
            float   rMax    = Mathf.Max(m_ScatterDistance1.colorValue.r, m_ScatterDistance1.colorValue.g, m_ScatterDistance1.colorValue.b,
                                        m_ScatterDistance2.colorValue.r, m_ScatterDistance2.colorValue.g, m_ScatterDistance2.colorValue.b);
            Vector4 stdDev1 = new Vector4(s * m_ScatterDistance1.colorValue.r, s * m_ScatterDistance1.colorValue.g, s * m_ScatterDistance1.colorValue.b);
            Vector4 stdDev2 = new Vector4(s * m_ScatterDistance2.colorValue.r, s * m_ScatterDistance2.colorValue.g, s * m_ScatterDistance2.colorValue.b);
            m_ProfileMaterial.SetVector("_StdDev1",   stdDev1);
            m_ProfileMaterial.SetVector("_StdDev2",   stdDev2);
            m_ProfileMaterial.SetFloat("_LerpWeight", m_LerpWeight.floatValue);
            m_ProfileMaterial.SetFloat("_MaxRadius",  rMax);

            EditorGUI.DrawPreviewTexture(GUILayoutUtility.GetRect(256, 256), m_ProfileImage, m_ProfileMaterial, ScaleMode.ScaleToFit, 1.0f);
            
            EditorGUILayout.Space();
            EditorGUILayout.LabelField(styles.sssTransmittancePreview0, styles.centeredMiniBoldLabel);
            EditorGUILayout.LabelField(styles.sssTransmittancePreview1, EditorStyles.centeredGreyMiniLabel);
            EditorGUILayout.LabelField(styles.sssTransmittancePreview2, EditorStyles.centeredGreyMiniLabel);
            EditorGUILayout.Space();

            // Draw the transmittance graph.
            m_TransmittanceMaterial.SetVector("_ShapeParam",       S);
            m_TransmittanceMaterial.SetVector("_TransmissionTint", transmissionEnabled ? T : Vector4.zero);
            m_TransmittanceMaterial.SetVector("_ThicknessRemap",   R);
            EditorGUI.DrawPreviewTexture(GUILayoutUtility.GetRect(16, 16), m_TransmittanceImage, m_TransmittanceMaterial, ScaleMode.ScaleToFit, 16.0f);

            serializedObject.ApplyModifiedProperties();

            if (EditorGUI.EndChangeCheck())
            {
                m_SSSSettings.OnValidate();
            }
        }
    }
#endif
}