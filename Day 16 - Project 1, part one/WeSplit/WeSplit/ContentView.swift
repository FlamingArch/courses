//
//  ContentView.swift
//  WeSplit
//
//  Created by Harsh Chaturvedi on 11/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkOutAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkOutAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        if let people = peopleCount {
            if people==0{
                return 0
            } else {
                return grandTotal/people
            }
        } else { return 0 }
    }
    
    let tipPercentages = [10,15,20,25,0]
    
    func calculateValues() {
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkOutAmount)
                        .keyboardType(.decimalPad)
                    //                    Picker("Number of People", selection: $numberOfPeople) {
                    //                        ForEach(2 ..< 100) {
                    //                            Text("\($0) people")
                    //                        }
                    //                    }
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                Section(header: Text("How Much Tip You Want to Leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount Per Person")) {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Total Amount")) {
                    Text("\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(tipPercentage == 4 ? .red : .primary)
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
