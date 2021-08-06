//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 03/08/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var HC = HabitsController()
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(HC.habits) { habit in
                    HStack(alignment: .center) {
                        Text(habit.title).font(.title).padding()
                        Spacer()
                        Text(String(habit.count)).padding()
                    }.onTapGesture(perform: habit.increaseCount)
                }
            }.navigationTitle("Habits")
            .toolbar { Button { showingAddScreen.toggle() } label: { Image(systemName: "plus") } }
            .sheet(isPresented: $showingAddScreen) { AddScreen(HC:HC) }
        }
    }
}

struct AddScreen: View {
    @ObservedObject var HC: HabitsController
    @Environment(\.presentationMode) var presentationMode
    @State private var titleInput = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Title",text: $titleInput)
            }.toolbar{
                Button("Done") {
                    HC.newHabit(titleInput)
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
