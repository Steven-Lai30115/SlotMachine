import GameplayKit
import SpriteKit

class ReelImage : UIElement{
    
    var reel: Reel?
    var index: Int8?
    var topBoundary: CGFloat?
    var bottomBoundary: CGFloat?
    let margin = 16.0
    var spinSpeed = 20.0
    
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat, _reel: Reel, _index: Int8){
        super.init(_name: "\(imageString)\(String(describing: _reel.index))\(_index)", imageString: imageString, initialScale: scale, _zPosition: _zPosition)
        reel = _reel
        index = _index
        height = _reel.height
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        
        position.x = reel!.position.x
        position.y = reel!.position.y + height! * CGFloat(index!)
        if( position.y >= reel!.position.y + reel!.halfHeight! + margin ||
            position.y <= reel!.position.y - reel!.halfHeight! + margin) {
            isHidden = true
        }
    }
    
    func resetPositionY() {
        position.y = reel!.position.y + height! * CGFloat(reel!.numberOfSpin!-2) + reel!.halfHeight!
    }
    
    func spin(){
        position.y -= spinSpeed
        if ( position.y <= reel!.position.y - reel!.height! - reel!.halfHeight! - margin)  {
            resetPositionY()
        }
        else if( position.y <= reel!.position.y - reel!.halfHeight! + margin) {
            isHidden = true
        }
        else if( position.y <= reel!.position.y + reel!.halfHeight! - margin) {
            isHidden = false
        }
    }
}
