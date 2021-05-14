//
//  ContentView.swift
//  challengeapp1
//
//  Created by Harsh Chaturvedi on 14/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TemperatureView()
                .tabItem { Label("Temperature", systemImage: "thermometer") }
            LengthView()
                .tabItem { Label("Length", systemImage: "ruler") }
            TimeView()
                .tabItem { Label("Time", systemImage: "clock") }
            VolumeView()
                .tabItem { Label("Volume", systemImage: "cube.transparent") }
        }.tabViewStyle(DefaultTabViewStyle())
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
