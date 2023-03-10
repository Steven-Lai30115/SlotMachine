//
//  GameScene.swift
//  SlotMachine
//
//  Created by chin wai lai on 16/1/2023.
//

import GameplayKit
import SpriteKit

class GameScene: SKScene {
    
    var reloadTimer = 0
    
    var screenSize = UIScreen.main.bounds
    var screenHeight: CGFloat?
    var screenWidth: CGFloat?
    
    var background: Background?
    var backBtn: BackButton?
    var resetBtn: ResetButton?
    var playBtn: PlayButton?
    
    // balance
    var balance: Balance?
    var balanceDisplay: SKLabel?
    
    
    var upBtn: BetControlButton?
    var downBtn: BetControlButton?
    
    // jackport
    var jackpotBalance: JackpotBalance?
    let jackpotDisplay : SKLabel = SKLabel(position: CGPoint(x: 0, y: -40), defaultVal: 0)
    
    var bg2: Background?
    
    // bet
    var betAmount: BetAmount?
    let betDisplay: SKLabel = SKLabel(position: CGPoint(x: -5, y: -273), defaultVal: 0)
    
    // champion score
    var highestJackpot: HighestJackpot?
    let highestJackpotScore: SKLabel = SKLabel(position: CGPoint(x: 0, y: 245), defaultVal: 0)
    
    // viewController
    var viewController: GameViewController?
    
    var reel1: ReelSpin?
    var reel2: ReelSpin?
    var reel3: ReelSpin?
    
    // image pool
    let imagePool = ["bye","angry","haha","hehe", "lick","no","touch", "scare", "wet", "zzz"]
    
    let imagePool2 = ["bye","angry","haha","hehe", "lick","no","touch"]
    
    let imagePool3 = ["bye"]
    
    var imageChildArray = [SKNode]()

    override func sceneDidLoad() {
        screenHeight = screenSize.height
        screenWidth = screenSize.width
        initializeSceneUI()
        
        name = "Game"
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
        balanceDisplay = SKLabel(position: CGPoint(x: 105, y: 325), defaultVal:  balance!.initialValue)
        
        jackpotBalance = JackpotBalance(imageString: "jackpot_balance", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: jackpotBalance!)
        
        // todo 
        highestJackpot = HighestJackpot(imageString: "global_jackpot", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: highestJackpot!)
        
        betAmount = BetAmount(imageString: "betAmount", scale: 1, _zPosition: 1)
        instantiateUI(uiElement: betAmount!)
        
        
        generateSlotPool()
        
    }
    
    func generateSlotPool(){
        // reel 1
        var images = getRandomStrings(from: imagePool, withLength: 6)
        //var images = ["bye", "beat", "bye", "bye", "beat", "bye", "beat"]
        reel1 = ReelSpin(
            reel: Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: -1, _numOfSpin: images.count),
            images: images
        )
        instantiateUI(uiElement: reel1!.reel!)
        imageChildArray.append(reel1!.reel!)
        for reelImage in reel1!.realImages {
            instantiateUI(uiElement: reelImage)
            imageChildArray.append(reelImage)
        }
        
