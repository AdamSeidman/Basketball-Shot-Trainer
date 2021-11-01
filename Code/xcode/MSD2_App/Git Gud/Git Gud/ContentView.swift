//
//  ContentView.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        
            ZStack{
                
                Image("blue_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
    
                    VStack{
                    
                        Spacer()
                    
                        Image("image2")
                    
                        Spacer()

                        NavigationLink(destination: Select_Coach()){
                            Text("Select Coach")
                        }
                        .buttonStyle(PlainButtonStyle())
                         .padding(.bottom, 20.0)
         
                        NavigationLink(destination: Create_New_Coach_View()){
                            Text("Create New Coach")
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                        
                    }
                    
                    
                
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
