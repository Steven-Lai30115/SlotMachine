//
//  ScoreCoreDataManager.swift
//  SlotMachine
//
//  Created by Charlene Cheung on 13/2/2023.
//

import Foundation
import CoreData

class ScoreCoreDataManager {
    
    func create(score: Int) {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let rank = NSEntityDescription.insertNewObject(forEntityName: "Rank", into: context) as! Rank
        rank.score = score
        CoreDataManager.shared.saveContext()
    }
    
}
