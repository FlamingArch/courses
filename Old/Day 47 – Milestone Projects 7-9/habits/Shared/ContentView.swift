//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 03/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var controller: HabitsController
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(controller.habits) { habit in
                    NavigationLink(destination: HabitView(habitIndex: controller.habits.firstIndex(where: {
                        $0.id == habit.id
                    })!, controller: controller)) {
                        VStack(alignment: .leading) {
                            Text(habit.title).font(.headline)
                                .foregroundColor(Color(hue: Double.random(in: 0..<1.0), saturation: 0.8, brightness: 0.8))
                            Text("Completed \(habit.completed) Times").foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button { showingAddView.toggle() } label: {Image(systemName: "plus")}
            }
            .sheet(isPresented: $showingAddView) {
                AddView(controller: controller)
            }
        }
    }
}


