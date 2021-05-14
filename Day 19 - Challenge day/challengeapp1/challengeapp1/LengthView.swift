//
//  LengthView.swift
//  challengeapp1
//
//  Created by Harsh Chaturvedi on 14/05/21.
//

import SwiftUI

struct LengthView: View {
    @State private var input = "0"
    @State private var unit = 0
    private var units = ["M", "KM", "FT", "YD", "ML"]
    private var meters: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value
            case 1:
                return value * 1000
            case 2:
                return value / 3.281
            case 3:
                return value / 1.094
            case 4:
                return value * 1609
            default:
                return 0
            }
        } else {
//            validText = false
            return 0
        }
    }
    private var kilometers: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 1000
            case 1:
                return value
            case 2:
                return value / 3281
            case 3:
                return value / 1094
            case 4:
                return value * 1.609
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var feet: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value * 3.281
            case 1:
                return value * 3281
            case 2:
                return value
            case 3:
                return value * 3
            case 4:
                return value * 5280
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var yards: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value * 1.094
            case 1:
                return value * 1094
            case 2:
                return value / 3
            case 3:
                return value
            case 4:
                return value * 1760
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var miles: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 1609
            case 1:
                return value / 1.609
            case 2:
                return value / 5280
            case 3:
                return value / 1760
            case 4:
                return value
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
                Section(header: Text("Meters")) {
                    Text("\(meters, specifier: "%.2f") M")
                }
                Section(header: Text("Kilometers")) {
                    Text("\(kilometers, specifier: "%.2f") KM")
                }
                Section(header: Text("Feet")) {
                    Text("\(feet, specifier: "%.2f") FT")
                }
                Section(header: Text("Yards")) {
                    Text("\(yards, specifier: "%.2f") YD")
                }
                Section(header: Text("Miles")) {
                    Text("\(miles, specifier: "%.2f") ML")
                }
            }
            .navigationTitle("Length")
        }
    }
}
