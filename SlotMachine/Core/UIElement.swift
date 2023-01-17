import GameplayKit
import SpriteKit

class UIElement : SKSpriteNode{
    var scale : CGFloat?
    var width  : CGFloat?
    var height : CGFloat?
    
    init(imageString: String, initialScale : CGFloat, _zPosition : CGFloat){
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        zPosition = _zPosition
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        name = imageString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

