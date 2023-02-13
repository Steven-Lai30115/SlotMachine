//
//  SupportScene.swift
//  SlotMachine
//
//  Created by Charlene Cheung on 13/2/2023.
//

import GameplayKit
import SpriteKit

class SupportScene: SKScene {
    
    var screenSize = UIScreen.main.bounds
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    
    var background: Background?

    override func sceneDidLoad() {
        name = "Support"
        screenHeight = screenSize.height
        screenWidth = screenSize.width
        initializeSceneUI()
    }
    
    func initializeSceneUI() {
        // instantiate background
        background = Background(imageString: "Bg", scale: 0.455, _zPosition: 0)
        addChild(background!)
    }
    
    func instantiateUI(uiElement: UIElement) {
        uiElement.setInitialPosition(screenHeight: screenHeight!, screenWidth: screenWidth!)
        addChild(uiElement)
    }
    
    override func didMove(to view: SKView) {
    }
    
    func touchDown(atPoint pos: CGPoint) {
    }
    
    func touchMoved(toPoint pos: CGPoint) {}
    
    func touchUp(atPoint pos: CGPoint) {}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
}
