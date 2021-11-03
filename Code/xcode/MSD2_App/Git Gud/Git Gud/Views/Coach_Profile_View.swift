//
//  Coach_Profile_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 11/2/21.
//

import SwiftUI


struct Coach_Profile_View: View {
    var coach: Coach
    @State private var navigateNow = false
    var body: some View {
        VStack{
            Image("default_coach_image")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
            
            HStack{
                Text(self.coach.firstName ?? "john")
                Text(self.coach.lastName ?? "Smith")
            }
            Button("push me"){
                navigateNow = true
            }
            .padding(.top)
            
        }
        .navigate(to: ContentView(), when: $navigateNow)
    }
}

//struct Coach_Profile_View_Previews: PreviewProvider {
    //static var previews: some View {
        //Coach_Profile_View()
    //}
//}
