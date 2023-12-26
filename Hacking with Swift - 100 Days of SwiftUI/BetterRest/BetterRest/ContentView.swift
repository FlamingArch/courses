//
//  ContentView.swift
//  BetterRest
//
//  Created by Harsh Chaturvedi on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var date: Date = Date.now
    
    var body: some View {
        Form {
            Stepper(
                "\(sleepAmount.formatted()) Hours",
                value: $sleepAmount,
                in: 4...12,
                step: 0.25
            )
            DatePicker(
                "Please enter a date",
                selection: $wakeUp,
                in: Date.now...Date.now.addingTimeInterval(86400),
                displayedComponents: .hourAndMinute
            ).labelsHidden()
        }
    }
}

#Preview {
    ContentView()
}
