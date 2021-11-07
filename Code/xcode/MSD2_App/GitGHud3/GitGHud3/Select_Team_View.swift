

import SwiftUI
import UIKit

struct Select_Team_View: View {
    
    @State var coaches: FetchedResults<Coach>
    @EnvironmentObject var selectedData: DataSelection
    @EnvironmentObject var select: NavigationSelector
    @State var teams:[Team] = []
    
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Button("Title Screen"){
                        self.select.select = "title screen"
                    }
                    Spacer()
                }
                List {
                    Text("Select a team")
                    ForEach(teams){ team in
                        Button(team.teamName ?? "Wild Cats") {
                            self.selectedData.teamID = team.id
                            self.select.select = "select player"
                        }
                    }
                    Button("Create Team"){
                        self.select.select = "create team"
                    }
                    .padding(.top)
                    Spacer()
                }
            }
            .onAppear(perform: {
                for coach in coaches{
                    if coach.id == self.selectedData.coachID {
                        teams = (coach.teamList)?.allObjects as? [Team] ?? []
                    }
                }
            })
            
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

