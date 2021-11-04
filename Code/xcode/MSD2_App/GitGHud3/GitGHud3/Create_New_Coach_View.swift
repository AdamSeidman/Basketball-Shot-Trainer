//
//  Create_New_Coach_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI
import CoreData

struct Create_New_Coach_View: View {
    let coreDM: CoreDataManager
    @EnvironmentObject var select:Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    @State private var first = ""
    @State private var last = ""
    var body: some View {
        VStack{
            HStack{
                Text("First Name: ").padding(.leading, 20.0)
                TextField("John",text: $first)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack{
                Text("Last Name: ").padding(.leading, 20.0)
                TextField("Smith",text: $last)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    .zIndex(1)
                Spacer()
            }
            HStack{
                Button("Confirm"){
                    coach.firstName = first
                    coach.lastName = last
                    coreDM.saveCoach(coach: coach)
                    select.select = "select team"
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarHidden(true)
    }
}

struct choose_coach_image_view: View{
    var coach: Coach
    var body: some View{
        NavigationView{
            VStack{
                Spacer()
                NavigationLink("Take new picture", destination: Coach_Profile_View())
                NavigationLink("Select Existing Picture", destination: Coach_Profile_View())
                NavigationLink("Proceed with no picture", destination: Coach_Profile_View())
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}




