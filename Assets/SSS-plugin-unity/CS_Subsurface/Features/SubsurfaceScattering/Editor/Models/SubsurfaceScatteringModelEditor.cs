using System.Collections.Generic;

using UnityEngine;
using UnityEngine.PostProcessing;

namespace UnityEditor.PostProcessing
{
    using Settings = SubsurfaceScatteringModel.Settings;

    [PostProcessingModelEditor(typeof(SubsurfaceScatteringModel))]
    public class SubsurfaceScatteringModelEditor : PostProcessingModelEditor
    {

        const string k_ParamWritePassName  = "SSSPARAMWRITE";

        static string[] s_ModelNames =
        {
            "Jimenez",
            "Disney"
        };

        SerializedProperty m_Model;
        SerializedProperty m_Profiles;

        public override void OnEnable()
        {
            m_Model = FindSetting((Settings x) => x.useDisneySSS);
            m_Profiles = FindSetting((Settings x) => x.profiles);
        }

        public override void OnInspectorGUI()
        {   
            EditorGUILayout.HelpBox("This effect only works with the deferred rendering path, and HDR enabled.", MessageType.Info);
            m_Model.intValue = EditorGUILayout.Popup("Model", m_Model.intValue, s_ModelNames);
            EditorGUILayout.PropertyField(m_Profiles, true);

            if(GUILayout.Button("Register Subsurface Items")){
                RegisterSubsurfaceItems();
            }
        }

        private void RegisterSubsurfaceItems(){
            List<Renderer> renderers = new List<Renderer>(Resources.FindObjectsOfTypeAll<Renderer>());
            foreach(Renderer r in renderers){
                if(AssetDatabase.Contains(r))                                 continue; //Is the object in the loaded in scene?
                if(r.sharedMaterial.GetPassName(0) != k_ParamWritePassName)   continue; //Does it's shader contain the support pass?
                if(r.GetComponent<SubsurfaceScatteringObject>() != null)      continue; //Does it already have the register?

                r.gameObject.AddComponent(typeof(SubsurfaceScatteringObject));
            }
        }
    }
}
