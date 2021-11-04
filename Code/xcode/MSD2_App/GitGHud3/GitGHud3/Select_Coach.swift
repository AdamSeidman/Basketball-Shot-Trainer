//
//  Select_Coach.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI

struct Select_Coach: View {
    @EnvironmentObject var select: Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    let coreDM: CoreDataManager
    @State private var coaches: [CoachData] = [CoachData]()
    //@State private var coachName:String = ""
    var body: some View {
        NavigationView{
            VStack{
                List(coaches, id: \.self) { coachData in
                    //coachName = (coach.firstName ?? "john") + " " + (coach.lastName ?? "Smith")
                    Button((coachData.firstName ?? "john") + " " + (coachData.lastName ?? "Smith")){
                        self.coach.firstName = coachData.firstName
                        self.coach.lastName = coachData.lastName
                        self.select.select = "coach profile"
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .onAppear(perform: {
                coaches = coreDM.fetchCoaches()
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

