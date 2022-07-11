//
//  AddView.swift
//  iExpense
//
//  Created by Harsh Chaturvedi on 15/06/21.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    
    @State private var showingErrorAlert = false
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .alert(isPresented: $showingErrorAlert) {
                Alert(title: Text("Invalid Amount"))
            }
            .navigationBarTitle("Add new expense")
            .toolbar(content: {
                Button("Save") {
                    if let actualAmount = Int(self.amount) {
                        let item = ExpenseItem(name: name, type: type, amount: actualAmount)
                        expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        showingErrorAlert = true
                    }
                }
            })
        }
    }
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView(expenses: Expenses())
//    }
//}
