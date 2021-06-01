//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 01/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}

//struct ContentView: View {
//    @State private var animationAmount = 0.0
//    var body: some View {
//        Button("Tap Me") {
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                self.animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(
//            Angle(degrees: animationAmount),
//            axis: (x: 0.0, y: 1.0, z: 0.0)
//        )
//    }
//}

//struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1
//    var body: some View {
//        print(animationAmount)
//
//        return VStack{
//            Stepper("Scale Amount", value: $animationAmount.animation(
//                Animation.easeInOut(duration: 1)
//                    .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            Spacer()
//            Button("Tap Me") {
//                self.animationAmount += 10
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
//    }
//}

//struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1
//    var body: some View {
//        Button("Tap Me"){
//            // Do Nothing
//            self.animationAmount += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .overlay(
//            Circle()
//                .stroke(Color.red)
//                .scaleEffect(animationAmount)
//                .opacity(Double(2 - animationAmount))
//                .animation(
//                    Animation.easeInOut(duration: 1)
//                        .repeatForever(autoreverses: false)
//                )
//        )
//        .onAppear{
//            self.animationAmount = 2
//        }
//    }
//}

//struct ContentView: View {
//    @State private var animationAmount: CGFloat = 1
//    var body: some View {
//        Button("Tap Me"){
//            // Do Nothing
//            self.animationAmount += 1
//        }
//        .padding(50)
//        .background(Color.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(
//            Animation.easeInOut(duration: 1)
//                .delay(0.1)
//                .repeatForever(autoreverses: true)
//        )
//    }
//}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
