//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 26/06/21.
//

import SwiftUI


struct Arrow: Shape {
    
    var lineWidth: CGFloat = 20
    var midPoint: CGFloat?
//    var thickness: CGFloat
    
//    var animatableData: CGFloat {
//        get { inset }
//    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX,               y: midPoint ?? rect.height / 2))
        path.addLine(to: CGPoint(x: rect.midX + lineWidth/2, y: midPoint ?? rect.height/2))
        path.addLine(to: CGPoint(x: rect.midX + lineWidth/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - lineWidth/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - lineWidth/2, y: midPoint ?? rect.height/2))
        path.addLine(to: CGPoint(x: rect.minX,               y: midPoint ?? rect.height / 2))
        path.closeSubpath()

        
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Arrow(lineWidth: 40, midPoint: 100)
            .stroke(Color.red, lineWidth: 10)
//            .cornerRadius(12, antialiased: true)
            .foregroundColor(.blue)
            .frame(width: 100, height: 200)
            .rotationEffect(.degrees(45))
    }
}

//struct Spirograph: Shape {
//    let innerRadius: Int
//    let outerRadius: Int
//    let distance: Int
//    let amount: CGFloat
//
//    func gcd(_ a: Int, _ b: Int) -> Int {
//        var a = a
//        var b = b
//
//        while b != 0 {
//            let temp = b
//            b = a % b
//            a = temp
//        }
//
//        return a
//    }
//
//    func path(in rect: CGRect) -> Path {
//        let divisor = gcd(innerRadius, outerRadius)
//        let outerRadius = CGFloat(self.outerRadius)
//        let innerRadius = CGFloat(self.innerRadius)
//        let distance = CGFloat(self.distance)
//        let difference = innerRadius - outerRadius
//        let endPoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
//
//        var path = Path()
//        for theta in stride(from: 0, through: endPoint, by: 0.01) {
//            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
//            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
//
//            x += rect.width / 2
//            y += rect.height / 2
//
//            if theta == 0 {
//                path.move(to: CGPoint(x: x, y: y))
//            } else {
//                path.addLine(to: CGPoint(x: x, y: y))
//            }
//        }
//
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var innerRadius = 122.0
//    @State private var outerRadius = 81.0
//    @State private var distance = 102.0
//    @State private var amount: CGFloat = 0.0
//    @State private var hue = 0.6
//    var body: some View {
//        VStack {
//            Text("Spirograph").font(.title)
//
//            Spacer()
//
//            Spirograph(
//                innerRadius: Int(innerRadius),
//                outerRadius: Int(outerRadius),
//                distance: Int(distance),
//                amount: amount
//            )
//            .stroke(Color(hue: hue, saturation: 1, brightness: 1))
//            .frame(width: 300, height: 300)
//
//            Spacer()
//
//            Group {
//                Text("Inner radius :\(Int(innerRadius))")
//                Slider(value: $innerRadius, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Outer radius :\(Int(outerRadius))")
//                Slider(value: $outerRadius, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Distance :\(Int(distance))")
//                Slider(value: $distance, in: 10...150, step: 1)
//                    .padding([.horizontal, .bottom])
//
//                Text("Amount :\(amount, specifier: "%.2f")")
//                Slider(value: $amount)
//                    .padding([.horizontal, .bottom])
//
//                Text("Color")
//                Slider(value: $hue)
//                    .padding()
//            }
//        }
//        .onAppear {
//            withAnimation(.easeIn(duration: 1000)) {
//                innerRadius = Double.random(in: 10...150)
//                outerRadius = Double.random(in: 10...150)
//                distance = Double.random(in: 10...150)
//                amount = CGFloat.random(in: 0.0...1.0)
//            }
//        }
//    }
//}

//struct Checkerboard: Shape {
//    var rows: Int
//    var columns: Int
//
//    public var animatableData: AnimatablePair<Double, Double> {
//        get { AnimatablePair(Double(rows), Double(columns)) }
//        set {
//            self.rows = Int(newValue.first)
//            self.columns = Int(newValue.second)
//        }
//    }
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let rowSize = rect.height / CGFloat(rows)
//        let columnSize = rect.width / CGFloat(columns)
//        for row in 0..<rows {
//            for columns in 0..<columns {
//                if(row+columns).isMultiple(of: 2) {
//                    let startX = columnSize * CGFloat(columns)
//                    let startY = rowSize * CGFloat(row)
//
//                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
//                    path.addRect(rect)
//                }
//            }
//        }
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var rows = 4
//    @State private var columns = 4
//
//    var body: some View {
//        Checkerboard(rows: rows, columns: columns).onTapGesture {
//            withAnimation(.linear(duration: 3)) {
//                self.rows = 8
//                self.columns = 16
//            }
//        }
//    }
//}

