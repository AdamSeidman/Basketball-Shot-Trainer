//
//  Git_GudApp.swift
//  Git Gud
//
//  Created by Deanna DiPaolo on 10/31/21.
//

import SwiftUI
import CoreData

@main
struct Git_GudApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager());
        }
    }
}
