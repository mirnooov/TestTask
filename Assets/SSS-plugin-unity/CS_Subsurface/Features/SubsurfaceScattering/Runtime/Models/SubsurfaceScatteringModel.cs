using System;
using System.Collections.Generic;

namespace UnityEngine.PostProcessing
{
    [Serializable]
    public class SubsurfaceScatteringSupportModel : PostProcessingModel
    {
        public override void Reset()
        {
        }
    }


    [Serializable]
    public class SubsurfaceScatteringModel : PostProcessingModel
    {
        [Serializable]
        public struct Settings
        {
            public int                           numProfiles;               // Excluding the neutral profile
            public SubsurfaceScatteringProfile[] profiles;
            // Below are the cached values.
            public uint          texturingModeFlags;        // 1 bit/profile; 0 = PreAndPostScatter, 1 = PostScatter
            public uint          transmissionFlags;         // 2 bit/profile; 0 = inf. thick, 1 = thin, 2 = regular
            public float[]       thicknessRemaps;           // Remap: 0 = start, 1 = end - start
            public float[]       worldScales;               // Size of the world unit in meters
            public Vector4[]     shapeParams;               // RGB = S = 1 / D, A = filter radius
            public Vector4[]     transmissionTints;         // RGB = color, A = unused
            public float[]       filterKernelsNearField;    // 0 = radius, 1 = reciprocal of the PDF
            public float[]       filterKernelsFarField;     // 0 = radius, 1 = reciprocal of the PDF
            public bool          useDisneySSS;
            public Vector4[]     halfRcpWeightedVariances;
            public Vector4[]     filterKernelsBasic;

            public Vector4[] colorBleedAOs;

            public static Settings defaultSettings
            {
                get
                {
                    return new Settings
                    {
                    };
                }
            }

            public void OnValidate(){
                // Reserve one slot for the neutral profile.
                numProfiles = Math.Min(profiles.Length, SssConstants.SSS_N_PROFILES - 1);

                if (profiles.Length != numProfiles)
                {
                    Array.Resize(ref profiles, numProfiles);
                }

                for (int i = 0; i < numProfiles; i++)
                {
                    if (profiles[i] != null)
                    {
                        // Assign the profile IDs.
                        profiles[i].settingsIndex = i;
                    }
                }

                for (int i = 0; i < numProfiles; i++)
                {
                    // Skip unassigned profiles.
                    if (profiles[i] == null) continue;

                    profiles[i].thicknessRemap.y = Mathf.Max(profiles[i].thicknessRemap.y, 0);
                    profiles[i].thicknessRemap.x = Mathf.Clamp(profiles[i].thicknessRemap.x, 0, profiles[i].thicknessRemap.y);
                    profiles[i].worldScale       = Mathf.Max(profiles[i].worldScale, 0.001f);

                    Color c = new Color();

                    c.r = Mathf.Max(0.05f, profiles[i].scatterDistance1.r);
                    c.g = Mathf.Max(0.05f, profiles[i].scatterDistance1.g);
                    c.b = Mathf.Max(0.05f, profiles[i].scatterDistance1.b);
                    c.a = 0.0f;

                    profiles[i].scatterDistance1 = c;

                    c.r = Mathf.Max(0.05f, profiles[i].scatterDistance2.r);
                    c.g = Mathf.Max(0.05f, profiles[i].scatterDistance2.g);
                    c.b = Mathf.Max(0.05f, profiles[i].scatterDistance2.b);
                    c.a = 0.0f;

                    profiles[i].scatterDistance2 = c;

                    profiles[i].BuildKernel();
                }

                UpdateCache();
            }

