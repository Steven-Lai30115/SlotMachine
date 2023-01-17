//
//  GameScene.swift
//  SlotMachine
//
//  Created by chin wai lai on 16/1/2023.
//

import GameplayKit
import SpriteKit

let screeSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    var background: SceneUI?
    var backBtn: SceneUI?
    var resetBtn: SceneUI?
    var playBtn: SceneUI?
    var balance: SceneUI?
    var upBtn: SceneUI?
    var downBtn: SceneUI?
    var jackpotBalance: SceneUI?
    var bg2: SceneUI?
    var betAmount: SceneUI?
    var rect1: SceneUI?
    var rect2: SceneUI?
    var rect3: SceneUI?

    override func sceneDidLoad() {
        initializeSceneUI()
    }
    
    func initializeSceneUI() {
        // instantiate background
        background = SceneUI(imageString: "Bg", scale: 0.455, _zPosition: 0)
        addChild(background!)
        bg2 = SceneUI(imageString: "bg2", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: bg2!, pos: CGPoint(x: 0, y: 116.5))

        // instantiate buttons
        backBtn = SceneUI(imageString: "backBtn", scale: 0.2, _zPosition: 1)
        instantiateUI(uiElement: backBtn!, pos: CGPoint(x: -156, y: 340))
  
        resetBtn = SceneUI(imageString: "ResetBtn", scale: 0.26, _zPosition: 1)
        instantiateUI(uiElement: resetBtn!, pos: CGPoint(x: -68, y: -360))

        playBtn = SceneUI(imageString: "playBtn", scale: 0.26, _zPosition: 1)
        instantiateUI(uiElement: playBtn!, pos: CGPoint(x: 86, y: -360))

        upBtn = SceneUI(imageString: "UpBtn", scale: 0.16, _zPosition: 1)
        instantiateUI(uiElement: upBtn!, pos: CGPoint(x: 95, y: -262))

        downBtn = SceneUI(imageString: "DownBtn", scale: 0.16, _zPosition: 1)
        instantiateUI(uiElement: downBtn!, pos: CGPoint(x: 95, y: -296))
        
        // instantiate balance/amount // rect
        balance = SceneUI(imageString: "Balance", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: balance!, pos: CGPoint(x: 108.5, y: 340))
        
        jackpotBalance = SceneUI(imageString: "jackpot_balance", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: jackpotBalance!, pos: CGPoint(x: 0, y: 260))
        
        betAmount = SceneUI(imageString: "betAmount", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: betAmount!, pos: CGPoint(x: -10, y: -280))
        
        rect1 = SceneUI(imageString: "Rectangle", scale: 1, _zPosition: 2)
        instantiateUI(uiElement: rect1!, pos: CGPoint(x: -113, y: 116.5))
        rect2 = SceneUI(imageString: "Rectangle", scale: 1, _zPosition: 2)
        instantiateUI(uiElement: rect2!, pos: CGPoint(x: 0, y: 116.5))
        rect3 = SceneUI(imageString: "Rectangle", scale: 1, _zPosition: 2)
        instantiateUI(uiElement: rect3!, pos: CGPoint(x: 113, y: 116.5))
    }
    
    func instantiateUI(uiElement: SceneUI, pos: CGPoint = CGPoint(x: 0, y: 0)) {
        uiElement.position = pos
        addChild(uiElement)
    }
    
    func touchDown(atPoint pos: CGPoint) {}
    
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
    
    override func update(_ currentTime: TimeInterval) {}
}
