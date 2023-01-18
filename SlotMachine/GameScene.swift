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
    
    
    // reel 1 Spin
    var reel1Spin1: ReelSpin?
    var reel1Spin2: ReelSpin?
    var reel1Spin3: ReelSpin?
    var reel1Spin4: ReelSpin?
    var reel1Spin5: ReelSpin?
    
    // reel 2 Spin
    var reel2Spin1: ReelSpin?
    var reel2Spin2: ReelSpin?
    var reel2Spin3: ReelSpin?
    var reel2Spin4: ReelSpin?
    var reel2Spin5: ReelSpin?
    
    // reel 3 Spin
    var reel3Spin1: ReelSpin?
    var reel3Spin2: ReelSpin?
    var reel3Spin3: ReelSpin?
    var reel3Spin4: ReelSpin?
    var reel3Spin5: ReelSpin?

    override func sceneDidLoad() {
        screenHeight = screenSize.height
        screenWidth = screenSize.width
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
        
        rect1 = Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: -1, _numOfSpin: 5)
        instantiateUI(uiElement: rect1!)
        rect2 = Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 0, _numOfSpin: 5)
        instantiateUI(uiElement: rect2!)
        rect3 = Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 1, _numOfSpin: 5)
        instantiateUI(uiElement: rect3!)
        
        
        // reel 1
        reel1Spin1 = ReelSpin(
            imageString: "bye",
            scale: 1,
            _zPosition: 3,
            _reel: rect1!,
            _index: 2
        )
        instantiateUI(uiElement: reel1Spin1!)
        
        reel1Spin2 = ReelSpin(
            imageString: "beat",
            scale: 1,
            _zPosition: 3,
            _reel: rect1!,
            _index: 1
        )
        instantiateUI(uiElement: reel1Spin2!)
        
        reel1Spin3 = ReelSpin(
            imageString: "bye",
            scale: 1,
            _zPosition: 3,
            _reel: rect1!,
            _index: 0
        )
        instantiateUI(uiElement: reel1Spin3!)
        
        reel1Spin4 = ReelSpin(
            imageString: "haha",
            scale: 1,
            _zPosition: 3,
            _reel: rect1!,
            _index: 4
        )
        instantiateUI(uiElement: reel1Spin4!)
        
        reel1Spin5 = ReelSpin(
            imageString: "hehe",
            scale: 1,
            _zPosition: 3,
            _reel: rect1!,
            _index: 3
        )
        instantiateUI(uiElement: reel1Spin5!)
        
        
        
        // Reel 2
        reel2Spin1 = ReelSpin(
            imageString: "bye",
            scale: 1,
            _zPosition: 3,
            _reel: rect2!,
            _index: 2
        )
        instantiateUI(uiElement: reel2Spin1!)
        
        reel2Spin2 = ReelSpin(
            imageString: "beat",
            scale: 1,
            _zPosition: 3,
            _reel: rect2!,
            _index: 1
        )
        instantiateUI(uiElement: reel2Spin2!)
        
        reel2Spin3 = ReelSpin(
            imageString: "bye",
            scale: 1,
            _zPosition: 3,
            _reel: rect2!,
            _index: 0
        )
        instantiateUI(uiElement: reel2Spin3!)
        
        reel2Spin4 = ReelSpin(
            imageString: "haha",
            scale: 1,
            _zPosition: 3,
            _reel: rect2!,
            _index: 4
        )
        instantiateUI(uiElement: reel2Spin4!)
        
        reel2Spin5 = ReelSpin(
            imageString: "hehe",
            scale: 1,
            _zPosition: 3,
            _reel: rect2!,
            _index: 3
        )
        instantiateUI(uiElement: reel2Spin5!)
        
        
        
        reel3Spin1 = ReelSpin(
            imageString: "bye",
            scale: 1,
            _zPosition: 3,
            _reel: rect3!,
            _index: 2
        )
        instantiateUI(uiElement: reel3Spin1!)
        
        reel3Spin2 = ReelSpin(
            imageString: "beat",
            scale: 1,
            _zPosition: 3,
            _reel: rect3!,
            _index: 1
        )
        instantiateUI(uiElement: reel3Spin2!)
        
        reel3Spin3 = ReelSpin(
            imageString: "bye",
            scale: 1,
            _zPosition: 3,
            _reel: rect3!,
            _index: 0
        )
        instantiateUI(uiElement: reel3Spin3!)
        
        reel3Spin4 = ReelSpin(
            imageString: "haha",
            scale: 1,
            _zPosition: 3,
            _reel: rect3!,
            _index: 4
        )
        instantiateUI(uiElement: reel3Spin4!)
        
        reel3Spin5 = ReelSpin(
            imageString: "hehe",
            scale: 1,
            _zPosition: 3,
            _reel: rect3!,
            _index: 3
        )
        instantiateUI(uiElement: reel3Spin5!)
        
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
    
    override func update(_ currentTime: TimeInterval) {
        
        reel1Spin1!.spin()
        reel1Spin2!.spin()
        reel1Spin3!.spin()
        reel1Spin4!.spin()
        reel1Spin5!.spin()
        
        
        reel2Spin1!.spin()
        reel2Spin2!.spin()
        reel2Spin3!.spin()
        reel2Spin4!.spin()
        reel2Spin5!.spin()
        
        
        reel3Spin1!.spin()
        reel3Spin2!.spin()
        reel3Spin3!.spin()
        reel3Spin4!.spin()
        reel3Spin5!.spin()
    }
}
