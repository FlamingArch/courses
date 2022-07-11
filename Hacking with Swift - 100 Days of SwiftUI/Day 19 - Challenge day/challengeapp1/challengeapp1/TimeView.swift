//
//  TimeView.swift
//  challengeapp1
//
//  Created by Harsh Chaturvedi on 14/05/21.
//

import SwiftUI

struct TimeView: View {
    @State private var input = "0"
    @State private var unit = 0
    private var units = ["S", "M", "H", "D"]
    private var seconds: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value
            case 1:
                return value * 60
            case 2:
                return value * 3600
            case 3:
                return value * 86400
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var minutes: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 60
            case 1:
                return value
            case 2:
                return value * 60
            case 3:
                return value * 1440
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var hours: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 3660
            case 1:
                return value / 60
            case 2:
                return value
            case 3:
                return value * 24
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var days: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 86400
            case 1:
                return value / 1440
            case 2:
                return value / 24
            case 3:
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
                    TextField("Enter Time in \(units[unit])", text: $input)
//                        .keyboardType(.numberPad)
                    Picker("Unit", selection: $unit) {
                        ForEach(0..<units.count) {
                            Text(units[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Seconds")) {
                    Text("\(seconds, specifier: "%.2f") S")
                }
                Section(header: Text("Minutes")) {
                    Text("\(minutes, specifier: "%.2f") M")
                }
                Section(header: Text("Hours")) {
                    Text("\(hours, specifier: "%.2f") H")
                }
                Section(header: Text("Days")) {
                    Text("\(days, specifier: "%.2f") D")
                }
            }
            .navigationTitle("Time")
        }
    }
}
