//
//  ContentView.swift
//  Converter
//
//  Created by Harsh Chaturvedi on 20/10/23.
//

import SwiftUI

enum TemperatureUnits: String, CaseIterable {
    case Celsius, Fahrenheit, Kelvin
}

struct ContentView: View {
    @State private var enteredTemperature = 0
    @State private var selectedTemperatureUnit = "Celsius"
    
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    var body: some View {
        TabView {
            NavigationStack {
                Form {
                    Section("Enter Value to Convert") {
                        TextField("Temperature", value: $enteredTemperature, format: .number)
                        
                        Picker("Unit", systemImage: "medical.thermometer", selection: $selectedTemperatureUnit) {
                            ForEach(TemperatureUnits.allCases, id: \.rawValue) { unit in
                                Text(unit.rawValue)
                            }
                        }
                        
                    }
                    
                    Section("Enter Value to Convert") {
                        TextField("Temperature", value: $enteredTemperature, format: .number)
                        
                        Picker("Unit", systemImage: "medical.thermometer", selection: $selectedTemperatureUnit) {
                            ForEach(TemperatureUnits.allCases, id: \.rawValue) { unit in
                                Text(unit.rawValue)
                            }
                        }
                        
                    }
                }
                .navigationTitle("Temperature")
            }
            .tabItem {
                Label {
                    Text("Temperature")
                } icon: {
                    Image(systemName: "medical.thermometer")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
