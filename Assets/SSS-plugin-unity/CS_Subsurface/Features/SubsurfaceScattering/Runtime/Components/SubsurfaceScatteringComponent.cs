using System.Collections.Generic;
using UnityEngine.Rendering;
namespace UnityEngine.PostProcessing
{
    using DebugMode = BuiltinDebugViewsModel.Mode;

    public sealed class SubsurfaceScatteringSupportComponent : PostProcessingComponentCommandBuffer<SubsurfaceScatteringSupportModel>
    {
        static class Uniforms
        {
            internal static readonly int _SSSParams = Shader.PropertyToID("_SSSParams");
        }

        public override bool active
        {
            get 
            {
                return context.profile.subsurfaceScattering.enabled;
            }
        }

        public override DepthTextureMode GetCameraFlags()
        {
            return DepthTextureMode.None;
        }

        public override string GetName()
        {
            return "Subsurface Scattering Support";
        }

        public override CameraEvent GetCameraEvent()
        {
            return CameraEvent.BeforeReflections;
        }

        public override void PopulateCommandBuffer(CommandBuffer cmd)
        {
            cmd.BeginSample("SupportPass");
                int subsurfaceParamRT   = Uniforms._SSSParams;
                cmd.GetTemporaryRT(subsurfaceParamRT,   -1, -1, 0, FilterMode.Point, RenderTextureFormat.Default, RenderTextureReadWrite.Linear);
                
                cmd.SetRenderTarget(subsurfaceParamRT);
                cmd.ClearRenderTarget(false, true, Color.black);

                cmd.SetRenderTarget(new RenderTargetIdentifier[] { 
                                            BuiltinRenderTextureType.GBuffer0,
                                            BuiltinRenderTextureType.GBuffer1,
                                            BuiltinRenderTextureType.GBuffer2,
                                            subsurfaceParamRT }, 
                                    BuiltinRenderTextureType.CameraTarget);
                
                foreach(Renderer r in SubsurfaceScatteringComponent.subsurfaceItems) {
                    if(r == null) continue;

                    for(int i = 0; i < r.sharedMaterials.Length; i++){
                        if(r.sharedMaterials[i] == null) continue;
                        cmd.DrawRenderer(r, r.sharedMaterials[i], i, 0);
                    }
                }
		    cmd.EndSample("SupportPass");
        }
    }

    public sealed class SubsurfaceScatteringComponent : PostProcessingComponentCommandBuffer<SubsurfaceScatteringModel>
    {
        const string k_DecodeSplitLighting = "Hidden/DecodeSplitLighting"; 
        const string k_SubsurfaceBlur      = "Hidden/SSS";

        enum SubsurfacePass {
            Vertical = 0,
            Horizontal = 1
        }

        static class Uniforms
        {
            //buffers
            internal static readonly int _SSSParams = Shader.PropertyToID("_SSSParams");
            internal static readonly int _SSSDiffColor = Shader.PropertyToID("_SSSDiffColor");
            internal static readonly int _SSSDiffuse = Shader.PropertyToID("_SSSDiffuse");
            internal static readonly int _SSSSpecular = Shader.PropertyToID("_SSSSpecular");
            internal static readonly int _SSSFilter = Shader.PropertyToID("_SSSFilter");

            internal static readonly int _EncodedLighting = Shader.PropertyToID("_EncodedLighting");
            internal static readonly int _IrradianceSource = Shader.PropertyToID("_IrradianceSource");

            //matrices
            internal static readonly int _ViewMatrix    = Shader.PropertyToID("_ViewMatrix");
            internal static readonly int _ProjMatrix    = Shader.PropertyToID("_ProjMatrix");
            internal static readonly int _InvProjMatrix = Shader.PropertyToID("_InvProjMatrix");

            //subsurface data
            internal static readonly int _TexturingModeFlags = Shader.PropertyToID("_TexturingModeFlags");
            internal static readonly int _TransmissionFlags = Shader.PropertyToID("_TransmissionFlags");
            internal static readonly int _ThicknessRemaps = Shader.PropertyToID("_ThicknessRemaps");
            internal static readonly int _ShapeParams = Shader.PropertyToID("_ShapeParams");
            internal static readonly int _TransmissionTints = Shader.PropertyToID("_TransmissionTints");
            internal static readonly int _ColorBleedAOs = Shader.PropertyToID("_ColorBleedAOs");
            internal static readonly int _WorldScales = Shader.PropertyToID("_WorldScales");
            internal static readonly int _FilterKernelsNearField = Shader.PropertyToID("_FilterKernelsNearField");
            internal static readonly int _FilterKernelsFarField = Shader.PropertyToID("_FilterKernelsFarField");
            internal static readonly int _FilterKernelsBasic = Shader.PropertyToID("_FilterKernelsBasic");
            internal static readonly int _HalfRcpWeightedVariances = Shader.PropertyToID("_HalfRcpWeightedVariances");
        }

