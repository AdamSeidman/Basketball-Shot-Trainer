//
//  User_Structs.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import Foundation

struct Stats{
    var shotsMade = 0
    var shotsMissed = 0
    var shot_percentage = 0
}

class Player{
    var firstName:String = ""
    var lastName:String = ""
    var height_ft:Int = 0
    var height_in:Int = 0
    var stats = Stats()
}

class Coach{
    var firstName:String = ""
    var lastName:String = ""
    var playerList:[Player] = []
}
