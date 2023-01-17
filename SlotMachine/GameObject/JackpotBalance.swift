import GameplayKit
import SpriteKit

class JackpotBalance : UIElement{
    
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat){
        super.init(_name: imageString,imageString: imageString, initialScale: scale, _zPosition: _zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        position.x = 0
        position.y = 260
        // CGPoint(x: 0, y: 260)
    }
}
