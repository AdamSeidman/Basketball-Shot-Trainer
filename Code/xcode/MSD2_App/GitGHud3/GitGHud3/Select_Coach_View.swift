//
//  Select_Coach.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI

struct Select_Coach_View: View {
    @State var coaches: FetchedResults<Coach>
    @EnvironmentObject var selectedData: DataSelection
    @EnvironmentObject var select: NavigationSelector
    
    var body: some View {
        NavigationView{
            VStack{
                List {
                    Text("Select a coach")
                    ForEach(coaches) {coach in
                        Button((coach.firstName ?? "") + " " + (coach.lastName ?? "")){
                            self.selectedData.coachID = coach.id
                            self.select.select = "coach profile"
                        }
                    }
                    Button("create new coach"){
                        select.select = "create coach"
                    }
                    .frame(width: 150, height: 50)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

