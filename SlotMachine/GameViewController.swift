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
    let deviceID = UIDevice.current.identifierForVendor?.uuidString
    
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
    @IBAction func BackdoorResetButton_Pressed(_ sender: Any) {
        resetGlobalJackpot()
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
            if (sceneName == "GameScene") {
                let s = scene as! GameScene
                s.viewController = self
                getGlobalJackpot(){ res in
                   s.jackpotDisplay.value = res
                   s.jackpotDisplay.updateLabel()
                }
                gethighestJackpot(){ res in
                    s.highestJackpotScore.value = res
                    s.highestJackpotScore.updateLabel()
                 }
            }
            
            scene.scaleMode = .aspectFit
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func addToGlobalJackpot(_score: Int!, completion:@escaping((Int) -> ())) 
    {
        var jackpot = 0
        let g = DispatchGroup()
        getGlobalJackpot(){ currentJackpot in
            let dbRef = self.db.collection("GlobalJackpot").document("1")
            g.enter()
            jackpot = _score + currentJackpot
            dbRef.setData([
                "score": jackpot
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                    g.leave()
                } else {
                    print("Document successfully written! New value = \(currentJackpot + _score as NSNumber)")
                    g.leave()
                }
            }
            g.notify(queue: DispatchQueue.init(label: "addToGlobalJackpot")) {
             print("NEW jackpot: \(jackpot)")
             completion(jackpot)
            }
        }
        
    }
    
    func resetGlobalJackpot() -> Void
    {
       db.collection("GlobalJackpot").document("1").setData([
                "score": 0,
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written! new value = 0")
            }
        }
        
    }
    
    func getGlobalJackpot(completion:@escaping((Int) -> ()))
    {
        let g = DispatchGroup()
        var jackpot = 0
        let docRef = db.collection("GlobalJackpot").document("1")
        g.enter()
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let _jackpot = document.get("score")
                if(_jackpot != nil) { jackpot = _jackpot as! Int? ?? 0 }
                print("currentJackpot: \(_jackpot)")
                g.leave()
            } else {
                print("Document does not exist")
                g.leave()
            }
            
        }

        g.notify(queue: DispatchQueue.init(label: "getGlobalJackpot")) {
         print("NEW jackpot: \(jackpot)")
         completion(jackpot)
        }
    }
    
    
    func addToHighestJackpot(_score: Int!, completion:@escaping((Int) -> ()))
    {
        var jackpot = 0
        let g = DispatchGroup()
        gethighestJackpot(){ currentJackpot in
            let dbRef = self.db.collection("HighestJackpot").document(self.deviceID!)
            g.enter()
            jackpot = _score
            dbRef.setData([
                "score": jackpot
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                    g.leave()
                } else {
                    print("Document successfully written! New value = \(currentJackpot + _score as NSNumber)")
                    g.leave()
                }
            }
            g.notify(queue:.main) {
             print("NEW HighestJackpot: \(jackpot)")
             completion(jackpot)
            }
        }
    }
    
    func gethighestJackpot(completion:@escaping((Int) -> ()))
    {
        let g = DispatchGroup()
        var jackpot = 0
        let docRef = db.collection("HighestJackpot").document(self.deviceID!)
        g.enter()
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let _jackpot = document.get("score")
                if(_jackpot != nil) { jackpot = _jackpot as! Int? ?? 0 }
                print("currentHighestJackpot: \(_jackpot)")
                g.leave()
            } else {
                print("Document does not exist")
                g.leave()
            }
            
        }

        g.notify(queue:.main) {
         print("NEW HighestJackpot: \(jackpot)")
         completion(jackpot)
        }
    }
}
