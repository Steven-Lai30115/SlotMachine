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
import FirebaseFirestore

class GameViewController: UIViewController {
    
    @IBOutlet weak var supportButton: UIButton!
    @IBOutlet weak var supportText: UITextView!
    @IBOutlet weak var closeButton: UIButton!
    
    var container: NSPersistentContainer!
    var db: Firestore!
    var currentScene: GKScene?
    var manager = RankCoreDataManager()
    
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
    
    func updateHighestScore(score: Int) {
        manager.create(score: score)
    }
        
    func setScene(sceneName: String) -> Void
    {
        
        currentScene = GKScene(fileNamed: sceneName)
        if let scene = currentScene!.rootNode as! SKScene?
        {
            if (sceneName == "GameScene") {
                let s = scene as! GameScene
                s.championScore.value = manager.get()
                s.viewController = self
                s.globalHighScore = getGlobalHighestScore()
            }
            
            scene.scaleMode = .aspectFit
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func setGlobalHighestScore(_score: Int!) -> Void
    {
        db.collection("GlobalHighscore").document("1").setData([
            "score": _score as NSNumber
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    func getGlobalHighestScore() -> Int
    {
        var score = 0
        Task {
            await db.collection("GlobalHighscore").document("1").getDocument { (document, error) in
                if let document = document, document.exists {
                    let currentScore = document.get("score")
                    if(currentScore != nil) { score = currentScore as! Int? ?? 0 }
                    print("currentHighScore: \(currentScore)")
                } else {
                    print("Document does not exist")
                }
                
            }
        }
        print("score = \(score)")
        return score
    }
}
