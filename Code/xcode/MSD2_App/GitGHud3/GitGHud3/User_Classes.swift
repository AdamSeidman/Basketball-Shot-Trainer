

import Foundation

struct Stats{
    var shotsMade:Int?
    var shotsMissed:Int?
    var shot_percentage:Double?
}

class Player: ObservableObject, Identifiable{
    var picture:[Int] = []
    var firstName:String = ""
    var lastName:String = ""
    var height_ft:Int?
    var height_in:Int?
    var stats = Stats()
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
}

class Team: ObservableObject, Identifiable{
    var picture:[Int] = []
    var teamName:String?
    var playerList:[Player] = []
    init(teamName: String){
        self.teamName = teamName
    }
}

class Coach: ObservableObject{
    var imageFileName: String = "default_coach_image"
    var firstName:String?
    var lastName:String?
    var teamList:[Team] = []
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func addTeam(team: Team){
        self.teamList.append(team)
    }
    
    //func addTeam()
}
