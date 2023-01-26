import GameplayKit
import SpriteKit

class Reel : UIElement{
    
    var numberOfSpin: Int?
    var index: Int?
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat, _index: Int, _numOfSpin: Int){
        super.init(_name: imageString,imageString: imageString, initialScale: scale, _zPosition: _zPosition)
        numberOfSpin = _numOfSpin
        index = _index
    }
    var spinResult: ReelImage?
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
    
    func setSpinResult(_spinResult: ReelImage){
        spinResult = _spinResult
    }
}
