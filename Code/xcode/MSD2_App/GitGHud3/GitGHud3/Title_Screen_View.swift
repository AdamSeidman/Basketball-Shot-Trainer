
import SwiftUI

struct Title_Screen_View: View {
    @StateObject var select:Selector = Selector()
    @StateObject var coach = Coach(firstName:"", lastName:"")
    @StateObject var team = Team(teamName: "")
    @StateObject var player = Player(firstName:"", lastName:"")
    let coreDM: CoreDataManager
    
    var body: some View {
        NavigationView{
            VStack{
                Image("image2")
                //Spacer()
                Button("Tap to begin"){
                    select.select = "select coach"
                }
                .buttonStyle(DefaultButtonStyle())
                .padding()
                NavigationLink(destination: Create_New_Coach_View(coreDM: coreDM), tag: "create coach", selection: $select.select){
                    EmptyView() }
                NavigationLink(destination: Select_Coach(coreDM: coreDM), tag: "select coach", selection: $select.select){
                    EmptyView() }
                NavigationLink(destination: Coach_Profile_View(), tag: "coach profile", selection: $select.select){
                    EmptyView() }
                NavigationLink(destination: Select_Team_View(), tag: "select team", selection: $select.select){
                    EmptyView() }
                NavigationLink(destination: Create_Team_View(), tag: "create team", selection: $select.select){
                    EmptyView() }
                NavigationLink(destination: Select_Player_View(), tag: "select player", selection: $select.select){
                    EmptyView() }
                NavigationLink(destination: Create_Player_View(), tag: "create player", selection: $select.select){
                    EmptyView() }
                NavigationLink(destination: Player_Profile_View(), tag: "player profile", selection: $select.select){
                    EmptyView() }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .environmentObject(select)
        .environmentObject(coach)
        .environmentObject(team)
        .environmentObject(player)
    }
}



