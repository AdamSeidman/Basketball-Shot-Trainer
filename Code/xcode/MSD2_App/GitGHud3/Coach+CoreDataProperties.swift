//
//  Coach+CoreDataProperties.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/6/21.
//
//

import Foundation
import CoreData


extension Coach {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coach> {
        return NSFetchRequest<Coach>(entityName: "Coach")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var profileImage: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var teamList: NSSet?

}

// MARK: Generated accessors for teamList
extension Coach {

    @objc(addTeamListObject:)
    @NSManaged public func addToTeamList(_ value: Team)

    @objc(removeTeamListObject:)
    @NSManaged public func removeFromTeamList(_ value: Team)

    @objc(addTeamList:)
    @NSManaged public func addToTeamList(_ values: NSSet)

    @objc(removeTeamList:)
    @NSManaged public func removeFromTeamList(_ values: NSSet)

}

extension Coach : Identifiable {

}
