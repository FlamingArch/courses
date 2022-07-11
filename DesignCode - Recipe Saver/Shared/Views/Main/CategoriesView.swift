//
//  CategoriesView.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 04/01/22.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    NavigationLink  {
                        CategoryView(category: category)
                    } label: {
                        Text(category.rawValue + "s")
                    
                    }

                }
            }
            .navigationTitle("Categories")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
