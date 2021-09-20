//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 20/09/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    // Inside SceneDelegate.swift, add:
    // context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    // Now, when save is pressed, CoreData will strip out duplicates, and only 1 value will be stored.
    var body: some View {
        VStack {
            List(wizards, id:\.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: self.moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try self.moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

//struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//
//    var body: some View {
//        Button("Save") {
//            if self.moc.hasChanges {
//                try? self.moc.save()
//            }
//        }
//    }
//}

//struct Student: Hashable {
//    let name: String
//}
//
//struct ContentView: View {
//    let students = [Student(name: "Harry Potter"), Student(name: "Hermoine Granger")]
//    var body: some View {
//        List(students, id: \.self) { student in
//            Text(student.name)
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        List {
//            ForEach([2,4,6,8,10], id:\.self) {
//                Text("\($0) is even")
//            }
//        }
//    }
//}

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
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
