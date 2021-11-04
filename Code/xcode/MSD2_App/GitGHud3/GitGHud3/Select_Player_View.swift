//
//  Select_Player_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/3/21.
//

import SwiftUI

struct Select_Player_View: View {
    @EnvironmentObject var select:Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    var body: some View {
        NavigationView{
            VStack(spacing: 30){
                List(self.team.playerList) { player in
                    NavigationLink(self.player.firstName + " " + self.player.lastName, destination: Player_Profile_View())
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                
                Button("Add new player"){
                    self.select.select = "create player"
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
        
    }
    
    
}

