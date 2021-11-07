//
//  Team_Row_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/3/21.
//

import SwiftUI

struct Team_Row_View: View {
    @EnvironmentObject var select:NavigationSelector
    var team: Team
    var body: some View {
        Text(team.teamName ?? "Wild Cats")
    }
}


