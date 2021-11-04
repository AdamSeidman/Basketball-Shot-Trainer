//
//  Player_Profile_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/2/21.
//

import SwiftUI

struct Player_Profile_View: View {
    @EnvironmentObject var select: Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    var body: some View {
        VStack{
            Text(self.player.firstName + "" + self.player.lastName)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


