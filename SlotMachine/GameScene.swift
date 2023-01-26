//
//  GameScene.swift
//  SlotMachine
//
//  Created by chin wai lai on 16/1/2023.
//

import GameplayKit
import SpriteKit

class GameScene: SKScene {
    
    var screenSize = UIScreen.main.bounds
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    
    var background: Background?
    var backBtn: BackButton?
    var resetBtn: ResetButton?
    var playBtn: PlayButton?
    
    // balance
    var balance: Balance?
    var balanceVal = 100
    let balanceLabel : SKLabel = SKLabel("0", position: CGPoint(x: 105, y: 325))
    
    
    var upBtn: BetControlButton?
    var downBtn: BetControlButton?
    
    // jackport
    var jackpotBalance: JackpotBalance?
    var jackpot = 0
    let jackpotLabel : SKLabel = SKLabel("0", position: CGPoint(x: 0, y: 242))
    
    var bg2: Background?
    
    // bet
    var betAmount: BetAmount?
    var bet = 0
    let betLabel: SKLabel = SKLabel("0", position: CGPoint(x: -5, y: -273))
    
    var reel1: ReelSpin?
    var reel2: ReelSpin?
    var reel3: ReelSpin?

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
        
        // reel 1
        var images = ["bye", "beat", "bye", "bye", "beat", "bye", "beat"]
        reel1 = ReelSpin(
            reel: Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: -1, _numOfSpin: images.count),
            images: images
        )
        instantiateUI(uiElement: reel1!.reel!)
        for reelImage in reel1!.realImages {
            instantiateUI(uiElement: reelImage)
        }
        
        images = ["bye", "beat", "bye", "haha", "hehe"]
        reel2 = ReelSpin(
            reel: Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 0, _numOfSpin: images.count),
            images:images
        )
        instantiateUI(uiElement: reel2!.reel!)
        for reelImage in reel2!.realImages {
            instantiateUI(uiElement: reelImage)
        }
        
        images = ["bye", "beat", "bye", "haha", "hehe", "beat"]
        reel3 = ReelSpin(
            reel: Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 1, _numOfSpin: images.count),
            images:images
        )
        instantiateUI(uiElement: reel3!.reel!)
        for reelImage in reel3!.realImages {
            instantiateUI(uiElement: reelImage)
        }
    }
    
    func instantiateUI(uiElement: UIElement) {
        uiElement.setInitialPosition(screenHeight: screenHeight!, screenWidth: screenWidth!)
        addChild(uiElement)
    }
    
    override func didMove(to view: SKView) {
        betLabel.text = String(bet)
        self.addChild(betLabel)
        
        balanceLabel.text = String(balanceVal)
        self.addChild(balanceLabel)
        
        jackpotLabel.text = String(jackpot)
        self.addChild(jackpotLabel)
    }
    
    func touchDown(atPoint pos: CGPoint) {
        let node = self.atPoint(pos)
        if node.name == "playBtn" {
            if !playBtn!.isClicked && !playBtn!.isDisabled {
                playBtn!.isClicked = true
                balanceVal -= bet
                balanceLabel.text = String(balanceVal)
                let seconds = SKAction.wait(forDuration: 5)
                let stop = SKAction.run { self.playBtn!.isClicked = false }
                let sequence = SKAction.sequence([seconds, stop])
                let action = SKAction.repeat(sequence, count: 1)
                self.run(action)
            }
        } else if node.name == "ResetBtn" {
            bet = 0
            playBtn!.isClicked = false
            betLabel.text = String(bet)
            reel1?.reset(screenHeight: screenHeight!, screenWidth: screenWidth!)
            reel2?.reset(screenHeight: screenHeight!, screenWidth: screenWidth!)
            reel3?.reset(screenHeight: screenHeight!, screenWidth: screenWidth!)
        } else if node.name == "backBtn" {
            exit(0)
        } else if node.name == "UpBtn" {
            // add condition
            bet = bet + 5
            betLabel.text = String(bet)
        } else if node.name == "DownBtn" {
            if bet >= 5  {
                bet = bet - 5
                betLabel.text = String(bet)
            }
        }
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
        if( balanceVal > bet && bet > 0 ) { playBtn!.enable() }
        else { playBtn!.disable() }
        
        if playBtn!.isClicked {
            for img in reel1!.realImages {
                img.spin()
            }
            
            for img in reel2!.realImages {
                img.spin()
            }
            
            for img in reel3!.realImages {
                img.spin()
            }
        }
    }
}
