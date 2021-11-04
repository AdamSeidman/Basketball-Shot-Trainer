//
//  Select_Team_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/3/21.
//

import SwiftUI

struct Select_Team_View: View {
    @EnvironmentObject var select:Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    @State private var createTeamButtonPressed = false
    @State private var titleScreenPressed = false
    @State private var profileScreenPressed = false
    @State private var newTeamName = ""
    var body: some View {
        VStack{
            HStack{
                Button("title screen"){
                    self.select.select = "title screen"
                }
                .padding(.trailing)
                Spacer()
                Button("Coach Profile Screen"){
                    self.select.select = "coach profile"
                }
                .padding(.leading)
            }
            HStack{
                Spacer()
                Text("Select Team")
                    .padding()
                Spacer()
            }
            NavigationView{
                VStack(spacing: 30){
                    List(self.coach.teamList) { team in
                        NavigationLink(team.teamName ?? "Wild Cats", destination: Select_Player_View())
                    }
                    .lineSpacing(30)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    Button("Create new team"){
                        self.select.select = "create team"
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        }
    }
}
