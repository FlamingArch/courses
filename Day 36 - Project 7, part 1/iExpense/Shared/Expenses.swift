//
//  Expenses.swift
//  iExpense
//
//  Created by Harsh Chaturvedi on 15/06/21.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
