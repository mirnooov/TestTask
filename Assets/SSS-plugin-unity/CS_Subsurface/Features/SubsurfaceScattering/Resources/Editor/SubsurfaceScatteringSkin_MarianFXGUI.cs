using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class SubsurfaceScatteringSkin_MarianFXGUI : SubsurfaceScatteringBaseGUI
{

	public static class SSSSkinStyles
    {
        public static GUIContent specularLobeInterpolationText       = new GUIContent("Lobe Interpolation", "");
		public static GUIContent secondLobeRoughnessDerivationText   = new GUIContent("Second Lobe Roughness Derivation", "");

        public static GUIContent transitionMapText = new GUIContent("Trans. Map", "Transition blend value map (R)");
        public static GUIContent transitionValueText = new GUIContent("Trans. Value", "Transition blend value");
        public static GUIContent transitionWidthText = new GUIContent("Trans. Width", "Blend width for current transition value");

        public static GUIContent transAlbedoMapText = new GUIContent("Trans. Albedo", "Albedo (RGB) and Transparency (A)");
        public static GUIContent transSpecularMapText = new GUIContent("Trans. Specular", "Specular (RGB) and Smoothness (A)");
        public static GUIContent transNormalMapText = new GUIContent("Trans. Normal Map", "Normal Map");
        //public static GUIContent transRadiusMapText = new GUIContent("Trans. Subsurface Radius Map", "Determines the range of the blur");
    }

	protected MaterialProperty specularLobeInterpolation = null;
	protected const string kSpecularLobeInterpolation = "_SpecularLobeInterpolation";
	protected MaterialProperty secondLobeRoughnessDerivation = null;
	protected const string kSecondLobeRoughnessDerivation = "_SecondLobeRoughnessDerivation";

    protected MaterialProperty transitionMap = null;
    protected const string kTransitionMap = "_TransMap";
    protected MaterialProperty transitionValue = null;
    protected const string kTranstionValue = "_Transition";
    protected MaterialProperty transitionWidth = null;
    protected const string kTransitionWidth = "_TransWidth";

    protected MaterialProperty transAlbedoMap = null;
    protected const string kTransAlbedoMap = "_MainTex2";
    protected MaterialProperty transSpecularMap = null;
    protected const string kTransSpecularMap = "_SpecGlossMap2";
    protected MaterialProperty transNormalMap = null;
    protected const string kTransNormalMap = "_BumpMap2";
    //protected MaterialProperty transRadiusMap = null;
    //protected const string kTransRadiusMap = "_SubsurfaceRadiusMap2";


	protected override void FindMiscSSSProperties(MaterialProperty[] props)
    {
		specularLobeInterpolation    = FindProperty(kSpecularLobeInterpolation, props);
		secondLobeRoughnessDerivation = FindProperty(kSecondLobeRoughnessDerivation, props);

        transitionMap = FindProperty(kTransitionMap, props);
        transitionValue = FindProperty(kTranstionValue, props);
        transitionWidth = FindProperty(kTransitionWidth, props);

        transAlbedoMap = FindProperty(kTransAlbedoMap, props);
        transSpecularMap = FindProperty(kTransSpecularMap, props);
        transNormalMap = FindProperty(kTransNormalMap, props);
        //transRadiusMap = FindProperty(kTransRadiusMap, props);
	}

	protected override void MiscSSSPropertiesGUI(Material material)
    {
		GUILayout.Label("Skin Options", EditorStyles.boldLabel);
		EditorGUI.indentLevel++;
		m_MaterialEditor.ShaderProperty(specularLobeInterpolation,     SSSSkinStyles.specularLobeInterpolationText);
		m_MaterialEditor.ShaderProperty(secondLobeRoughnessDerivation, SSSSkinStyles.secondLobeRoughnessDerivationText);
		EditorGUI.indentLevel--;

        GUILayout.Label("Transition Options", EditorStyles.boldLabel);
        EditorGUI.indentLevel++;
        m_MaterialEditor.ShaderProperty(transitionValue, SSSSkinStyles.transitionValueText);
        m_MaterialEditor.ShaderProperty(transitionWidth, SSSSkinStyles.transitionWidthText);
        m_MaterialEditor.ShaderProperty(transitionMap, SSSSkinStyles.transitionMapText);
        
        m_MaterialEditor.ShaderProperty(transAlbedoMap, SSSSkinStyles.transAlbedoMapText);
        m_MaterialEditor.ShaderProperty(transSpecularMap, SSSSkinStyles.transSpecularMapText);
        m_MaterialEditor.ShaderProperty(transNormalMap, SSSSkinStyles.transNormalMapText);
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
