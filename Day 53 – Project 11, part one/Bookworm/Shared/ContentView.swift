//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 10/01/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) {book in
                    NavigationLink {
                        Text(book.title ?? "Unknown Title")
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
}

/// # How to combine CoreData and SwiftUI
/// **REMEBER TO MAKE ENTITY `Student` WITH PROPERTIES `name` OF TYPE STRING AND `id` OF TYPE UUID**
//struct ContentView: View {
//    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
//    @Environment(\.managedObjectContext) var moc
//
//    var body: some View {
//        VStack {
//            List(students) { student in
//                Text(student.name ?? "Unknown")
//            }
//
//            Button("Add") {
//                let firstNames = ["Ginny", "Harry", "Hermoine", "Luna", "Ron"]
//                let lastNames = ["Granger", "Lovegood", "Potter", "Weasly"]
//
//                let chosenFirstName = firstNames.randomElement()! + " " + lastNames.randomElement()!
//
//                let student = Student(context: moc)
//                student.id = UUID()
//                student.name = chosenFirstName
//
//                try? moc.save()
//            }
//        }
//    }
//}

/// # Accepting Multi-line text input with TextEditor
//struct ContentView: View {
//    @AppStorage("notes") private var notes = ""
//
//    var body: some View {
//        NavigationView {
//            TextEditor(text: $notes)
//                .navigationTitle("Notes")
//                .padding()
//        }
//    }
//}

/// # Creating Custom Component with @Binding
//struct PushButton: View {
//    let title: String
//    @Binding var isOn: Bool
//
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(
//            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
//        )
//        .foregroundColor(.white)
//        .clipShape(Capsule())
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//struct ContentView: View {
//    @State private var rememberMe = false
//    var body: some View {
//        PushButton(title: "Remember Me", isOn: $rememberMe)
//        Text(rememberMe ? "On" : "Off")
//    }
//}
