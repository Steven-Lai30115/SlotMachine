//
//  GameViewController.swift
//  SlotMachine
//
//  Created by chin wai lai on 16/1/2023.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreData

class GameViewController: UIViewController {
    
    @IBOutlet weak var supportButton: UIButton!
    @IBOutlet weak var supportText: UITextView!
    @IBOutlet weak var closeButton: UIButton!
    
    var container: NSPersistentContainer!
    var currentScene: GKScene?

    override func viewDidLoad() {
        super.viewDidLoad()
        supportText.isHidden = true
        closeButton.isHidden = true
        setScene(sceneName: "GameScene")
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    @IBAction func supportButton_Pressed(_ sender: Any) {
        supportButton.isHidden = true
        supportText.isHidden = false
        closeButton.isHidden = false
        setScene(sceneName: "SupportScene")
    }
    
    @IBAction func closeButton_Pressed(_ sender: Any) {
        supportButton.isHidden = false
        supportText.isHidden = true
        closeButton.isHidden = true
        setScene(sceneName: "GameScene")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // handle data passing
//        if let nextVC = segue.destination as? NextViewController {
//            nextVC.container = container
//        }
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFit
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
}
