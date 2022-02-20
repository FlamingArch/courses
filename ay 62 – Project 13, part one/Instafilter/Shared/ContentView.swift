//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 14/02/22.
//

import SwiftUI
import CoreImage

/// # Integrating Core Image with SwiftUI
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
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.identity = 1
    }
}

/// # Showing multiple options with confirmationDialog()
// struct ContentView: View {
//     @State private var showingConfirmation = false
//     @State private var backgroundColor = Color.white
//
//     var body: some View {
//         Text("Sup")
//             .frame(width: 300, height: 300)
//             .background(backgroundColor)
//             .onTapGesture {
//                 showingConfirmation = true
//             }
//             .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
//                 Button("Red") { backgroundColor = Color.red }
//                 Button("Green") { backgroundColor = Color.green }
//                 Button("Blue") { backgroundColor = Color.blue }
//                 Button("Cancel", role: .cancel) { }
//             } message: {
//                 Text("Select new color.")
//             }
//     }
// }

/// # Responding to state changes using onChange()
//struct ContentView: View {
//    @State private var blurAmount = 0.0
//
//    var body: some View {
//        VStack {
//            Text("Hello, World")
//                .blur(radius: blurAmount)
//
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) { newValue in
//                    print("New value is: \(newValue)")
//                }
//
//            Button ("Random Blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//        }
//    }
//}

/// # How property wrappers become structs
// struct ContentView: View {
//     @State private var blurAmount = 0.0 {
//         didSet {
//             print("New value is: \(blurAmount)")
//         }
//     }
//
//     var body: some View {
//         VStack {
//             Text("Hello, World")
//                 .blur(radius: blurAmount)
//
//             Slider(value: $blurAmount, in: 0...20)
//             Button ("Random Blur") {
//                 blurAmount = Double.random(in: 0...20)
//             }
//         }
//     }
// }

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
