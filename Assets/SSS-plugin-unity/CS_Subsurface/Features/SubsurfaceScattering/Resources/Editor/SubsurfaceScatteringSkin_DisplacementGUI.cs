using UnityEngine;
using UnityEditor;

public class SubsurfaceScatteringSkin_DisplacementGUI : SubsurfaceScatteringBaseGUI
{

    public static class SSSSkinDispStyles
    {
        public static GUIContent specularLobeInterpolationText = new GUIContent("Lobe Interpolation", "");
        public static GUIContent secondLobeRoughnessDerivationText = new GUIContent("Second Lobe Roughness Derivation", "");

        public static GUIContent displacementTextureText = new GUIContent("Displacement Map", "");
        public static GUIContent displacementValueText = new GUIContent("Displacement Value", "");
        public static GUIContent tessellationLevelText = new GUIContent("Tessellation Level", "");
        public static GUIContent phongTessStrengthText = new GUIContent("Phong Tessellation Strength", "");
    }

    protected MaterialProperty specularLobeInterpolation = null;
    protected const string kSpecularLobeInterpolation = "_SpecularLobeInterpolation";
    protected MaterialProperty secondLobeRoughnessDerivation = null;
    protected const string kSecondLobeRoughnessDerivation = "_SecondLobeRoughnessDerivation";

    protected MaterialProperty displacementMap = null;
    protected const string kDisplacementMap = "_DispTex";
    protected MaterialProperty displacementValue = null;
    protected const string kDisplacementValue = "_Displacement";

    protected MaterialProperty tessellationLevel = null;
    protected const string kTessellationLevel = "_Tess";
    protected MaterialProperty phongTessStrength = null;
    protected const string kPhongTessStrength = "_Phong";

    protected override void FindMiscSSSProperties(MaterialProperty[] props)
    {
        specularLobeInterpolation = FindProperty(kSpecularLobeInterpolation, props);
        secondLobeRoughnessDerivation = FindProperty(kSecondLobeRoughnessDerivation, props);

        displacementMap = FindProperty(kDisplacementMap, props);
        displacementValue = FindProperty(kDisplacementValue, props);

        tessellationLevel = FindProperty(kTessellationLevel, props);
        phongTessStrength = FindProperty(kPhongTessStrength, props);
    }

    protected override void MiscSSSPropertiesGUI(Material material)
    {
        GUILayout.Label("Skin Options", EditorStyles.boldLabel);
        EditorGUI.indentLevel++;
        m_MaterialEditor.ShaderProperty(specularLobeInterpolation, SSSSkinDispStyles.specularLobeInterpolationText);
        m_MaterialEditor.ShaderProperty(secondLobeRoughnessDerivation, SSSSkinDispStyles.secondLobeRoughnessDerivationText);
        EditorGUI.indentLevel--;

        GUILayout.Label("Displacement/Tessellation", EditorStyles.boldLabel);
        EditorGUI.indentLevel++;
        m_MaterialEditor.ShaderProperty(displacementMap, SSSSkinDispStyles.displacementTextureText);
        m_MaterialEditor.ShaderProperty(displacementValue, SSSSkinDispStyles.displacementValueText);
        m_MaterialEditor.ShaderProperty(tessellationLevel, SSSSkinDispStyles.tessellationLevelText);
        m_MaterialEditor.ShaderProperty(phongTessStrength, SSSSkinDispStyles.phongTessStrengthText);
        EditorGUI.indentLevel--;
    }

    protected override void SetupMaterialKeywordsAndPassInternal(Material material, WorkflowMode workFlow)
    {
        SetupMaterialKeywordsAndPass(material, workFlow);
    }

    static protected void SetupMaterialKeywordsAndPass(Material material, WorkflowMode workFlow)
    {
        MaterialChanged(material, workFlow);
    }

}
