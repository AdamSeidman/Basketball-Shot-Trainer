//
//  Team+CoreDataProperties.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/6/21.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var teamName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var playerList: NSSet?
    @NSManaged public var coach: Coach?

}

// MARK: Generated accessors for playerList
extension Team {

    @objc(addPlayerListObject:)
    @NSManaged public func addToPlayerList(_ value: Player)

    @objc(removePlayerListObject:)
    @NSManaged public func removeFromPlayerList(_ value: Player)

    @objc(addPlayerList:)
    @NSManaged public func addToPlayerList(_ values: NSSet)

    @objc(removePlayerList:)
    @NSManaged public func removeFromPlayerList(_ values: NSSet)

}

extension Team : Identifiable {

}
