//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 10/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text("Sup")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Change Background"), message: Text("Select a new Color"), buttons: [
                    .default(Text("Red")) { self.backgroundColor = .red },
                    .default(Text("Green")) { self.backgroundColor = .green },
                    .default(Text("Blue")) { self.backgroundColor = .blue },
                    .cancel()
                ])
            }
    }
}

// struct ContentView: View {
//     @State private var blurAmount: CGFloat = 0 {
//         didSet {
//             print("New Value is \(blurAmount)")
//         }
//     }
//
//     var body: some View {
//         let blur = Binding<CGFloat> (
//             get: {
//                 self.blurAmount
//             },
//             set: {
//                 self.blurAmount = $0
//                 print("New Value is \(self.blurAmount)")
//             }
//         )
//
//         Text("Hello, world!")
//             .blur(radius: blurAmount)
//
//         Slider(value: blur, in: 0...20)
//     }
// }

// struct ContentView: View {
//     @State private var blurAmount: CGFloat = 0 {
//         didSet {
//             print("New Value is \(blurAmount)")
//         }
//         // Won't work, as State creates a struct,
//         // and the actual value changed is wrapped value,
//         // whereas didset will only trigger when
//         // the State struct changes
//     }
//
//     var body: some View {
//         Text("Hello, world!")
//             .blur(radius: blurAmount)
//
//         Slider(value: $blurAmount, in: 0...20)
//     }
// }