//struct Trapezoid: Shape {
//    var insetAmount: CGFloat
//    var animatableData: CGFloat {
//        get { insetAmount }
//        set { self.insetAmount = newValue }
//    }
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: 0, y: rect.maxY))
//        path.addLine(to: CGPoint(x:insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
//        return path
//    }
//}
//
//struct ContentView: View {
//    @State private var insetAmount: CGFloat = 50
//
//    var body: some View {
//        Trapezoid(insetAmount: insetAmount)
//            .frame(width: 200, height: 100)
//            .onTapGesture {
//                withAnimation {
//                    self.insetAmount = CGFloat.random(in: 10...90)
//                }
//            }
//    }
//}

//struct ContentView: View {
//    @State private var amount: CGFloat = 0.0
//    var body: some View {
//        VStack {
//            Image("HarshChaturvedi")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .saturation(Double(amount))
//                .blur(radius: (1-amount) * 20)
//                .opacity(Double(amount))
//                .scaleEffect(1 + (1 - amount))
//            Slider(value: $amount)
//                .padding()
//        }.frame(maxWidth:.infinity, maxHeight: .infinity).background(Color.black).edgesIgnoringSafeArea(.all)
//    }
//}

//struct ContentView: View {
//    @State private var amount: CGFloat = 0.0
//    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200*amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200*amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200*amount)
//                    .blendMode(.screen)
//            }.frame(width: 300, height: 300)
//
//            Slider(value: $amount)
//                .padding()
//        }.frame(maxWidth:.infinity, maxHeight: .infinity).background(Color.black).edgesIgnoringSafeArea(.all)
//    }
//}

//struct ContentView: View {
//    @State private var amount: CGFloat = 0.0
//    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 200*amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color.green)
//                    .frame(width: 200*amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//                Circle()
//                    .fill(Color.blue)
//                    .frame(width: 200*amount)
//                    .blendMode(.screen)
//            }.frame(width: 300, height: 300)
//
//            Slider(value: $amount)
//                .padding()
//        }.frame(maxWidth:.infinity, maxHeight: .infinity).background(Color.black).edgesIgnoringSafeArea(.all)
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        Image("HarshChaturvedi")
//            .resizable().scaledToFit()
//            .colorMultiply(.red)
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        ZStack {
//            Image("HarshChaturvedi")
//                .resizable()
//                .scaledToFit()
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
//        }
//        .frame(width: 400, height: 400)
//        .clipped()
//    }
//}

//struct ColorCyclingCircle: View {
//    var amount = 0.0
//    var steps = 100
//    var body: some View {
//        ZStack {
//            ForEach(0..<steps) { value in
//                Circle()
//                    .inset(by: CGFloat(value))
//                    //                    .strokeBorder(self.color(for:value, brightness: 1), lineWidth: 2)
//                    .strokeBorder(
//                        LinearGradient(gradient:
//                                        Gradient(colors: [
//                                            self.color(for: value, brightness: 1),
//                                            self.color(for: value, brightness: 0.5),
//                                        ]), startPoint: .top, endPoint: .bottom)
//                        , lineWidth: 2
//                    )
//                    .drawingGroup()
//            }
//        }
//    }
//    func color(for value: Int, brightness: Double) -> Color {
//        var targetHue = Double(value) / Double(self.steps) + self.amount
//        if targetHue > 1 {
//            targetHue -= 1
//        }
//        return Color(hue: targetHue, saturation: 1, brightness: brightness)
//    }
//}
//
//struct ContentView: View {
//    @State private var colorCycle = 0.0
//    var body: some View {
//        VStack {
//            ColorCyclingCircle(amount: self.colorCycle)
//                .frame(width: 300, height: 300)
//            Slider(value: $colorCycle)
//        }
//    }
//}

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

//struct ContentView: View {
//    var body: some View {
////        Text("Sup")
////            .frame(width: 300, height: 300)
////            .border(
////                ImagePaint(
////                    image: Image("Example"),
////                    sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5),
////                    scale: 0.1
////                ), width: 30
////            )
//        Capsule()
//            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
//            .frame(width: 300, height: 200)
//    }
//}



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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
