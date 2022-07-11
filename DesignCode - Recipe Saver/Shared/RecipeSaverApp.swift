//
//  RecipeSaverApp.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

@main
struct RecipeSaverApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
