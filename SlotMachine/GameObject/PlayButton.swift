import GameplayKit
import SpriteKit

class PlayButton : UIElement{
    
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat){
        super.init(_name: imageString,imageString: imageString, initialScale: scale, _zPosition: _zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        var marginBottom = 64
        if(screenHeight <= 736) { marginBottom = 32 }
        
        position.x = 0 + halfWidth! + 72
        position.y = screenHeight / -2 +  halfHeight! + CGFloat(marginBottom)
        
    }
}
