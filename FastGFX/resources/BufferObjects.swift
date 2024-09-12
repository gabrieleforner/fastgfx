import Metal

extension Renderer
{
    // TODO: Implement capability to create buffers from the data representation model.
    public func createVertexBuffer(bufferData: [Vertex]) -> VertexBuffer
    {
        var bufferObj = VertexBuffer()
        bufferObj.vertexBufferObject = device.makeBuffer(bytes: bufferData, length: bufferData.count * MemoryLayout<Vertex>.stride, options: [])
        return bufferObj
    }
    
    public func createIndexBuffer(bufferData: [ushort]) -> IndexBuffer
    {
        var bufferObj = IndexBuffer()
        bufferObj.vertexBufferObject = device.makeBuffer(bytes: bufferData, length: bufferData.count * MemoryLayout<ushort>.stride, options: [])
        return bufferObj
    }
}
