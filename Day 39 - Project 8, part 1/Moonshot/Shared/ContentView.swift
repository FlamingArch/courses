//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        NavigationView {
            List(missions) {mission in
                NavigationLink(destination: Text("Detail View")) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width:44, height:44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }.navigationTitle("Moonshot")
        }
        
    }
}

//struct ContentView: View {
//    var body: some View {
//        Button("Decode JSON") {
//            let input = """
//                {
//                    "name": "Taylor Swift",
//                    "address": {
//                        "street": "555, Taylor Swift Avenue",
//                        "city": "Nashville"
//                    }
//                }
//                """
//            struct User: Codable {
//                var name: String
//                var address: Address
//            }
//
//            struct Address: Codable {
//                var street: String
//                var city: String
//            }
//
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink ( destination: Text("Detail \(row)") ) { Text("Row \(row)") }
//            }
//            .navigationTitle("SwiftUI")
//        }
//    }
//}

//struct CustomText: View {
//    var text: String
//    var body: some View {
//        Text(text)
//    }
//    init(_ text: String) {
//        print("Creating a CustomText")
//        self.text = text
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        ScrollView(.vertical) {
//            VStack {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }.frame(maxWidth: .infinity)
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                Image("bg")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: geo.size.width)
//                    .edgesIgnoringSafeArea(.all)
//            }
////                .clipped()
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
