//
//  VolumeView.swift
//  challengeapp1
//
//  Created by Harsh Chaturvedi on 14/05/21.
//

import SwiftUI

struct VolumeView: View {
    @State private var input = ""
    @State private var unit = 0
    private var units = ["ML", "L", "CUP", "PNT", "GLN"]
    private var mililiters: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value
            case 1:
                return value * 1000
            case 2:
                return value * 237
            case 3:
                return value * 473
            case 4:
                return value * 3785
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var liters: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 1000
            case 1:
                return value
            case 2:
                return value / 2.113
            case 3:
                return value / 4.227
            case 4:
                return value * 3.785
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var pints: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 473
            case 1:
                return value * 2.113
            case 2:
                return value
            case 3:
                return value / 2
            case 4:
                return value * 8
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var cups: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 237
            case 1:
                return value * 4.227
            case 2:
                return value * 2
            case 3:
                return value
            case 4:
                return value * 16
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    private var gallons: Double {
        if let value = Double(input) {
            switch unit {
            case 0:
                return value / 3785
            case 1:
                return value / 3.785
            case 2:
                return value / 8
            case 3:
                return value / 16
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
                Section(header: Text("Mililiters")) {
                    Text("\(mililiters, specifier: "%.2f") ML")
                }
                Section(header: Text("Liters")) {
                    Text("\(liters, specifier: "%.2f") L")
                }
                Section(header: Text("Pints")) {
                    Text("\(pints, specifier: "%.2f") PT")
                }
                Section(header: Text("Cups")) {
                    Text("\(cups, specifier: "%.2f") CP")
                }
                Section(header: Text("Gallons")) {
                    Text("\(gallons, specifier: "%.2f") GL")
                }
                
            }
            .navigationTitle("Volume")
        }
    }
}
