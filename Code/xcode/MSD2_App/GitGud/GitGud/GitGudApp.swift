//
//  GitGudApp.swift
//  GitGud
//
//  Created by Deanna DiPaolo on 11/4/21.
//

import SwiftUI

@main
struct GitGudApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
