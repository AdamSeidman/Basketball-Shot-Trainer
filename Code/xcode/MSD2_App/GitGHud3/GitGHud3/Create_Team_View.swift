//
//  Create_Team_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/3/21.
//

import SwiftUI

struct Create_Team_View: View {
    @Environment(\.managedObjectContext) var moc
    @State var coaches: FetchedResults<Coach>
    @EnvironmentObject var select:NavigationSelector
    @EnvironmentObject var selectedData: DataSelection
    @State private var newTeamName = ""
    var body: some View {
        VStack{
            HStack{
                Text("Team Name: ").padding(.leading, 20.0)
                TextField("John",text: $newTeamName)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack{
                Button(action: {
                    let team = Team(context: self.moc)
                    team.teamName = newTeamName
                    team.id = UUID()
                    for coach in coaches {
                        if coach.id == self.selectedData.coachID {
                            //coach.addToTeamList(team)
                            team.coach = coach
                        }
                    }
                    try? self.moc.save()
        
                    select.select = "select team"
                }, label: {
                        Text("Confirm")})
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}


