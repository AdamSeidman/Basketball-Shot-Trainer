//
//  ContentView.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.


import SwiftUI

struct ContentView: View {
    @State private var createCoach = false
    @State private var useExistingCoach = false
    var body: some View {
        //NavigationView{
            
            ZStack{
                
                Image("blue_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    VStack{
                        Spacer()
                        Image("image2")
                        Spacer()
                        Button("Create new coach"){
                            createCoach = true
                        }
                        .padding(.bottom)
                        Button("Select existing coach"){
                            useExistingCoach = true
                        }
                }
            }
            .navigate(to: Create_New_Coach_View(), when: $createCoach)
            .navigate(to: Select_Coach(), when: $useExistingCoach)
            //.navigationBarTitle("")
            //.navigationBarHidden(true)
           // .navigationBarBackButtonHidden(true)
        }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView_LibraryContent: LibraryContentProvider {
    var views: [LibraryItem] {
        LibraryItem(/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/)
    }
}
