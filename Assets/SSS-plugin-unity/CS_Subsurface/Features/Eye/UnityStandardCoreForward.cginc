// Unity built-in shader source. Copyright (c) 2016 Unity Technologies. MIT license (see license.txt)

#ifndef UNITY_STANDARD_CORE_FORWARD_INCLUDED
#define UNITY_STANDARD_CORE_FORWARD_INCLUDED

#if defined(UNITY_NO_FULL_STANDARD_SHADER)
#   define UNITY_STANDARD_SIMPLE 1
#endif

#include "UnityStandardConfig.cginc"

#include "UnityStandardCore.cginc"

VertexOutputForwardBase vertBase (VertexInput v, half4 tangent : TANGENT) { return vertForwardBase(v, tangent); }
VertexOutputForwardAdd  vertAdd  (VertexInput v, half4 tangent : TANGENT) { return vertForwardAdd(v, tangent);  }

half4 fragBase (VertexOutputForwardBase i) : SV_Target { return fragForwardBaseInternal(i); }
half4 fragAdd (VertexOutputForwardAdd i) : SV_Target { return fragForwardAddInternal(i); }

#endif // UNITY_STANDARD_CORE_FORWARD_INCLUDED