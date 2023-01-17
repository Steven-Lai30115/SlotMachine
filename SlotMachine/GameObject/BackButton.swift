import GameplayKit
import SpriteKit

class BackButton : UIElement{
    
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat){
        super.init(_name: imageString, imageString: imageString, initialScale: scale, _zPosition: _zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        var marginTop = 64
        if(screenHeight <= 736) { marginTop = 8 }
        
        position.x = screenWidth / -2 + halfWidth! + 32
        position.y = screenHeight / 2 - halfHeight! - CGFloat(marginTop)
    }
}
