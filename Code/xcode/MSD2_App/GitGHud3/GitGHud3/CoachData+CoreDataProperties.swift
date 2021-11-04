//
//  CoachData+CoreDataProperties.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/4/21.
//
//

import Foundation
import CoreData


extension CoachData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoachData> {
        return NSFetchRequest<CoachData>(entityName: "CoachData")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var teamList: [String]?

}

extension CoachData : Identifiable {

}
