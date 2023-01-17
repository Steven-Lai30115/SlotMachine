import GameplayKit
import SpriteKit

class BetAmount : UIElement{
    
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat){
        super.init(_name: imageString,imageString: imageString, initialScale: scale, _zPosition: _zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        position.x = 0 + 72 - halfWidth!
        position.y = 0 - screenHeight / 3 + halfHeight!
        //(x: -10, y: -280)
    }
}
