//
//  TemperatureView.swift
//  challengeapp1
//
//  Created by Harsh Chaturvedi on 14/05/21.
//

import SwiftUI

struct TemperatureView: View {
    @State private var input: String = "0"
    @State private var unit = 0
    private var units = ["ºC","ºF","ºK",]
    
    
    private var celsuis: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value
            case 1:
                return (value - 32) * (5/9)
            case 2:
                return value - 273.15
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    
    private var farenheit: Double {
        if let input = Double(input) {
            switch unit {
            case 0:
                return (input * 9/5) + 32
            case 1:
                return input
            case 2:
                return ((input - 273.16) * 9/5) + 32
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var kelvin: Double {
        if let input = Double(input) {
            switch unit {
            case 0:
                return input + 273.16
            case 1:
                return ((input - 32) * (5/9)) + 273.16
            case 2:
                return input
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter Temperature in \(units[unit])", text: $input)
//                        .keyboardType(.numberPad)
                    Picker("Unit", selection: $unit) {
                        ForEach(0..<units.count) {
                            Text(units[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Celsius")) {
                    Text("\(celsuis, specifier: "%.2f") ºC")
                }
                Section(header: Text("Farenheit")) {
                    Text("\(farenheit, specifier: "%.2f") ºF")
                }
                Section(header: Text("Kelvin")) {
                    Text("\(kelvin, specifier: "%.2f") ºK")
                }
            }
            .navigationTitle("Temperature")
        }
    }
}
