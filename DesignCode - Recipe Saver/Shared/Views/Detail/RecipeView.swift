//
//  RecipeView.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: recipe.url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(Color.white.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(height: 300)
            .background(
                LinearGradient(
                    colors: [Color(.gray).opacity(0.3), Color.gray],
                    startPoint: .top, endPoint: .bottom
                )
            )
            
            VStack(spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 30) {
                    
                    if (!recipe.description.isEmpty) {
                        Text(recipe.description)
                    }
                    
                    if (!recipe.ingredients.isEmpty) {
                        VStack(alignment: .leading, spacing: 30) {
                            Text("Ingredients")
                                .font(.headline)
                            Text(recipe.ingredients)
                        }
                    }
                    
                    if (!recipe.directions.isEmpty) {
                        VStack(alignment: .leading, spacing: 30) {
                            Text("Directions")
                                .font(.headline)
                            Text(recipe.ingredients)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.all[4])
    }
}
