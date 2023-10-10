//
//  ContentView.swift
//  WeSplit
//
//  Created by Harsh Chaturvedi on 09/10/23.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "Harry"
    
    let students = ["Harry", "Hermione", "Ron"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    // Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format:.percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1
                }
                
                Section {
                    ForEach(0..<10) { number in
                        Text("Row \(number)")
                    }
                }
                
                Section {
                    Picker("Select your student", systemImage: "globe", selection: $selectedStudent) {
                        ForEach(students, id: \.self) { student in
                            Text("\(student)")
                        }
                    }
                }
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
