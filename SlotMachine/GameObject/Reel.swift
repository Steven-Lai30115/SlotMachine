import GameplayKit
import SpriteKit

class Reel : UIElement{
    
    var index: Int?
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat, _index: Int){
        super.init(imageString: imageString, initialScale: scale, _zPosition: _zPosition)
        index = _index
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        if(index == 0) {
            position.x = 0
        } else if(index == 1) {
            position.x = width!
        } else {
            position.x = -width!
        }
        position.y = 116.5
        
    }
}
