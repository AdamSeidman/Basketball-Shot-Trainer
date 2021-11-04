import SwiftUI

struct Create_Player_View: View {
    @EnvironmentObject var select:Selector
    @EnvironmentObject var coach: Coach
    @EnvironmentObject var team: Team
    @EnvironmentObject var player: Player
    @State private var newPlayerFirstName = ""
    @State private var newPlayerLastName = ""
    var body: some View {
        VStack{
            HStack{
                Text("First name: ").padding(.leading, 20.0)
                TextField("John",text: $newPlayerFirstName)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack{
                Text("Last name: ").padding(.leading, 20.0)
                TextField("smith",text: $newPlayerLastName)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Button("Confirm"){
                team.playerList.append(Player(firstName: newPlayerFirstName, lastName: newPlayerLastName))
                self.select.select = "player profile"
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