        public override bool active 
        {
            get 
            {
                //TODO: should never be inactive
                return model.enabled;
            }
        }

        public override DepthTextureMode GetCameraFlags()
        {
            return DepthTextureMode.None;
        }

        public override string GetName()
        {
            return "Subsurface Scattering";
        }

        public override CameraEvent GetCameraEvent()
        {
            return CameraEvent.AfterForwardOpaque;
        }
        
        private static HashSet<Renderer> _subsurfaceItems = new HashSet<Renderer>();
        public static HashSet<Renderer> subsurfaceItems { get { return _subsurfaceItems; } }

        public static void RegisterSubsurfaceItem(Renderer rend){
            _subsurfaceItems.Add(rend);
        }

        public static void UnRegisterSubsurfaceItem(Renderer rend){
            _subsurfaceItems.Remove(rend);
        }

        public override void PopulateCommandBuffer(CommandBuffer cmd)
        {
            var settings = model.settings;

            var m_DecodeSplitLighting = context.materialFactory.Get(k_DecodeSplitLighting);
            var m_SubsurfaceBlur = context.materialFactory.Get(k_SubsurfaceBlur);
            SSSSUtils.SelectKeyword(m_SubsurfaceBlur, "SSS_MODEL_DISNEY", "SSS_MODEL_BASIC", settings.useDisneySSS);

            cmd.BeginSample("DecodeSplitLighting");
                cmd.SetGlobalTexture(Uniforms._EncodedLighting, BuiltinRenderTextureType.CameraTarget);

                int diffuseRT 	 = Uniforms._SSSDiffuse;
                int specularRT   = Uniforms._SSSSpecular;
                cmd.GetTemporaryRT(diffuseRT,  -1, -1, 0, FilterMode.Point, RenderTextureFormat.Default);
                cmd.GetTemporaryRT(specularRT, -1, -1, 0, FilterMode.Point, RenderTextureFormat.Default);

                cmd.SetRenderTarget( new RenderTargetIdentifier[] { diffuseRT, specularRT }, BuiltinRenderTextureType.CameraTarget);
                cmd.ClearRenderTarget(false, true, Color.black);
                cmd.DrawProcedural(Matrix4x4.identity, m_DecodeSplitLighting, 0, MeshTopology.Triangles, 3, 1);
            cmd.EndSample("DecodeSplitLighting");
            
            cmd.BeginSample("Diffusion");
                cmd.SetGlobalMatrix(Uniforms._InvProjMatrix, 	   SSSSUtils.GetGPUProjInverse(Camera.current));
                Shader.SetGlobalInt(Uniforms._TexturingModeFlags, (int)settings.texturingModeFlags);
                Shader.SetGlobalInt(Uniforms._TransmissionFlags,  (int)settings.transmissionFlags);
                cmd.SetGlobalFloatArray(Uniforms._ThicknessRemaps,    settings.thicknessRemaps);
                // We are currently supporting two different SSS mode: Jimenez (with 2-Gaussian profile) and Disney
                // We have added the ability to switch between each other for subsurface scattering, but for transmittance this is more tricky as we need to add
                // shader variant for forward, gbuffer and deferred shader. We want to avoid this.
                // So for transmittance we use Disney profile formulation (that we know is more correct) in both case, and in the case of Jimenez we hack the parameters with 2-Gaussian parameters (Ideally we should fit but haven't find good fit) so it approximately match.
                // Note: Jimenez SSS is in cm unit whereas Disney is in mm unit making an inconsistency here to compare model side by side
                cmd.SetGlobalVectorArray(Uniforms._ShapeParams, settings.useDisneySSS ? settings.shapeParams : settings.halfRcpWeightedVariances);
                cmd.SetGlobalVectorArray(Uniforms._TransmissionTints, settings.transmissionTints);
                cmd.SetGlobalVectorArray(Uniforms._ColorBleedAOs, settings.colorBleedAOs);

                if (settings.useDisneySSS)
                {
                    cmd.SetGlobalTexture(Uniforms._IrradianceSource, diffuseRT); // Cannot set a RT on a material
                    Matrix4x4 viewMatrix = Camera.current.worldToCameraMatrix;
                    viewMatrix.SetRow(2, -viewMatrix.GetRow(2));        // Make Z axis point forwards in the view space (left-handed CS)
                    Matrix4x4 projMatrix = GL.GetGPUProjectionMatrix(Camera.current.projectionMatrix, false);
                    projMatrix.SetColumn(2, -projMatrix.GetColumn(2));  // Undo the view-space transformation
                    m_SubsurfaceBlur.SetMatrix(Uniforms._ViewMatrix, viewMatrix);
                    m_SubsurfaceBlur.SetMatrix(Uniforms._ProjMatrix, projMatrix);
                    m_SubsurfaceBlur.SetFloatArray(Uniforms._WorldScales,            settings.worldScales);
                    m_SubsurfaceBlur.SetFloatArray(Uniforms._FilterKernelsNearField, settings.filterKernelsNearField);
                    m_SubsurfaceBlur.SetFloatArray(Uniforms._FilterKernelsFarField,  settings.filterKernelsFarField);

                    cmd.SetRenderTarget(BuiltinRenderTextureType.CameraTarget, BuiltinRenderTextureType.CameraTarget);
                    cmd.DrawProcedural(Matrix4x4.identity, m_SubsurfaceBlur, 1, MeshTopology.Triangles, 3, 1);
                }
                else
                {
                    int filterRT = Uniforms._SSSFilter;
                    cmd.GetTemporaryRT(filterRT, -1, -1, 0, FilterMode.Point, RenderTextureFormat.Default, RenderTextureReadWrite.sRGB);

                    // Perform the vertical SSS filtering pass.
                    cmd.SetGlobalTexture(Uniforms._IrradianceSource, diffuseRT);  // Cannot set a RT on a material
                    m_SubsurfaceBlur.SetFloatArray(Uniforms._WorldScales,               settings.worldScales);
                    m_SubsurfaceBlur.SetVectorArray(Uniforms._FilterKernelsBasic,       settings.filterKernelsBasic);
                    m_SubsurfaceBlur.SetVectorArray(Uniforms._HalfRcpWeightedVariances, settings.halfRcpWeightedVariances);
                    cmd.SetRenderTarget(filterRT, BuiltinRenderTextureType.CameraTarget);
                    cmd.ClearRenderTarget(false, true, Color.black);
                    cmd.DrawProcedural(Matrix4x4.identity, m_SubsurfaceBlur, (int)SubsurfacePass.Vertical,   MeshTopology.Triangles, 3, 1);

                    // Perform the horizontal SSS filtering pass, and combine diffuse and specular lighting.
                    cmd.SetGlobalTexture(Uniforms._IrradianceSource, filterRT);  // Cannot set a RT on a material
                    m_SubsurfaceBlur.SetFloatArray(Uniforms._WorldScales,               settings.worldScales);
                    m_SubsurfaceBlur.SetVectorArray(Uniforms._FilterKernelsBasic,       settings.filterKernelsBasic);
                    m_SubsurfaceBlur.SetVectorArray(Uniforms._HalfRcpWeightedVariances, settings.halfRcpWeightedVariances);
                    cmd.SetRenderTarget(BuiltinRenderTextureType.CameraTarget, BuiltinRenderTextureType.CameraTarget);
                    cmd.DrawProcedural(Matrix4x4.identity, m_SubsurfaceBlur, (int)SubsurfacePass.Horizontal, MeshTopology.Triangles, 3, 1);

                    cmd.ReleaseTemporaryRT(filterRT);
                    cmd.ReleaseTemporaryRT(diffuseRT);
                    cmd.ReleaseTemporaryRT(specularRT);
                }
            cmd.EndSample("Diffusion");     
        }
    }

