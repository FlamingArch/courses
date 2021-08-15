//
//  habitsApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 03/08/21.
//

import SwiftUI

@main
struct habitsApp: App {
    
    @ObservedObject var controller = HabitsController()
    
    var body: some Scene {
        WindowGroup {
            ContentView(controller: controller)
        }
    }
}
