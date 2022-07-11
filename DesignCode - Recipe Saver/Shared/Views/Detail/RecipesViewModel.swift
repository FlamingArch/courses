//
//  RecipesViewModel.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 07/01/22.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    
    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
