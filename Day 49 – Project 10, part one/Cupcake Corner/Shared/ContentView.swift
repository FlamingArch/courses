//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 06/01/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your Cake Type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of Cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any Special Requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if (order.specialRequestEnabled) {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Deliverey details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

/// # Validating and Disabling Forms
//struct ContentView: View {
//    @State private var username = ""
//    @State private var email = ""
//
//    var body: some View {
//        Form {
//            Section {
//                TextField("Username", text: $username)
//                TextField("Email", text: $email)
//            }
//
//            Section {
//                Button("Create Account") {
//
//                }
//            }
//            .disabled(disabledForm)
//        }
//    }
//
//    var disabledForm: Bool {
//        username.count < 5 || email.count < 5
//    }
//}

/// # Fetching Image from Network URL
//struct ContentView: View {
//    var body: some View {
//        // AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
//
//        // AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
//
//        // AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
//        //     .resizable() /// Doesn't exist for `AsyncIamge
//        //     .frame(width: 200, height: 200) /// Only applies to the placeholder, not the actual image
//
//        // AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) {image in
//        //     image
//        //         .resizable()
//        //         .scaledToFit()
//        // } placeholder: {
//        //     // Color.red
//        //     ProgressView()
//        // }
//
//
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) {phase in
//            if let image = phase.image {
//                image
//                    .resizable()
//                    .scaledToFit()
//            } else if phase.error != nil {
//                Text("There was an error loading the image")
//            } else {
//                ProgressView()
//            }
//        }
//        .frame(width: 200, height: 200)
//
//
//    }
//}

/// # Fetching Data from Network URL
//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable {
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}
//
//struct ContentView: View {
//    @State private var results = [Result]()
//
//    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .task {
//            await loadData()
//        }
//    }
//
//    func loadData() async {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        } catch {
//            print("Invalid Data")
//        }
//    }
//}


/// # Adding `Codable` Conformance to `@Published` properties
//class User: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case name
//    }
//
//    @Published var name = "Paul Hudson"
//
//    ///  `required` means that any subclasses inheriting `User` class has to override the `init()` method.
//    ///  It is necessary to include it, or it will throw a compile time error..
//    ///  If class is `final`, we can remove `required`.
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//    }
//}
