//
//  Coach_Profile_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/2/21.
//

import SwiftUI


struct Coach_Profile_View: View {
    @EnvironmentObject var select:Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    var body: some View {
            VStack{
                HStack{
                    Button("Title Screen"){
                        self.select.select = ""
                    }
                    Spacer()
                }
                Image("default_coach_image")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                
                HStack{
                    Text(self.coach.firstName ?? "john")
                    Text(self.coach.lastName ?? "Smith")
                }
                Button("Select Team"){
                    self.select.select = "select team"
                }
                .padding(.top)
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

//struct Coach_Profile_View_Previews: PreviewProvider {
    //static var previews: some View {
        //Coach_Profile_View()
    //}
//}
