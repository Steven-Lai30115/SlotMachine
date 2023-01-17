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
    
    var screenSize = UIScreen.main.bounds
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    
    var background: Background?
    var backBtn: BackButton?
    var resetBtn: ResetButton?
    var playBtn: PlayButton?
    var balance: Balance?
    var upBtn: BetControlButton?
    var downBtn: BetControlButton?
    var jackpotBalance: JackpotBalance?
    var bg2: Background?
    var betAmount: BetAmount?
    var rect1: Reel?
    var rect2: Reel?
    var rect3: Reel?

    override func sceneDidLoad() {
        screenHeight = screenSize.height
        screenWidth = screenSize.width
        print( screenHeight)
        initializeSceneUI()
    }
    
    func initializeSceneUI() {
        // instantiate background
        background = Background(imageString: "Bg", scale: 0.455, _zPosition: 0)
        addChild(background!)
        bg2 = Background(imageString: "bg2", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: bg2!)

        // instantiate buttons
        backBtn = BackButton(imageString: "backBtn", scale: 0.2, _zPosition: 1)
        instantiateUI(uiElement: backBtn!)
  
        resetBtn = ResetButton(imageString: "ResetBtn", scale: 0.26, _zPosition: 1)
        instantiateUI(uiElement: resetBtn!)

        playBtn = PlayButton(imageString: "playBtn", scale: 0.26, _zPosition: 1)
        instantiateUI(uiElement: playBtn!)

        upBtn = BetControlButton(imageString: "UpBtn", scale: 0.16, _zPosition: 1, _isIncrement: true)
        instantiateUI(uiElement: upBtn!)

        downBtn = BetControlButton(imageString: "DownBtn", scale: 0.16, _zPosition: 1, _isIncrement: false)
        instantiateUI(uiElement: downBtn!)
        
        // instantiate balance/amount // rect
        balance = Balance(imageString: "Balance", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: balance!)
        
        jackpotBalance = JackpotBalance(imageString: "jackpot_balance", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: jackpotBalance!)
        
        betAmount = BetAmount(imageString: "betAmount", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: betAmount!)
        
        rect1 = Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 0)
        instantiateUI(uiElement: rect1!)
        rect2 = Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: -1)
        instantiateUI(uiElement: rect2!)
        rect3 = Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 1)
        instantiateUI(uiElement: rect3!)
    }
    
    func instantiateUI(uiElement: UIElement) {
        uiElement.setInitialPosition(screenHeight: screenHeight!, screenWidth: screenWidth!)
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
