import GameController

public class InputHandler
{
    // WASD Mappings
    public var W_key_callback: () -> Void
    public var A_key_callback: () -> Void
    public var S_key_callback: () -> Void
    public var D_key_callback: () -> Void
    
    // Mouse mappings
    public var X_UP_axis_callback: () -> Void
    public var X_DOWN_axis_callback: () -> Void
    public var Y_UP_axis_callback: () -> Void
    public var Y_DOWN_axis_callback: () -> Void
    
    // Left Thumbstick
    public var LT_up_callback: () -> Void
    public var LT_down_callback: () -> Void
    public var LT_left_callback: () -> Void
    public var LT_right_callback: () -> Void
    
    // Right Thumbstick
    public var RT_up_callback: () -> Void
    public var RT_down_callback: () -> Void
    public var RT_left_callback: () -> Void
    public var RT_right_callback: () -> Void
    
    public init()
    {
        
        // MARK: Keyboard callbacks
        W_key_callback = { }
        A_key_callback = { }
        S_key_callback = { }
        D_key_callback = { }
        
        // MARK: Mouse callbacks
        X_UP_axis_callback = { }
        X_DOWN_axis_callback = { }
        Y_UP_axis_callback = { }
        Y_DOWN_axis_callback = { }
        
        // MARK: Controller thumbsticks callbacks
        LT_up_callback = { }
        LT_down_callback = { }
        LT_left_callback = { }
        LT_right_callback = { }
        
        RT_up_callback = { }
        RT_down_callback = { }
        RT_left_callback = { }
        RT_right_callback = { }
        
        NotificationCenter.default.addObserver(forName: .GCKeyboardDidConnect, object: nil, queue: nil) { (note) in
            guard let keyboardInstance = note.object as? GCKeyboard else
            {
                return
            }
            
            keyboardInstance.keyboardInput?.keyChangedHandler = {
                (keyboardInput, controllerButton, key, isPressed) in
                if(keyboardInput.button(forKeyCode: .keyW))!.value > 0.5 { self.W_key_callback() }
                if(keyboardInput.button(forKeyCode: .keyA))!.value > 0.5 { self.A_key_callback() }
                if(keyboardInput.button(forKeyCode: .keyS))!.value > 0.5 { self.S_key_callback() }
                if(keyboardInput.button(forKeyCode: .keyD))!.value > 0.5 { self.D_key_callback() }
            }
        }
        
        NotificationCenter.default.addObserver(forName: .GCControllerDidConnect, object: nil, queue: nil){ (state) in
            guard let gamepad = state.object as? GCController else
            {
                return
            }
            
            gamepad.extendedGamepad?.leftThumbstick.valueChangedHandler = {
                (dpad, xValue, yValue) in
                if(xValue > 0.5) { self.RT_left_callback() }
                if(xValue < -0.5) { self.RT_right_callback() }
                if(yValue > 0.5) { self.RT_up_callback() }
                if(yValue < -0.5) { self.RT_down_callback() }
            }
            
            gamepad.extendedGamepad?.rightThumbstick.valueChangedHandler = {
                (dpad, xValue, yValue) in
                if(xValue > 0.5) { self.LT_left_callback() }
                if(xValue < -0.5) { self.LT_right_callback() }
                if(yValue > 0.5) { self.LT_up_callback() }
                if(yValue < -0.5) { self.LT_down_callback() }
            }
            
            //TODO: Add A, B, C, D keys and bind them
        }
        
        
    }
}
