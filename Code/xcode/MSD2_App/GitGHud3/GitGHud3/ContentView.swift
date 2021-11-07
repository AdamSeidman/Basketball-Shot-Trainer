//
//  ContentView.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/4/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Coach.entity(), sortDescriptors: []) var coaches: FetchedResults<Coach>
    
    @StateObject var select = NavigationSelector()
    @StateObject var selectedData = DataSelection()

    var body: some View {
        NavigationView{
            VStack{
                switch select.select{
                case "title screen":
                    Title_Screen_View()
                case "select coach":
                    Select_Coach_View(coaches: coaches)
                case "create coach":
                    Create_New_Coach_View()
                case "select team":
                    Select_Team_View(coaches: coaches)
                case "coach profile":
                    Coach_Profile_View(coaches: coaches)
                case "create team":
                    Create_Team_View(coaches: coaches)
                case "select player":
                    Select_Player_View(coaches: coaches)
                case "create player":
                    Create_Player_View(coaches: coaches)
                default:
                    Text("oops, something went wrong")
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .environmentObject(select)
        .environmentObject(selectedData)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

    
 /*
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    //}
//}
*/

