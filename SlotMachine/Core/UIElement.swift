import GameplayKit
import SpriteKit

class UIElement : SKSpriteNode{
    var image: String?
    var scale : CGFloat?
    var width  : CGFloat?
    var height : CGFloat?
    var halfWidth  : CGFloat?
    var halfHeight : CGFloat?
    
    init(_name:String, imageString: String, initialScale : CGFloat, _zPosition : CGFloat){
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        zPosition = _zPosition
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! / 2
        halfHeight = height! / 2
        name = _name
        image = imageString
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){}
}

