import GameplayKit
import SpriteKit

class SceneUI : UIElement{
    
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat){
        super.init(imageString: imageString, initialScale: scale, _zPosition: _zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
