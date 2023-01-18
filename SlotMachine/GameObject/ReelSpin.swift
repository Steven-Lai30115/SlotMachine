//
//  ReelSpin.swift
//  SlotMachine
//
//  Created by Charlene Cheung on 18/1/2023.
//

import GameplayKit
import SpriteKit

class ReelSpin {
    
    var reel: Reel?
    var realImages: [ReelImage] = []
    
    init(reel: Reel, images: [String]) {
        self.reel = reel
        for (index, imgStr) in images.enumerated() {
            realImages.append(
                ReelImage(
                    imageString: imgStr,
                    scale: 1,
                    _zPosition: 3,
                    _reel: reel,
                    _index: Int8(index)
                )
            )
        }
    }
    
    func reset(screenHeight: CGFloat, screenWidth: CGFloat) {
        for reelImg in realImages {
            reelImg.setInitialPosition(screenHeight: screenHeight, screenWidth: screenWidth)
        }
    }
}
