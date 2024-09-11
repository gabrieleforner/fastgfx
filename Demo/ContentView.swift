import SwiftUI
import FastGFX
import simd

class Game : AppModel
{
    required init() {
        super.init()
    }
    
    override func onStart(_ renderer: Renderer, _ inputHandler: InputHandler) {
        
    }
    
    override func onUpdate(_ renderer: Renderer) {
        renderer.clearColor(color: [1.0, 0.0, 0.0, 1.0])
    }
    
    override func onRender(_ renderer: Renderer) {
        
    }
}

struct ContentView: View {
    var body: some View {
        GView(model: Game.self)
    }
}

#Preview {
    ContentView()
}
