//
//  HomeView.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: recipesVM.recipes)
                    .navigationTitle("My Recipes")
                    .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipesViewModel())
    }
}
