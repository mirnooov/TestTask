using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class SubsurfaceScatteringEyeGUI : SubsurfaceScatteringBaseGUI {

	public static class SSSEyeStyles{
		public static GUIContent eyeFresnelDampText = new GUIContent("Fresnel Damping", "");
	}

	protected MaterialProperty fresnelDamping = null;
	protected const string kFresnelDamp = "_FresnelDamping";

	protected override void FindMiscSSSProperties(MaterialProperty[] props){
		fresnelDamping = FindProperty(kFresnelDamp, props);
	}

	protected override void MiscSSSPropertiesGUI(Material material){
		GUILayout.Label("Eye Options", EditorStyles.boldLabel);
		EditorGUI.indentLevel++;
		m_MaterialEditor.ShaderProperty(fresnelDamping, SSSEyeStyles.eyeFresnelDampText);
		EditorGUI.indentLevel--;
	}

	protected override void SetupMaterialKeywordsAndPassInternal(Material material, WorkflowMode workFlow){
		SetupMaterialKeywordsAndPass(material, workFlow);
	}

	static protected void SetupMaterialKeywordsAndPass(Material material, WorkflowMode workFlow){
		MaterialChanged(material, workFlow);
	}

}