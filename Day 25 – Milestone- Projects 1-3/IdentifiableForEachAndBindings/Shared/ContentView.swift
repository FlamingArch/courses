//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 25/05/21.
//

import SwiftUI

struct ContentView: View {
    
    let agents = ["Cyril", "Lana", "Pam", "Sterling"]
    
    @State var selection = 0
    
    @State var agreedToTerms = false
    @State var agreedToPrivacyPolicy = false
    @State var agreedToEmails = false
    
    var body: some View {
        
        let binding = Binding(
            get: { self.selection },
            set: { self.selection = $0 }
        )
        
        let agreedToAll = Binding {
            self.agreedToEmails && self.agreedToTerms && self.agreedToPrivacyPolicy
        } set: {
            self.agreedToTerms = $0
            self.agreedToPrivacyPolicy = $0
            self.agreedToEmails = $0
        }

        return NavigationView {
            Form {
                
                Section(header: Text("ForEach")) {
                    
                    HStack {
                        ForEach(0..<agents.count) {
                            Text("\(agents[$0])")
                        }
                    }
                    
                    
                    // Since Strings are unique, we can tell SwiftUI to use the strings as unique identifiers
                    HStack {
                        ForEach(agents, id: \.self) {
                            Text($0)
                        }
                    }
                    
                }
                
                Section(header: Text("Bindings")) {
                    
                    Picker("Select a number", selection: binding) {
                        ForEach(0..<3) {
                            Text("Item \($0)")
                        }
                    }
                    
                    Toggle(isOn: $agreedToTerms, label: {
                        Text("Agreed to Terms")
                    })
                    
                    Toggle(isOn: $agreedToPrivacyPolicy, label: {
                        Text("Agreed to Privacy Policy")
                    })
                    
                    Toggle(isOn: $agreedToEmails, label: {
                        Text("Agreed to Emails")
                    })
                    
                    Toggle(isOn: agreedToAll, label: {
                        Text("Agreed to All")
                    })
                    
                }
                
            }
            .navigationTitle("Consolidation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

