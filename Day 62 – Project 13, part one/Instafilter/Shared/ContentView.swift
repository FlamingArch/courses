//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 11/04/22.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        image = Image("example")
    }
}

//struct ContentView: View {
//    @State private var showingConfirmation = false
//    @State private var backgroundColor = Color.white
//
//    var body: some View {
//        Text("Hello, world!")
//            .frame(width: 300, height: 300)
//            .background(backgroundColor)
//            .onTapGesture {
//                showingConfirmation = true
//            }
//            .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
//                Button("Red") { backgroundColor = .red}
//                Button("Green") { backgroundColor = .green}
//                Button("Blue") { backgroundColor = .blue}
//                Button("Cancel", role: .cancel) { }
//            } message: {
//                Text("Select a new color")
//            }
//    }
//}

//struct ContentView: View {
//    @State private var blurAmount = 0.0
//
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//            .blur(radius: blurAmount)
//
//        Slider(value: $blurAmount, in: 0...20)
//            .onChange(of: blurAmount) { newValue in
//                print("New value is \(newValue)")
//            }
//
//        Button("Random Blur") {
//            blurAmount = Double.random(in: 0...20)
//        }
//    }
//}

//struct ContentView: View {
//    @State private var blurAmount = 0.0 {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
//
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//            .blur(radius: blurAmount)
//
//        Slider(value: $blurAmount, in: 0...20)
//
//        Button("Random Blur") {
//            blurAmount = Double.random(in: 0...20)
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
