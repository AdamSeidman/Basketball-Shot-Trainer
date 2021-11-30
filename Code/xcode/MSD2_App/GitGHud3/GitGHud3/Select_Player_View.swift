//
//  Select_Player_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/3/21.
//

import SwiftUI

struct Select_Player_View: View {
    
    @State var coaches: FetchedResults<Coach>
    @EnvironmentObject var selectedData: DataSelection
    @EnvironmentObject var select: NavigationSelector
    @State var players:[Player] = []
    @State var teams:[Team] = []
    
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button("Title Screen"){
                        self.select.select = "title screen"
                    }
                    Spacer()
                }
                List {
                    Text("Select a player")
                    ForEach(players){ player in
                        Button((player.firstName ?? "John") + " " + (player.lastName ?? "Smith")) {
                            self.selectedData.playerID = player.id
                            self.select.select = "player profile"
                        }
                    }
                    Button("Create Player"){
                        self.select.select = "create player"
                    }
                    .padding(.top)
                    Spacer()
                }
            }
            .onAppear(perform: {
                for coach in coaches{
                    if coach.id == self.selectedData.coachID {
                        teams = (coach.teamList)?.allObjects as? [Team] ?? []
                        for team in teams {
                            if team.id == self.selectedData.teamID {
                                players = (team.playerList)?.allObjects as? [Player] ?? []
                            }
                        }
                    }
                }
            })
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
    
}

