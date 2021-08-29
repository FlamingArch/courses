//
//  BookwormApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 27/08/21.
//

import SwiftUI

@main
struct BookwormApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
