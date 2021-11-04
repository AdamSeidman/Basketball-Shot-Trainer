
import SwiftUI
import Foundation
import CoreData

public class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "coreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error{
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCoaches() ->[CoachData] {
        let fetchRequest: NSFetchRequest<CoachData> = CoachData.fetchRequest()
        
        do {
           return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveCoach(coach: Coach){
        let coachData = CoachData(context: persistentContainer.viewContext)
        var teamNames:[String] = []
        coachData.firstName = coach.firstName
        coachData.lastName = coach.lastName
        for (team) in coach.teamList{
            teamNames.append(team.teamName ?? "none")
        }
        coachData.teamList = teamNames
        do{
            try persistentContainer.viewContext.save()
        } catch {
           print("failed to save data \(error)")
        }
    }
}