        images = getRandomStrings(from: imagePool2, withLength: 6)
        // images = ["bye", "beat", "bye", "haha", "hehe"]
        reel2 = ReelSpin(
            reel: Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 0, _numOfSpin: images.count),
            images:images
        )
        instantiateUI(uiElement: reel2!.reel!)
        imageChildArray.append(reel2!.reel!)
        for reelImage in reel2!.realImages {
            instantiateUI(uiElement: reelImage)
            imageChildArray.append(reelImage)
        }
        
        images = getRandomStrings(from: imagePool2, withLength: 6)
        //images = ["bye", "beat", "bye", "haha", "hehe", "beat"]
        reel3 = ReelSpin(
            reel: Reel(imageString: "Rectangle", scale: 1, _zPosition: 2, _index: 1, _numOfSpin: images.count),
            images:images
        )
        instantiateUI(uiElement: reel3!.reel!)
        imageChildArray.append(reel3!.reel!)
        for reelImage in reel3!.realImages {
            instantiateUI(uiElement: reelImage)
            imageChildArray.append(reelImage)
        }
    }
    
    func clearImageChild(){
        for child in imageChildArray {
            child.removeFromParent()
        }
    }
    
    func instantiateUI(uiElement: UIElement) {
        uiElement.setInitialPosition(screenHeight: screenHeight!, screenWidth: screenWidth!)
        addChild(uiElement)
    }
    

    
    func getRandomStrings(from pool: [String], withLength length: Int) -> [String] {
        var randomStrings = [String]()
        
        for _ in 1...length {
            let randomIndex = Int.random(in: 0..<pool.count)
            let randomString = pool[randomIndex]
            randomStrings.append(randomString)
        }
        
        return randomStrings
    }
    
    override func didMove(to view: SKView) {
        betDisplay.updateLabel()
        self.addChild(betDisplay)
        
        balanceDisplay!.updateLabel()
        self.addChild(balanceDisplay!)
        
        jackpotDisplay.updateLabel()
        self.addChild(jackpotDisplay)
        
        highestJackpotScore.updateLabel()
        self.addChild(highestJackpotScore)
        
    }
    
    func touchDown(atPoint pos: CGPoint) {
        let node = self.atPoint(pos)
        if node.name == "playBtn" {
            if !playBtn!.isClicked && !playBtn!.isDisabled {
                playBtn!.isClicked = true
                balanceDisplay!.substract(val: betDisplay.value)
                clearImageChild()
                generateSlotPool()
                let seconds = SKAction.wait(forDuration: 5)
                let stop = SKAction.run {
                    self.playBtn!.isClicked = false
                    for img in self.reel1!.realImages {
                        img.setFinalPosition()
                    }
                    for img in self.reel2!.realImages {
                        img.setFinalPosition()
                    }
                    for img in self.reel3!.realImages {
                        img.setFinalPosition()
                    }
                    let oldBalance = self.balanceDisplay!.value
                    self.checkSpinResult(
                        img1: self.reel1?.getSpinResult()?.image,
                        img2: self.reel2?.getSpinResult()?.image,
                        img3: self.reel3?.getSpinResult()?.image
                    )
                    let newBalance = self.balanceDisplay!.value
                    let highestScore = (newBalance - oldBalance)
                    if highestScore > self.highestJackpotScore.value {
                        self.viewController!.addToHighestJackpot(_score: highestScore) { res in
                            self.highestJackpotScore.value = res
                            self.highestJackpotScore.updateLabel()
                        }
                    }
                }
                let sequence = SKAction.sequence([seconds, stop])
                let action = SKAction.repeat(sequence, count: 1)
                self.run(action)
            }
        } else if node.name == "ResetBtn" {
            betDisplay.reset()
            balanceDisplay!.reset()
            //jackpotDisplay.reset()
            playBtn!.isClicked = false
            reel1?.reset(screenHeight: screenHeight!, screenWidth: screenWidth!)
            reel2?.reset(screenHeight: screenHeight!, screenWidth: screenWidth!)
            reel3?.reset(screenHeight: screenHeight!, screenWidth: screenWidth!)
        } else if node.name == "backBtn" {
            exit(0)
        } else if node.name == "UpBtn" {
            // add condition
            if balanceDisplay!.value > betDisplay.value {
                betDisplay.add(val: 5)
            }
        } else if node.name == "DownBtn" {
            if betDisplay.value >= 5  {
                betDisplay.substract(val: 5)
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
        let bet = betDisplay.value
        if( balanceDisplay!.value >= bet && bet > 0 ) { playBtn!.enable() }
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
        
        reloadTimer+=1
        if( reloadTimer > 600 ){
            reloadTimer = 0
            viewController!.getGlobalJackpot(){ currentJackpot in
                self.jackpotDisplay.value = currentJackpot
                self.jackpotDisplay.updateLabel()
            }
        }
    }
    
    func checkSpinResult (img1: String?, img2: String?, img3: String?) {
        let bet = betDisplay.value
        if( img1! == img2! && img2! == img3! ){
            // 3 images same, wins jackpot
            balanceDisplay!.add(val: jackpotDisplay.value)
            
            viewController!.resetGlobalJackpot()
            jackpotDisplay.reset()
        } else if( img1! == img2! || img2! == img3! || img1! == img3!){
            // 2 images same, wins the bet, jackpot will store the bet
            balanceDisplay!.add(val: bet * 2)
            //jackpotDisplay.add(val: bet)
            viewController!.addToGlobalJackpot(_score: bet) { res in
                self.jackpotDisplay.value = res
                self.jackpotDisplay.updateLabel()
            }
            
        } else {
            // no images same, lose the bet
            //balanceDisplay!.substract(val: bet)
            //jackpotDisplay.add(val: bet)
            viewController!.addToGlobalJackpot(_score: bet) { res in
                self.jackpotDisplay.value = res
                self.jackpotDisplay.updateLabel()
            }
        }
    }
}
