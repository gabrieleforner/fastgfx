#include <metal_stdlib>

using namespace metal;

struct Vertex {
    float3 position [[attribute(0)]];
    float4 rgba [[attribute(1)]];
};

struct VertexOut {
    float4 position [[position]];
    float4 rgba;
};

vertex VertexOut vertexFunction(Vertex in [[stage_in]]) {
    VertexOut out;
    out.position = float4(in.position, 1.0);
    out.rgba = in.rgba;
    
    return out;
}

fragment float4 fragmentFunction(VertexOut in [[stage_in]]) {
    return in.rgba;
}
