//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var category: Category
    
    // Computed Property
    var recipes: [Recipe] {
        recipesVM.recipes.filter{ $0.category.rawValue == category.rawValue }
    }
    
    var body: some View {
        ScrollView {
            RecipeList(
                recipes: recipes
            )
        }
        .navigationTitle(category.rawValue + "s")
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.breakfast)
            .environmentObject(RecipesViewModel())
    }
}
