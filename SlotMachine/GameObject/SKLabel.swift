//
//  Label.swift
//  SlotMachine
//
//  Created by Charlene Cheung on 18/1/2023.
//

import SpriteKit

class SKLabel: SKLabelNode {
    
    var defaultVal: Int = 0;
    var value: Int = 0;
    
    init(position: CGPoint, defaultVal: Int) {
        super.init()
        self.defaultVal = defaultVal
        self.value = defaultVal
        self.text = String(value)
        self.fontSize = 45
        self.zPosition = 3
        self.position = position
        self.fontColor = UIColor.black
        self.fontName = "Chalkduster"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLabel() {
        self.text = String(self.value)
    }
    
    func reset() {
        self.value = self.defaultVal
        self.updateLabel()
    }
    
    func add(val: Int) {
        self.value += val
        self.updateLabel()
    }
    
    func substract(val: Int) {
        self.value -= val
        self.updateLabel()
    }
}
