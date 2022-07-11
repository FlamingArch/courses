//
//  AstronautView.swift
//  Moonshot
//
//  Created by Harsh Chaturvedi on 19/06/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        var missions = [Mission]()
        
        // Search Code Here
        let decoded: [Mission] = Bundle.main.decode("missions.json")
        for mission in decoded {
            for crew in mission.crew {
                if (crew.name == astronaut.id) {
                    missions.append(mission)
                }
            }
        }
        self.missions = missions
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Missions")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(missions) { mission in
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .scaledToFit()
                                    .clipShape(Capsule())
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationBarTitle(astronaut.name, displayMode: .inline)
    }
}

//struct AstronautView_Previews: PreviewProvider {
//    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
//    static var previews: some View {
//        AstronautView(astronaut: astronauts[0])
//    }
//}
