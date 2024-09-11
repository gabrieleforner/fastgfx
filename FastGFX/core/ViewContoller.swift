import SwiftUI
import MetalKit

#if os(macOS)
public struct GView : NSViewRepresentable {
    public typealias NSViewType = MTKView
    public var model: AppModel.Type
    
    public init(model: AppModel.Type) {
        self.model = model
    }
    
    public func makeCoordinator() -> AppModel {
        return model.init()
    }
    
    public func makeNSView(context: Context) -> MTKView {
        let view = MTKView()
        view.device =  MTLCreateSystemDefaultDevice()
        view.preferredFramesPerSecond = 30
        view.colorPixelFormat = .bgra8Unorm
        view.delegate = context.coordinator
        return view
    }
    
    public func updateNSView(_ nsView: MTKView, context: Context) {
        
    }
}
#elseif os(iOS)

public struct GView : UIViewRepresentable {
    public typealias UIViewType = MTKView
    public var model: AppModel.Type
    
    public init(model: AppModel.Type) {
        self.model = model
    }
    
    public func makeCoordinator() -> AppModel {
        return model.init()
    }
    
    public func makeUIView(context: Context) -> MTKView {
        let view = MTKView()
        view.device =  MTLCreateSystemDefaultDevice()
        view.preferredFramesPerSecond = 30
        view.colorPixelFormat = .bgra8Unorm
        view.delegate = context.coordinator
        return view
    }
    
    public func updateUIView(_ nsView: MTKView, context: Context) {
        
    }
}

#endif
