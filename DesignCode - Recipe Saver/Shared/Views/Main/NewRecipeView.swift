//
//  NewRecipeView.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showingAddRecipe = false
    
    var body: some View {
        NavigationView {
            Button("Add Recipe Manually") {
                showingAddRecipe = true
            }
            .navigationTitle("New Recipe")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showingAddRecipe) {
            AddRecipeView()
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}
