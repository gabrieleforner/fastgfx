import MetalKit

open class AppModel : NSObject, MTKViewDelegate
{
    private var inputHandler: InputHandler!
    private var renderer: Renderer!
    
    open func onStart(_ renderer: Renderer, _ inputHandler: InputHandler)     -> Void {}
    open func onUpdate(_ renderer: Renderer)    -> Void {}
    open func onRender(_ renderer:Renderer)     -> Void {}
    
    public required override init() {
        super.init()
        self.inputHandler = InputHandler()
        self.renderer = Renderer()
        self.onStart(self.renderer, self.inputHandler)
    }
    
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    public func draw(in view: MTKView) {
        renderer.updateFrame(view)
        self.onUpdate(self.renderer)
        renderer.encodeFrame()
        self.onRender(self.renderer)
        renderer.endFrame()
    }
}
