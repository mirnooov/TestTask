using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class SubsurfaceScatteringSkinGUI : SubsurfaceScatteringBaseGUI {

	public static class SSSSkinStyles{
        public static GUIContent specularLobeInterpolationText       = new GUIContent("Lobe Interpolation", "");
		public static GUIContent secondLobeRoughnessDerivationText   = new GUIContent("Second Lobe Roughness Derivation", "");
	}

	protected MaterialProperty specularLobeInterpolation = null;
	protected const string kSpecularLobeInterpolation = "_SpecularLobeInterpolation";
	protected MaterialProperty secondLobeRoughnessDerivation = null;
	protected const string kSecondLobeRoughnessDerivation = "_SecondLobeRoughnessDerivation";

	protected override void FindMiscSSSProperties(MaterialProperty[] props){
		specularLobeInterpolation    = FindProperty(kSpecularLobeInterpolation, props);
		secondLobeRoughnessDerivation = FindProperty(kSecondLobeRoughnessDerivation, props);
	}

	protected override void MiscSSSPropertiesGUI(Material material){
		GUILayout.Label("Skin Options", EditorStyles.boldLabel);
		EditorGUI.indentLevel++;
		m_MaterialEditor.ShaderProperty(specularLobeInterpolation,     SSSSkinStyles.specularLobeInterpolationText);
		m_MaterialEditor.ShaderProperty(secondLobeRoughnessDerivation, SSSSkinStyles.secondLobeRoughnessDerivationText);
		EditorGUI.indentLevel--;
	}

	protected override void SetupMaterialKeywordsAndPassInternal(Material material, WorkflowMode workFlow){
		SetupMaterialKeywordsAndPass(material, workFlow);
	}

	static protected void SetupMaterialKeywordsAndPass(Material material, WorkflowMode workFlow){
		MaterialChanged(material, workFlow);
	}

}	