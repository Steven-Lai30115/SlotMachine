//
//  Label.swift
//  SlotMachine
//
//  Created by Charlene Cheung on 18/1/2023.
//

import SpriteKit

class SKLabel: SKLabelNode {
    
    init(_ text: String, position: CGPoint) {
        super.init()
        self.text = String(text)
        self.fontSize = 45
        self.zPosition = 3
        self.position = position
        self.fontColor = UIColor.black
        self.fontName = "Chalkduster"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
