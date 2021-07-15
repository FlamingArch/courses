//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 26/06/21.
//

import SwiftUI

//struct ColorCyclingView: View {
//    var amount = 0.0
//    var steps = 100
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
//                Circle()
//                    .inset(by: CGFloat(value))
//                    .strokeBorder(self.color(for: value, brightness: 1))
//            }
//        }
//    }
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(self.steps) + self.amount
//
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}
//
//struct ContentView: View {
//    @State private var showingActivity = false
//    var body: some View {
//        Text("Sup")
//    }
//}

struct ContentView: View {
    var body: some View {
//        Text("Sup")
//            .frame(width: 300, height: 300)
//            .border(
//                ImagePaint(
//                    image: Image("Example"),
//                    sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5),
//                    scale: 0.1
//                ), width: 30
//            )
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}



//struct Flower: Shape {
//    var petalOffset: Double = -20
//    var petalWidth: Double = 100
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8) {
//            let rotation = CGAffineTransform(rotationAngle: number)
//            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
//            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width/2))
//            let rotatedPetal = originalPetal.applying(position)
//            path.addPath(rotatedPetal)
//        }
//        return path
//    }
//}
//
//struct ContentView2: View {
//    @State private var petalOffset = -20.0
//    @State private var petalWidth = 100.0
//    var body: some View {
//        VStack {
//            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
//                .stroke(Color.red, lineWidth: 1)
//            Text("Offset")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding([.horizontal, .bottom])
//            Text("Widt∫h")
//            Slider(value: $petalWidth, in: 0...100)
//                .padding(.horizontal)
//        }
//    }
//}
//
//
//struct Triangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//        return path
//    }
//}
//
//struct Arc: InsettableShape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool
//    var insetAmount: CGFloat = 0
//
//    func inset(by amount: CGFloat) -> some InsettableShape {
//        var arc = self
//        arc.insetAmount += amount
//        return arc
//    }
//
//    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
//        let modifiedStart = startAngle - rotationAdjustment
//        let modifiedEnd = endAngle - rotationAdjustment
//
//        var path = Path()
//
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//        return path
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//            .strokeBorder(Color.blue, lineWidth: 40)
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//            .stroke(Color.blue, lineWidth: 10)
//            .frame(width: 300, height: 300)
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        Triangle()
//            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .frame(width: 300, height: 300)
//    }
//}
//
//
//struct ContentView: View {
//    var body: some View {
//        Path { path in
//            path.move(to: CGPoint(x:200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//
//        }
//        .stroke(Color.blue.opacity(0.10),style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
