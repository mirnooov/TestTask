#ifndef UNITY_PACKING_INCLUDED
#define UNITY_PACKING_INCLUDED

uint BitFieldExtract(uint data, uint numBits, uint offset)
{
    uint mask = 0xFFFFFFFFu >> (32u - numBits);
    return (data >> offset) & mask;
}

// Packs an integer stored using at most 'numBits' into a [0..1] float.
float PackInt(uint i, uint numBits)
{
    uint maxInt = 0xFFFFFFFFu >> (32u - numBits);
    return saturate(i * rcp(maxInt));
}

// Unpacks a [0..1] float into an integer of size 'numBits'.
uint UnpackInt(float f, uint numBits)
{
    uint maxInt = 0xFFFFFFFFu >> (32u - numBits);
    return (uint)(f * maxInt + 0.5); // Round instead of truncating
}

// Packs a [0..255] integer into a [0..1] float.
float PackByte(uint i)
{
    return PackInt(i, 8);
}

// Unpacks a [0..1] float into a [0..255] integer.
uint UnpackByte(float f)
{
    return UnpackInt(f, 8);
}

// Packs a [0..65535] integer into a [0..1] float.
float PackShort(uint i)
{
    return PackInt(i, 16);
}

// Unpacks a [0..1] float into a [0..65535] integer.
uint UnpackShort(float f)
{
    return UnpackInt(f, 16);
}

// Packs 8 lowermost bits of a [0..65535] integer into a [0..1] float.
float PackShortLo(uint i)
{
    uint lo = BitFieldExtract(i, 8u, 0u);
    return PackInt(lo, 8);
}

// Packs 8 uppermost bits of a [0..65535] integer into a [0..1] float.
float PackShortHi(uint i)
{
    uint hi = BitFieldExtract(i, 8u, 8u);
    return PackInt(hi, 8);
}

float2 UnpackFloatToR8G8(float f)
{
    uint i = UnpackShort(f);
    return float2(PackShortLo(i), PackShortHi(i));
}

float PackFloatFromR8G8(float2 f){
    uint lo = UnpackByte(f.x);
    uint hi = UnpackByte(f.y);
    uint cb = (hi << 8) + lo;
    return PackShort(cb);
}

float  EncodeLightChannel(float2 f){
    return (dot(round((f) * 255), float2(256, 1.0)));
}

float2 DecodeLightChannel(float f){
    return frac((f) / float2(65536, 256));
}

float  EncodeFullLight(float3 f){
    uint lo = UnpackInt(f.r, 4);
    uint mi = UnpackInt(f.g, 4);
    uint hi = UnpackInt(f.b, 4);
    uint cb = (hi << 8) + (mi << 4) + lo;
    return PackShort(cb);
}

float3 DecodeFullLight(float f){
    uint i = UnpackShort(f);

    uint lo = BitFieldExtract(i, 4u, 0u);
    uint mi = BitFieldExtract(i, 4u, 4u);
    uint hi = BitFieldExtract(i, 4u, 8u);
    return float3(PackInt(lo, 4), PackInt(mi, 4), PackInt(hi, 4));
}

#define OVERFLOW_COMPRESSION    0.25
#define OVERFLOW_THRESHOLD      0.5
half4 EncodeSplitLighting(float3 diffuse, float3 specular){
    specular = min(float3(0.9999,0.9999,0.9999), specular);
    diffuse  = min(float3(0.9999,0.9999,0.9999), diffuse);
    
    //Written to 16161616 buffer during forward opaque pass.
    //(RGB) - encoded specular and diffuse, 8bits each
    //(A)   - full diffuse, 4bits for each channel channel
    return half4(EncodeLightChannel(float2(specular.r, diffuse.r)),
                 EncodeLightChannel(float2(specular.g, diffuse.g)),
                 EncodeLightChannel(float2(specular.b, diffuse.b)), 
                 EncodeFullLight(OVERFLOW_COMPRESSION * diffuse));
}

void DecodeSplitLighting(in float3 lighting, in float encLossyDiffuse, inout float3 diffuse, inout float3 specular){
    //Unpack split lighting
    float2 lR = DecodeLightChannel(lighting.r);
    float2 lG = DecodeLightChannel(lighting.g);
    float2 lB = DecodeLightChannel(lighting.b);
    float3 lossyDiffuse = rcp(OVERFLOW_COMPRESSION) * DecodeFullLight(encLossyDiffuse);

    specular  = float3( lR.x, lG.x, lB.x );

    //The diffuse is encoded into the lower bits of the pixel, and there is no known way to clamp
    //those values from overflowing into the specular bits during additive light passes.
    //Check for discrepancy between compressed low-precision diffuse signal, and the high 
    //precision diffuse signal, clamping channels to 1.0 if there is a vast discrepancy 
    diffuse = float3(abs(lR.y - lossyDiffuse.r) < OVERFLOW_THRESHOLD ? lR.y : 1.0, 
                     abs(lG.y - lossyDiffuse.g) < OVERFLOW_THRESHOLD ? lG.y : 1.0, 
                     abs(lB.y - lossyDiffuse.b) < OVERFLOW_THRESHOLD ? lB.y : 1.0);
}

#endif // UNITY_PACKING_INCLUDED
