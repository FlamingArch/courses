//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 27/08/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                        VStack(alignment:.leading) {
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            Text("Count: \(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(leading: EditButton())
                .toolbar {
                    Button { self.showingAddScreen.toggle() } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                        .environment(\.managedObjectContext, self.moc)
                }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

// Create a Core Data Entity "Student" with following fields:
// id: UUID
// name: String

//struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
//    var body: some View {
//        VStack {
//            List {
//                ForEach(students, id: \.id) { student in
//                    Text(student.name ?? "Unknown")
//                }
//            }
//            Button("Add") {
//                let firstNames = ["Ginny", "Harry", "Hermonie", "Luna", "Ron"]
//                let lastNames = ["Granger", "Lovegood", "Potter", "Weasely"]
//
//                let chosenFirstName = firstNames.randomElement()!
//                let chosenLastName = lastNames.randomElement()!
//
//                let student = Student(context: self.moc)
//                student.id = UUID()
//                student.name = "\(chosenFirstName) \(chosenLastName)"
//
//                try? self.moc.save()
//            }
//        }
//    }
//}


//struct ContentView: View {
//    @Environment(\.horizontalSizeClass) var sizeClass
//    var body: some View {
//        if sizeClass == .compact {
//            return AnyView(VStack {
//                Text("Active size class: ")
//                Text("COMPACT")
//            }
//            .font(.largeTitle))
//        } else {
//            return AnyView(HStack {
//                Text("Active size class: ")
//                Text("REGULAR")
//            }
//            .font(.largeTitle))
//        }
//    }
//}

//struct ContentView: View {
//    @Environment(\.presentationMode) var presentationMode
//    var body: some View {
//        Text("Sup")
//            .onTapGesture {
//                self.presentationMode.wrappedValue.dismiss()
//            }
//    }
//}

//struct PushButton: View {
//    let title: String
////    @State var isOn: Bool
//    @Binding var isOn: Bool
//
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//
//    var body: some View {
//        Button(title) {
//            self.isOn.toggle()
//        }
//        .padding()
//        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
//        .foregroundColor(.white)
//        .clipShape(Capsule())
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//struct ContentView: View {
//    @State private var rememberMe = false
//
//    var body: some View {
//        // Toggle(isOn:$rememberMe) {
//        //     Text("Remember Me")
//        // }
//        VStack {
//            //  PushButton(title: "Remember Me", isOn: rememberMe)
//            PushButton(title: "Remember Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//
//        }
//    }
//}

// Create a Core Data Entity "Item" with following fields:
// timestamp: Date

//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
