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
    var count: Int
    
    mutating func increaseCount() { count += 1 }
    
    init(_ title: String) {
        self.title = title
        self.count = 0
    }
}

class HabitsController: ObservableObject {
    @Published var habits = [Habit]()
    
    func newHabit(_ title: String) { habits.append(Habit(title)) }
    
    func increaseCount(index: Int) { habits[index].increaseCount() }
}
