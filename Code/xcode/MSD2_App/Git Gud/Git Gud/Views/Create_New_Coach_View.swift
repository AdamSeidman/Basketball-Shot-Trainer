//
//  Create_New_Coach_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI

struct Create_New_Coach_View: View {
    @State private var first = ""
    @State private var last = ""
    @State private var confirmPressed = false
    @ObservedObject var coach = Coach(firstName:"", lastName:"")
    
    var body: some View {
            ZStack{
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
                            self.confirmPressed = true
                        }
                    }
                    Spacer()
                              
                }
            }
            .navigate(to: Coach_Profile_View(coach: coach), when: $confirmPressed)

    }
}

struct choose_coach_image_view: View{
    var coach: Coach
    var body: some View{
        NavigationView{
            VStack{
                Spacer()
                NavigationLink("Take new picture", destination: Coach_Profile_View(coach: coach))
                NavigationLink("Select Existing Picture", destination: Coach_Profile_View(coach: coach))
                NavigationLink("Proceed with no picture", destination: Coach_Profile_View(coach: coach))
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}




struct Create_New_Coach_View_Previews: PreviewProvider {
    static var previews: some View {
        Create_New_Coach_View()
    }
}
