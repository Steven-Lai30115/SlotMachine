import GameplayKit
import SpriteKit

class Background : GameObject{
    
    init(){
        super.init(imageString: "Bg", initialScale: 0.455)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
