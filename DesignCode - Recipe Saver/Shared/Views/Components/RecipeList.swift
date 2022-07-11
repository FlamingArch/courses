//
//  RecipeList.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "Recipes" : "Recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                .opacity(0.7)
                Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        RecipeView(recipe: recipe)
                    } label: {
                        RecipeCard(recipe: recipe)
                    }

                }
            }
            .padding(.top)
        }
        .padding()
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
        }
    }
}
