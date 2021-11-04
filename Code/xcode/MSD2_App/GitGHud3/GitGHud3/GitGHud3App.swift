//
//  GitGHud3App.swift
//  GitGHud3
//
//  Created by Deanna DiPaolo on 11/4/21.
//

import SwiftUI

@main
struct GitGHud3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
