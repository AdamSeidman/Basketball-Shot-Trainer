//
//  User_Structs.swift
//  Git Gud
//
//  Created by Matthew Fuss on 10/31/21.
//

import Foundation

struct Stats{
    var shotsMade:Int?
    var shotsMissed:Int?
    var shot_percentage:Double?
}

class Player{
    var picture:[Int] = []
    var firstName:String?
    var lastName:String?
    var height_ft:Int?
    var height_in:Int?
    var stats = Stats()
}

class Team{
    var picture:[Int] = []
    var teamName:String?
    var playerList:[Player] = []
    
}

class Coach: ObservableObject{
    var imageFileName: String = "default_coach_image"
    var firstName:String?
    var lastName:String?
    var teamList:[Team] = []
    
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    //func addTeam()
}