            public void UpdateCache()
            {
                texturingModeFlags = transmissionFlags = 0;

                const int thicknessRemapsLen = SssConstants.SSS_N_PROFILES * 2;
                if (thicknessRemaps == null || thicknessRemaps.Length != thicknessRemapsLen)
                {
                    thicknessRemaps = new float[thicknessRemapsLen];
                }

                if (worldScales == null || worldScales.Length != SssConstants.SSS_N_PROFILES)
                {
                    worldScales = new float[SssConstants.SSS_N_PROFILES];
                }

                if (shapeParams == null || shapeParams.Length != SssConstants.SSS_N_PROFILES)
                {
                    shapeParams = new Vector4[SssConstants.SSS_N_PROFILES];
                }

                if (transmissionTints == null || transmissionTints.Length != SssConstants.SSS_N_PROFILES)
                {
                    transmissionTints = new Vector4[SssConstants.SSS_N_PROFILES];
                }

                if (colorBleedAOs == null || colorBleedAOs.Length != SssConstants.SSS_N_PROFILES)
                {
                    colorBleedAOs = new Vector4[SssConstants.SSS_N_PROFILES];
                }

                const int filterKernelsNearFieldLen = 2 * SssConstants.SSS_N_PROFILES * SssConstants.SSS_N_SAMPLES_NEAR_FIELD;
                if (filterKernelsNearField == null || filterKernelsNearField.Length != filterKernelsNearFieldLen)
                {
                    filterKernelsNearField = new float[filterKernelsNearFieldLen];
                }

                const int filterKernelsFarFieldLen = 2 * SssConstants.SSS_N_PROFILES * SssConstants.SSS_N_SAMPLES_FAR_FIELD;
                if (filterKernelsFarField == null || filterKernelsFarField.Length != filterKernelsFarFieldLen)
                {
                    filterKernelsFarField = new float[filterKernelsFarFieldLen];
                }

                if (halfRcpWeightedVariances == null || halfRcpWeightedVariances.Length != SssConstants.SSS_N_PROFILES)
                {
                    halfRcpWeightedVariances = new Vector4[SssConstants.SSS_N_PROFILES];
                }

                const int filterKernelsLen = SssConstants.SSS_N_PROFILES * SssConstants.SSS_BASIC_N_SAMPLES;
                if (filterKernelsBasic == null || filterKernelsBasic.Length != filterKernelsLen)
                {
                    filterKernelsBasic = new Vector4[filterKernelsLen];
                }

                for (int i = 0; i < numProfiles; i++)
                {
                    // Skip unassigned profiles.
                    if (profiles[i] == null) continue;

                    Debug.Assert(numProfiles < 16, "Transmission flags (32-bit integer) cannot support more than 16 profiles.");

                    texturingModeFlags |= (uint)profiles[i].texturingMode    << i;
                    transmissionFlags  |= (uint)profiles[i].transmissionMode << i * 2;

                    thicknessRemaps[2 * i]     = profiles[i].thicknessRemap.x;
                    thicknessRemaps[2 * i + 1] = profiles[i].thicknessRemap.y - profiles[i].thicknessRemap.x;
                    worldScales[i]             = profiles[i].worldScale;
                    shapeParams[i]             = profiles[i].shapeParameter;
                    shapeParams[i].w           = profiles[i].maxRadius;
                    transmissionTints[i]       = profiles[i].transmissionTint;
                    colorBleedAOs[i] = profiles[i].colorBleedAO;

                    for (int j = 0, n = SssConstants.SSS_N_SAMPLES_NEAR_FIELD; j < n; j++)
                    {
                        filterKernelsNearField[2 * (n * i + j) + 0] = profiles[i].filterKernelNearField[j].x;
                        filterKernelsNearField[2 * (n * i + j) + 1] = profiles[i].filterKernelNearField[j].y;
                    }

                    for (int j = 0, n = SssConstants.SSS_N_SAMPLES_FAR_FIELD; j < n; j++)
                    {
                        filterKernelsFarField[2 * (n * i + j) + 0] = profiles[i].filterKernelFarField[j].x;
                        filterKernelsFarField[2 * (n * i + j) + 1] = profiles[i].filterKernelFarField[j].y;
                    }

                    halfRcpWeightedVariances[i] = profiles[i].halfRcpWeightedVariances;

                    for (int j = 0, n = SssConstants.SSS_BASIC_N_SAMPLES; j < n; j++)
                    {
                        filterKernelsBasic[n * i + j] = profiles[i].filterKernelBasic[j];
                    }
                }

                // Fill the neutral profile.
                {
                    int i = SssConstants.SSS_NEUTRAL_PROFILE_ID;

                    worldScales[i] = 1.0f;
                    shapeParams[i] = Vector4.zero;

                    for (int j = 0, n = SssConstants.SSS_N_SAMPLES_NEAR_FIELD; j < n; j++)
                    {
                        filterKernelsNearField[2 * (n * i + j) + 0] = 0.0f;
                        filterKernelsNearField[2 * (n * i + j) + 1] = 1.0f;
                    }

                    for (int j = 0, n = SssConstants.SSS_N_SAMPLES_FAR_FIELD; j < n; j++)
                    {
                        filterKernelsFarField[2 * (n * i + j) + 0] = 0.0f;
                        filterKernelsFarField[2 * (n * i + j) + 1] = 1.0f;
                    }

                    halfRcpWeightedVariances[i] = Vector4.one;

                    for (int j = 0, n = SssConstants.SSS_BASIC_N_SAMPLES; j < n; j++)
                    {
                        filterKernelsBasic[n * i + j]   = Vector4.one;
                        filterKernelsBasic[n * i + j].w = 0.0f;
                    }
                }
            }
        }

        [SerializeField]
        Settings m_Settings = Settings.defaultSettings;
        public Settings settings 
        {
            get { m_Settings.OnValidate(); return m_Settings; }
            set { m_Settings = value; }
        }

        public override void Reset()
        {
            m_Settings = Settings.defaultSettings;
        }
    }
}