//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 01/06/21.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var showingRed = false
    
    var body: some View {
        VStack{
            Button("Tap Me") {
                withAnimation {
                    self.showingRed.toggle()
                }
            }
            if showingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}

//struct ContentView: View {
//    @State private var showingRed = false
//
//    var body: some View {
//        VStack{
//            Button("Tap Me") {
//                withAnimation {
//                    self.showingRed.toggle()
//                }
//            }
//            if showingRed {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: 200, height: 200)
////                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
//    }
//}

//struct ContentView: View {
//    @State private var dragOffset = CGSize.zero
//    @State private var switched = false
//    let letters = Array("Bitch Lasagna")
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) {
//                Text(String(letters[$0]))
//                    .padding(8)
//                    .background(switched ? Color.pink : Color.blue)
//                    .offset(dragOffset)
//                    .animation(Animation.default.delay(Double($0) / 20))
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { self.dragOffset = $0.translation }
//                .onEnded { _ in
//                    self.dragOffset = .zero
//                    self.switched.toggle()
//                }
//        )
//    }
//}

//struct ContentView: View {
//    let letters = Array("Hello SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
//    var body: some View {
//        HStack (spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(self.letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(self.enabled ? Color.blue : Color.red)
//                    .offset(self.dragAmount)
//                    .animation(Animation.default.delay(Double(num)/20))
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged {self.dragAmount = $0.translation}
//                .onEnded {_ in
//                    self.dragAmount = .zero
//                    self.enabled.toggle()
//                }
//        )
//    }
//}

//struct ContentView: View {
//    @State private var dragAmount = CGSize.zero
//    @State private var enabled = false
//    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged {self.dragAmount = $0.translation}
//                    .onEnded {_ in
//                        withAnimation(.spring()) {
//                            self.dragAmount = .zero
//                        }
//                    }
//            )
////            .animation(.spring())
//    }
//}


//struct ContentView: View {
//    @State private var enabled = false
//    var body: some View {
//        Button("Tap Me") {
//            self.enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? Color.blue : Color.red)
//        .foregroundColor(.white)
//        .animation(.default)
//        .animation(nil)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
//    }
//}

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
