//
//  AddView.swift
//  habits
//
//  Created by Harsh Chaturvedi on 15/08/21.
//

import SwiftUI

struct AddView: View {
    @State private var title = ""
    @State private var description = ""
    @ObservedObject var controller: HabitsController
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter Activity Title", text: $title)
                TextField("Enter Activity Description", text: $description).lineLimit(10)
            }
            .toolbar {
                Button("Add") {
                    controller.addHabit(title, description)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("New Activity")
        }
    }
}
