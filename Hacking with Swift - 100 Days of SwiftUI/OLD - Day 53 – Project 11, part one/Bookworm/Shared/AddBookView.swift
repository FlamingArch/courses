//
//  AddBookView.swift
//  Bookworm
//
//  Created by Harsh Chaturvedi on 29/08/21.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingEmptyGenreAlert = false
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section{
                    RatingView(rating: $rating)
                    // Picker("Rating", selection: $rating) {
                    //     ForEach(0..<6) {
                    //         Text("\($0)")
                    //     }
                    // }
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        if genre.isEmpty {
                            showingEmptyGenreAlert.toggle()
                        }
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        
                        newBook.genre = self.genre
                        newBook.review = self.review
                        
                        newBook.date = Date()
                        
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .alert(isPresented: $showingEmptyGenreAlert) {
                Alert(title: Text("No Genre Selected"))
            }
            .navigationTitle("Add Book")
        }
    }
}

//struct AddBookView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddBookView()
//    }
//}
