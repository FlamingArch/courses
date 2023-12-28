//
//  ContentView.swift
//  BetterRest
//
//  Created by Harsh Chaturvedi on 26/12/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp: Date = defaultWakeupTime
    @State private var date: Date = Date.now
    @State private var sleepAmount: Double = 8.0
    @State private var coffeeAmount: Int = 1
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var showingAlert:Bool = false
    
    static var defaultWakeupTime: Date {
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var sleepTimeFormatted: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediciton = try model.prediction(
                wake: Int64(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Int64(coffeeAmount)
            )
            let sleepTime = wakeUp - prediciton.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "??:??"
        }
    }
    
    func showAlert() {
        if (sleepTimeFormatted == "??:??") {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        } else {
            alertTitle = "Your Bedtime"
            alertMessage = "Your Idea Bedtime is \(sleepTimeFormatted)"
        }
        showingAlert = true
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack (alignment: .center){
                        Text(sleepTimeFormatted)
                            .padding()
                            .font(.title)
                    }.frame(maxWidth: .infinity)
                } header: {
                    Text("Your Ideal Sleep Time")
                }
                
                Section {
                    DatePicker(
                        "Please enter a Time",
                        selection: $wakeUp,
                        // in: Date.now...Date.now.addingTimeInterval(86400),
                        displayedComponents: .hourAndMinute
                    )
                    // .labelsHidden()
                    
                    Stepper(
                        "\(sleepAmount.formatted()) Hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25
                    )
                } header: {
                    Text("When do you want to wake up?")
                }
                
                
                Section {
                    Stepper(
                        // This Markdown syntax tells SwiftUI that the word "cup" needs to be inflected to match whatever is in the coffeeAmount variable, which in this case means it will automatically be converted from "cup" to "cups" as appropriate.
                        "^[\(coffeeAmount) Cup](inflect:true)",
                        value: $coffeeAmount,
                        in: 1...20
                    )
                } header: {
                    Text("What is your Daily Coffee Intake?")
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: showAlert)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Ok") { }
            } message: {
                Text(alertMessage)
            }

        }
    }
}

#Preview {
    ContentView()
}
