using UnityEngine;

[ExecuteInEditMode]
[RequireComponent(typeof(Renderer))]
public class EyeLookVector : MonoBehaviour {

	public enum LookAxis {
		XPositive = 0,
		YPositive,
		ZPositive,
		XNegative,
		YNegative,
		ZNegative
	}

	public Transform m_EyeBone;
	public LookAxis m_LookAxis;

	public Transform m_FaceBone;

	[Range(-1f, 1f)]
	public float m_TexcoordOffsetX = 0.32f;

    [Range(-1f, 1f)]
    public float m_TexcoordOffsetY = -0.4f;

	[Range(-1f, 1f)]
	public float m_TexcoordOffsetZ = 0.2f;

	private Renderer m_Renderer;
	private MaterialPropertyBlock m_PropertyBlock;

	void Awake(){
		m_Renderer = GetComponent<Renderer>();
		m_PropertyBlock = new MaterialPropertyBlock();
	}

	Vector3 GetLookVector(Transform bone){
		switch(m_LookAxis) {
			case LookAxis.XPositive: return bone.right;
			case LookAxis.YPositive: return bone.up;
			case LookAxis.ZPositive: return bone.forward;
			case LookAxis.XNegative: return -bone.right;
			case LookAxis.YNegative: return -bone.up;
			case LookAxis.ZNegative: return -bone.forward;
			default: return Vector3.zero;
		}
	}

	void Update () {
		if(m_Renderer == null || m_PropertyBlock == null || 
		   m_EyeBone == null  || m_FaceBone == null) return;
	
		m_PropertyBlock.SetVector("_EyeLookVector", GetLookVector(m_EyeBone));
		m_PropertyBlock.SetVector("_EyeFaceVector", m_FaceBone.forward);
		m_PropertyBlock.SetVector("_EyeFaceVectorUp",    m_FaceBone.up);
		m_PropertyBlock.SetVector("_EyeFaceVectorRight", m_FaceBone.right);

		m_PropertyBlock.SetFloat("_EyeFixedTexCoordX", m_TexcoordOffsetX);
		m_PropertyBlock.SetFloat("_EyeFixedTexCoordY", m_TexcoordOffsetY);
		m_PropertyBlock.SetFloat("_EyeFixedTexCoordZ", m_TexcoordOffsetZ);

		m_Renderer.SetPropertyBlock(m_PropertyBlock);
	}

}
