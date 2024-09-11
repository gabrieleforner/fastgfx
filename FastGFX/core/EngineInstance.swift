import MetalKit
import Foundation

public class Renderer : NSObject
{
    internal var device: MTLDevice!
    internal var commandQueue: MTLCommandQueue!
    internal var commandBuffer: MTLCommandBuffer!
    
    internal var renderPassDesc: MTLRenderPassDescriptor!
    internal var renderDrawable: MTLDrawable!
    internal var renderEncoder: MTLRenderCommandEncoder!
    
    internal override init() {
        super.init()
        
        self.device = MTLCreateSystemDefaultDevice()
        self.commandQueue = device.makeCommandQueue()
    }
    
    internal func updateFrame(_ mtlView: MTKView)
    {
        self.renderPassDesc = mtlView.currentRenderPassDescriptor
        self.renderDrawable = mtlView.currentDrawable
        self.commandBuffer = commandQueue.makeCommandBuffer()
    }
    
    internal func encodeFrame()
    {
        guard let _rEncoder = self.commandBuffer.makeRenderCommandEncoder(descriptor: self.renderPassDesc) else
        {
            debugPrint("Failed to create a valid render encoder!")
            return
        }
        self.renderEncoder = _rEncoder
    }
    
    internal func endFrame()
    {
        self.renderEncoder.endEncoding()
        self.commandBuffer.present(self.renderDrawable)
        self.commandBuffer.commit()
    }
}
