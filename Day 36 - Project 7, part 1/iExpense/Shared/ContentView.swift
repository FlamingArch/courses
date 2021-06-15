//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 08/06/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                            .foregroundColor(item.amount > 10 ? (item.amount > 100 ? .red : .yellow) : .green)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                //let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                //self.expenses.items.append(expense)
                self.showingAddExpense = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

//struct User: Codable {
//    var firstName: String
//    var lastName: String
//}
//
//struct ContentView: View {
//    private var user: User {
//        let decoder = JSONDecoder()
//        guard let data = userJSON.data(using: .utf8) else {
//            return User(firstName: "No", lastName: "Data")
//        }
//
//        guard let user = try? decoder.decode(User.self, from: data) else {
//            return User(firstName: "No", lastName: "JSON Decode")
//        }
//
//        return user
//
//    }
//    var userJSON = """
//    {
//        "firstName": "Drink",
//        "lastName": "Bleach"
//    }
//"""
//
//    var body: some View {
//        Text("\(user.firstName) \(user.lastName)")
//    }
//}

//struct User: Codable {
//    var firstName: String
//    var lastName: String
//}
//
//struct ContentView: View {
//    @State private var user = User(firstName: "Taylor", lastName: "Swift")
//
//    var body: some View {
//        Button("Save User") {
//            let encoder = JSONEncoder()
//            if let data = try? encoder.encode(self.user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
//    }
//}

//struct ContentView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//    var body: some View {
//        Button("Tap Count: \(tapCount)"){
//            tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "Tap")
//        }
//    }
//}

//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("\($0)")
//                    }.onDelete(perform: removeRows)
//                    Button("Add Number") {
//                        self.numbers.append(self.currentNumber)
//                        self.currentNumber += 1
//                    }
//                }
//            }.navigationBarItems(leading: EditButton())
//        }
//    }
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}


//struct SecondView: View {
//    @Environment(\.presentationMode) var presentationMode
//    var name: String
//    var body: some View {
//        Button("Dismiss"){
//            self.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}
//
//
//struct ContentView: View {
//    @State private var showingSheet = false
//    var body: some View {
//        Button("Show Sheet") {
//            showingSheet.toggle()
//        }.sheet(isPresented: $showingSheet) {
//            SecondView(name: "@twostraws")
//        }
//    }
//}


//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

//struct ContentView: View {
//    @ObservedObject private var user = User()
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)!")
//                .padding()
//            TextField("First Name", text: $user.firstName)
//            TextField("Last Name", text: $user.lastName)
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
