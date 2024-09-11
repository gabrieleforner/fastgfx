import Metal

extension Renderer
{
    public func clearColor(color: [Double]) -> Void
    {
        self.renderPassDesc.colorAttachments[0].storeAction = .store
        self.renderPassDesc.colorAttachments[0].loadAction = .clear
        self.renderPassDesc.colorAttachments[0].clearColor = .init(red: color[0], green: color[1], blue: color[2], alpha: color[3])
    }
}
