using UnityEngine;
using UnityEngine.PostProcessing;

[ExecuteInEditMode]
public class SubsurfaceScatteringObject : MonoBehaviour {

	Renderer m_Renderer;
	void Awake(){
		m_Renderer = GetComponent<Renderer>();
	}

	void OnEnable(){
		if(GetComponent<Renderer>() == null) return;
		SubsurfaceScatteringComponent.RegisterSubsurfaceItem  (m_Renderer);
	}

	void OnDisable(){
		if(GetComponent<Renderer>() == null) return;
		SubsurfaceScatteringComponent.UnRegisterSubsurfaceItem(m_Renderer);
	}

}