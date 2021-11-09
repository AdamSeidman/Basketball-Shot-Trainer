//
//  Player+CoreDataProperties.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/6/21.
//
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var heightFT: Int16
    @NSManaged public var heightIN: Int16
    @NSManaged public var lastName: String?
    @NSManaged public var profileImage: Data?
    @NSManaged public var id: UUID?
    @NSManaged public var stats: NSSet?
    @NSManaged public var team: Team?

}

// MARK: Generated accessors for stats
extension Player {

    @objc(addStatsObject:)
    @NSManaged public func addToStats(_ value: Stats)

    @objc(removeStatsObject:)
    @NSManaged public func removeFromStats(_ value: Stats)

    @objc(addStats:)
    @NSManaged public func addToStats(_ values: NSSet)

    @objc(removeStats:)
    @NSManaged public func removeFromStats(_ values: NSSet)

}

extension Player : Identifiable {

}
