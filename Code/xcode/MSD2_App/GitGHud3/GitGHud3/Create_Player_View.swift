import SwiftUI

struct Create_Player_View: View {
    
    @Environment(\.managedObjectContext) var moc
    @State var coaches: FetchedResults<Coach>
    @EnvironmentObject var select:NavigationSelector
    @EnvironmentObject var selectedData: DataSelection
    
    @State var players:[Player] = []
    @State var teams:[Team] = []
    
    @State private var newFirstName = ""
    @State private var newLastName = ""
    var body: some View {
        VStack{
            HStack{
                Button("Select Another Player"){
                    self.select.select = "select player"
                }
                Button("Title Screen"){
                    self.select.select = "title screen"
                }
            }
            HStack{
                Text("First Name: ").padding(.leading, 20.0)
                TextField("John",text: $newFirstName)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack{
                Text("Last Name: ").padding(.leading, 20.0)
                TextField("Smith",text: $newLastName)
                    .frame(width: /*@START_MENU_TOKEN@*/104.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            HStack{
                Button(action: {
                    let player = Player(context: self.moc)
                    player.firstName = newFirstName
                    player.lastName = newLastName
                    player.id = UUID()
                    for coach in coaches {
                            if coach.id == self.selectedData.coachID {
                                teams = (coach.teamList)?.allObjects as? [Team] ?? []
                                for team in teams {
                                    if team.id == self.selectedData.teamID {
                                        team.addToPlayerList(player)
                                    }
                                }
                            }
                        }
                    try? self.moc.save()
        
                    select.select = "select player"
                }, label: {
                        Text("Confirm")})
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

