//
//  FavoritesView.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            Text("You Haven't Saved Any Recipes to your Favorites Yet")
                .padding()
                .navigationTitle("Favorites")
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
