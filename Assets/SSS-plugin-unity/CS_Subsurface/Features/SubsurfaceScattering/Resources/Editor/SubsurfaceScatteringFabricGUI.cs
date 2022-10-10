using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.Rendering;

public class SubsurfaceScatteringFabricGUI : SubsurfaceScatteringBaseGUI {

	public static class SSSFabricStyles{
        public static GUIContent fabricTypeText = new GUIContent("Fabric Type", "");
		public static GUIContent fuzzTintText   = new GUIContent("Fuzz Tint", "");
		public static GUIContent doubleSidedModeText = new GUIContent("Double Sided", "");
		public static GUIContent backFaceTextureSetText = new GUIContent("Back Side Texture Set", "");
		public static string doubleSidedHelpText = "To support different textures on backfaces, textures must be packed together horizontally to save samplers.";
	}

	public enum FabricType
	{
		CottonWool,
		Silk,
	}
	
	protected MaterialProperty fabricType = null;
	protected const string kFabricType = "_FabricType";
	protected MaterialProperty fuzzTint = null;
	protected const string kFuzzTint = "_FuzzTint";
	protected MaterialProperty doubleSided = null;
	protected const string kDoubleSided = "_DoubleSided";
	protected const string kBackFaceTextureSet = "_BackFaceTextureSet";
	protected MaterialProperty backFaceTextureSet = null;

	protected override void FindMiscSSSProperties(MaterialProperty[] props){
        fabricType  = FindProperty(kFabricType, props);
		fuzzTint    = FindProperty(kFuzzTint, props);
		doubleSided = FindProperty(kDoubleSided, props);
		backFaceTextureSet = FindProperty(kBackFaceTextureSet, props);
	}

	protected override void MiscSSSPropertiesGUI(Material material){
		GUILayout.Label("Fabric Options", EditorStyles.boldLabel);
		EditorGUI.indentLevel++;
		m_MaterialEditor.ShaderProperty(fabricType, SSSFabricStyles.fabricTypeText);
		m_MaterialEditor.ShaderProperty(fuzzTint, SSSFabricStyles.fuzzTintText);
		m_MaterialEditor.ShaderProperty(doubleSided, SSSFabricStyles.doubleSidedModeText);
		if(material.GetFloat(kDoubleSided) == 1){
			EditorGUI.indentLevel++;
			m_MaterialEditor.ShaderProperty(backFaceTextureSet, SSSFabricStyles.backFaceTextureSetText);
			if(material.GetFloat(kBackFaceTextureSet) == 1){
				EditorGUILayout.HelpBox(SSSFabricStyles.doubleSidedHelpText, MessageType.Info);
			}
			EditorGUI.indentLevel--;
		}
		EditorGUI.indentLevel--;
	}

	protected override void SetupMaterialKeywordsAndPassInternal(Material material, WorkflowMode workFlow){
		SetupMaterialKeywordsAndPass(material, workFlow);
	}

	static protected void SetupMaterialKeywordsAndPass(Material material, WorkflowMode workFlow){
		FabricType fabricType = (FabricType)material.GetFloat(kFabricType);
		SetKeyword(material, "_FABRIC_SILK", fabricType != FabricType.Silk);

		if(material.GetFloat(kDoubleSided) == 1){
			material.EnableKeyword("_DOUBLE_SIDED_FABRIC");
			material.SetInt("_CullMode", (int)UnityEngine.Rendering.CullMode.Off);
		} else {
			material.DisableKeyword("_DOUBLE_SIDED_FABRIC");
			material.SetInt("_CullMode", (int)UnityEngine.Rendering.CullMode.Back);
		}

		if(material.GetFloat(kBackFaceTextureSet) == 1){
			material.EnableKeyword("_HAS_BACKFACE_TEXTURE_SET");
		} else {
			material.DisableKeyword("_HAS_BACKFACE_TEXTURE_SET");
		}

		MaterialChanged(material, workFlow);
	}
}