    public class SSSSUtils {

        public static Material CreateEngineMaterial(string shaderPath){
            var mat = new Material(Shader.Find(shaderPath)) {
                hideFlags = HideFlags.HideAndDontSave
            };
            return mat;
        }

        public static CommandBuffer PrepareBuffer(Camera cam, CameraEvent e, string cmdName){
            CommandBuffer cmd = null;
            CommandBuffer[] existing;
            if((existing = cam.GetCommandBuffers(e)).Length > 0){
                cmd = existing[0];
                cmd.Clear();
            } else {
                cmd = new CommandBuffer();
                cmd.name = cmdName;
                cam.AddCommandBuffer(e, cmd);
            }
            return cmd;
        }

        public static Matrix4x4 GetGPUProjInverse(Camera cam){
            return (GL.GetGPUProjectionMatrix(cam.projectionMatrix, false)).inverse;
        }

        public static void SelectKeyword(Material material, string keyword1, string keyword2, bool enableFirst)
        {
            material.EnableKeyword(enableFirst ? keyword1 : keyword2);
            material.DisableKeyword(enableFirst ? keyword2 : keyword1);
        }

        public static void SelectKeyword(Material material, string[] keywords, int enabledKeywordIndex)
        {
            material.EnableKeyword(keywords[enabledKeywordIndex]);

            for (int i = 0; i < keywords.Length; i++)
            {
                if (i != enabledKeywordIndex)
                {
                    material.DisableKeyword(keywords[i]);
                }
            }
        }

    }
}