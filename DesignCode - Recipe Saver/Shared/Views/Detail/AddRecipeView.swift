//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by Harsh Chaturvedi on 07/01/22.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    @State private var recipeName: String = ""
    @State private var selectedCategory: Category = .main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("", text: $recipeName)
                }
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                }
                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                    }
                }
                ToolbarItem {
                    NavigationLink(isActive: $navigateToRecipe) {
                        RecipeView(recipe: recipesVM.recipes.sorted {
                            $0.datePublished > $1.datePublished
                        }[0])
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Button {
                            navigateToRecipe = true
                        } label: {
                            Label("Done", systemImage: "checkmark")
                        }
                    }
                    .disabled(recipeName.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}

extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let datePublished = dateFormatter.string(from: now)
        let recipe = Recipe(name: self.recipeName, image: "", description: self.description, ingredients: self.ingredients, directions: self.directions, category: self.selectedCategory, datePublished: datePublished, url: "")
        recipesVM.addRecipe(recipe: recipe)
    }
}
