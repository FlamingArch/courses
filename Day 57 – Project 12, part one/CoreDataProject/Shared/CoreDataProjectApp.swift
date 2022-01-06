//
//  CoreDataProjectApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 20/09/21.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
