import simd

public struct Vertex
{
    public var position: simd_float3
    public var color: simd_float4
    
    public init(position: (Float, Float, Float), color: (Float, Float,Float, Float))
    {
        self.position = simd_float3(position.0, position.1, position.2)
        self.color = simd_float4(color.0, color.1, color.2, color.3)
    }
}
