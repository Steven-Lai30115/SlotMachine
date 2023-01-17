import GameplayKit
import SpriteKit

class Spin : UIElement{
    
    var reel: Reel?
    var index: Int8?
    var topBoundary: CGFloat?
    var bottomBoundary: CGFloat?
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat, _reel: Reel, _index: Int8){
        super.init(_name: imageString,imageString: imageString, initialScale: scale, _zPosition: _zPosition)
        reel = _reel
        index = _index
        height = _reel.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        
        position.x = reel!.position.x
        resetPositionY()
    }
    
    func resetPositionY() {
        position.y = reel!.position.y + height! * CGFloat(index!)
    }
    
    func spin(){
        position.y -= 1
        if( position.y <= reel!.position.y - reel!.halfHeight!) {
            isHidden = true
            resetPositionY()
        } else if ( position.y <= reel!.position.y + reel!.halfHeight!)  {
            isHidden = false
        }
    }
}
