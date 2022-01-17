//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 10/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Sup")
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
