import GameplayKit
import SpriteKit

class BetControlButton : UIElement{
    
    var isIncrement :Bool?
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat, _isIncrement: Bool){
        super.init(imageString: imageString, initialScale: scale, _zPosition: _zPosition)
        isIncrement = _isIncrement
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        
        position.x = 0 + 72 + halfWidth!
        if(isIncrement!) { position.y = 0 - screenHeight / 3 + height! + halfHeight!}
        else { position.y = 0 - screenHeight / 3 + halfHeight!}
        // pos: CGPoint(x: 95, y: -262) / CGPoint(x: 95, y: -296)
    }
}
