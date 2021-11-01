//
//  Create_New_Coach_View.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI

struct Create_New_Coach_View: View {
    @State var firstName = ""
    @State var lastName = ""
    
    var body: some View {
        ZStack{
            //Image("blue_background")
                //.resizable()
               // .aspectRatio(contentMode: .fill)
              //  .ignoresSafeArea()
        
            VStack{
                
                HStack{
                    Text("First Name: ")
                
                    TextField("John",text: $firstName)
                        .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                
                    Spacer()
                }
                HStack{
                    Text("Last Name: ")
                
                    TextField("Smith",text: $lastName)
                        .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                
                    Spacer()
                }
                
                
                
                Spacer()
                          
            }
        }
    }
}

struct Create_New_Coach_View_Previews: PreviewProvider {
    static var previews: some View {
        Create_New_Coach_View()
    }
}
