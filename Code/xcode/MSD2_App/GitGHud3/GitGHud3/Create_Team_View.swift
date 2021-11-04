//
//  Create_Team_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/3/21.
//

import SwiftUI

struct Create_Team_View: View {
    @EnvironmentObject var select:Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    @State private var newTeamName = ""
    var body: some View {
        VStack{
            HStack{
                Text("Team Name: ").padding(.leading, 20.0)
                TextField("Wild Cate",text: $newTeamName)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Button("Confirm"){
                self.coach.teamList.append(Team(teamName: newTeamName))
                self.select.select = "select player"
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


