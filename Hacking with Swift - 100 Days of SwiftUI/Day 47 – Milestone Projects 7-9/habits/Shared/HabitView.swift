//
//  HabitView.swift
//  habits
//
//  Created by Harsh Chaturvedi on 15/08/21.
//

import SwiftUI

struct HabitView: View {
    var habitIndex: Int
    @ObservedObject var controller: HabitsController
    var body: some View {
        VStack {
            Text(controller.habits[habitIndex].title).font(.title)
            Text(controller.habits[habitIndex].description)
            Spacer()
            Text("Completed \(controller.habits[habitIndex].completed) times").padding()
            Button { controller.increaseCompleted(controller.habits[habitIndex]) }
                label: {
                    Text("Increase Completed")
                        .padding()
                        .foregroundColor(.primary)
                        .background(
                            RoundedRectangle(cornerRadius: 6.0)
                                .foregroundColor(Color.accentColor.opacity(0.16))
                        )
                }.padding()
        }
    }
}

