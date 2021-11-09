//
//  Create_New_Coach_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI
import CoreData

struct Create_New_Coach_View: View {
    //let context: NSManagedObjectContext
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var select:NavigationSelector
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
                Spacer()
            }
            HStack{
                Button(action: {
                    let coach = Coach(context: self.moc)
                    coach.firstName = first
                    coach.lastName = last
                    coach.profileImage = UIImage(named: "default_coach_image")?.jpegData(compressionQuality: 1.0)!
                    coach.id = UUID()
                    try? self.moc.save()
                     //self.coach = coach
                    select.select = "select coach"
                }, label: {
                        Text("Confirm")})
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}




