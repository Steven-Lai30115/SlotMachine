//
//  ScoreCoreDataManager.swift
//  SlotMachine
//
//  Created by Charlene Cheung on 13/2/2023.
//

import Foundation
import CoreData

class RankCoreDataManager {
    let context = CoreDataManager.shared.persistentContainer.viewContext

    func create(score: Int) {
        let rank = NSEntityDescription.insertNewObject(forEntityName: "Rank", into: context) as! Rank
        rank.score = Int16(score)
        CoreDataManager.shared.saveContext()
    }
    
    func get() -> Int {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Rank")
        do {
            let fetchRanked = try context.fetch(fetchRequest) as! [RankModel]
            return fetchRanked.last?.score ?? 0
        } catch {
            print("Error fetching scores: \(error)")
        }
        return 0
    }
    
}
