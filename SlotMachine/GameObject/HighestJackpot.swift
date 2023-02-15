//
//  Champion.swift
//  SlotMachine
//
//  Created by Charlene Cheung on 13/2/2023.
//

import Foundation

import GameplayKit
import SpriteKit

class HighestJackpot : UIElement{
    
    init(imageString : String, scale : CGFloat, _zPosition: CGFloat){
        super.init(_name: imageString,imageString: imageString, initialScale: scale, _zPosition: _zPosition)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setInitialPosition(screenHeight: CGFloat, screenWidth: CGFloat){
        position.x = 0
        position.y = 265
        // CGPoint(x: 0, y: 260)
    }
}
