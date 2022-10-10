Screen-Space Subsurface Scattering for Legacy Unity Renderer (v2017.1.0f3)

Introduction
-----------------------
This is an implementation of HDRenderloop's subsurface scattering into Postprocessing Stack V1 of the Unity legacy renderer.

It is near unavoidable to achieve quality subsurface scattering without utilizing MRT (multiple render textures) to split the lighting. 
However, there is no way to set up MRT in the legacy renderer (at the place it needs to be for an effect like this) without changing C++.
This approach goes around this problem by encoding the split lighting into an HDR buffer, and performs a secondary pass to fetch unique subsurface parameters.

At its core, this implementation is a new feature to the v1 postprocessing stack, and is tightly coupled with a modified Standard
shader to encode the split lighting. Most of the work occurs in the AfterForwardOpaque event where split lighting is decoded and diffusion is performed.
It's important to note that subsurface items are renderered on the forward path, and supports additive lighting.

Features
-----------------------
- Subsurface scattering, both Jorge Jimenez and Disney models to choose from
- Subsurface scattering profiles (with respect to chosen model)
- Up to 8 unique subsurface profiles
- Translucency/Forward-scattering driven by thickness maps
- Functions in scene view
- Compatiblity with post-processing stack

Usage
-----------------------
To set up subsurface scattering, follow these steps:
1) Attach a PostProcessingBehavior to your cameras if not already done.
2) Create a Postprocessing Profile, and link it to the post processing behavior.
3) Enable "Subsurface Scattering" in the post process profile.
4) Change the size of 'Profiles' section to 1
5) Assets -> Create -> SubsurfaceScatteringProfile
6) Link the newly created profile to the empy slot in the enabled post-fx Subsurface Scattering component
7) On a model in the scene, link its material to SubsurfaceScattering -> Standard shader
8) Link the created SSS Profile to the 'Profile' field in the material GUI.
9) You should now be able to control the subsurface properties of your material.

FAQ
-----------------------
Q: Why is everything with a subsurface material white?
A: The white is due to encoded lighting not being decoded, make sure you have Subsurface Scattering enabled in at least one active camera in the hierarchy.

Q: Why are there errors when I try to link a subsurface profile to a material? 
A: This will occur if the subsurface profile is not also linked to the subsurface component in the post-processing profile.

Q: I am seeing strange artifacts that clearly shouldn't be happening?
A: Ensure your scene is rendering on a deferred path, HDR enabled, with MSAA disabled (MSAA needs to be off for the forward pass after deferred).

Q: I did everything right and don't see any subsurface?
A: Mess with the "world scale" property of the attached subsurface profile.

Notes & Known Issues
-----------------------
- Currently, pre/post/pre-post scatter texturing is limited to only pre-scatter, with the intent on soon adding support for all three.
  More information on this can be found in this GPU Gems 3 page: https://developer.nvidia.com/gpugems/GPUGems3/gpugems3_ch14.html 
- It seems that on some hardware, encoding is being done in correctly. This is currently being looked into and will be resolved soon.
