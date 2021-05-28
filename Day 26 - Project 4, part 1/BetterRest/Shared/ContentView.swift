//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 28/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    @State private var coffeeAmount = 1
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Text("When do you want to wake up?")
                DatePicker("Enter date:", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                
                Text("Desired amount of sleep")
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                
                Text("Daily Coffee Intake").font(.headline)
                Stepper(value: $coffeeAmount, in: 1...20) {
                    coffeeAmount==1 ? Text("1 Cup") : Text("\(coffeeAmount) cups")
                }
                
            }
            
            .navigationTitle("BetterRest")
            .navigationBarItems(trailing: Button(action: calculateBedtime) {
                Text("Calculate")
            })
            
        }
        
    }
    
    func calculateBedtime() {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date()

//        let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0

//        let formatter=  DateFormatter()
//        formatter.timeStyle = .short
//        let dateString = formatter.string(from: Date())
