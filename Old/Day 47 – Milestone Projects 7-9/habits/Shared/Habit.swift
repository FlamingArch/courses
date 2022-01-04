//
//  Habit.swift
//  habits
//
//  Created by Harsh Chaturvedi on 06/08/21.
//

import Foundation

struct Habit: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var completed: Int
    
    mutating func increaseCompleted() { completed+=1 }
}

class HabitsController : ObservableObject {
    @Published var habits: [Habit] = []
    
    func addHabit(_ title: String, _ description: String) {
        habits.append(Habit(title: title, description: description, completed: 0))
    }
    
    func increaseCompleted(_ habit: Habit) {
        if let index = habits.firstIndex(where: { habit.id == $0.id })
        {
            habits[index].increaseCompleted()
        } else { print("Unable to increase count") }
    }
}
