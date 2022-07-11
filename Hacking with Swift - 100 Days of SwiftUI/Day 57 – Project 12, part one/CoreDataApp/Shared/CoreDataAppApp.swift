//
//  CoreDataAppApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 26/01/22.
//

import SwiftUI

@main
struct CoreDataAppApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
