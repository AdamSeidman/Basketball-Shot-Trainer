//
//  Stats+CoreDataProperties.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/6/21.
//
//

import Foundation
import CoreData


extension Stats {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stats> {
        return NSFetchRequest<Stats>(entityName: "Stats")
    }

    @NSManaged public var shootingPercentage: Double
    @NSManaged public var shotsMade: Int16
    @NSManaged public var shotsMissed: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var player: Player?

}

extension Stats : Identifiable {

}
