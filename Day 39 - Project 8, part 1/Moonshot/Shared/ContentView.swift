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
    
    @State private var toggled: Bool = false
    
    var body: some View {
        NavigationView {
            List(missions) {mission in
                NavigationLink(
                    destination: MissionView(mission: mission, astronauts: self.astronauts)
                ) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width:44, height:44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if toggled { Text(toggled ? mission.formattedLaunchDate : "crew") }
                        else {
                            VStack(alignment: .leading) {
                                ForEach(0..<mission.crew.count) { num in
                                    if let astro = astronauts.first(where: { astronaut in
                                        astronaut.id == mission.crew[num].name
                                    }) {
                                        Text(astro.name)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Moonshot")
            .navigationBarItems(leading: Button(toggled ? "Names" : "Dates") {
                toggled.toggle()
            })
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
