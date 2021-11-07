
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
    
    func deleteCoach(coachData: Coach){
        
        persistentContainer.viewContext.delete(coachData)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("failed to save context \(error)")
        }
    }
    
    func fetchCoaches() ->[Coach] {
        let fetchRequest: NSFetchRequest<Coach> = Coach.fetchRequest()
        
        do {
           return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveCoach(coach: Coach){
        let coachData = Coach(context: persistentContainer.viewContext)
        coachData.firstName = coach.firstName
        coachData.lastName = coach.lastName
        coachData.teamList = coach.teamList
        coachData.profileImage = coach.profileImage
        do{
            try persistentContainer.viewContext.save()
        } catch {
           print("failed to save data \(error)")
        }
    }
}

