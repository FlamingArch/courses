//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 15/05/21.
//

import SwiftUI


struct FlagView: View {
    
    var countries: [String]
    var number: Int
    
    var body: some View {
        
        Image(self.countries[number]).clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
        
    }
}

struct ContentView: View {
    //    @State private var showingAlert = false
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var extraMessage = "\n"
    @State private var backgroundColor = Color.blue
    
    @State private var animRotationAngle = 0
    // For when the answer is correct... :|
    @State private var animOpacity = 1.0
    // For when the answer is not correct... :/
    @State private var animIncorrectOffset = 1.0
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [backgroundColor, Color.black]),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all).animation(.easeInOut)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button(action: { self.flagTapped(number) }) {
                        FlagView(countries: countries, number: number)
                    }
                    .opacity( number == correctAnswer ? 1 : animOpacity )
                    .rotation3DEffect(
                        number == correctAnswer ?
                            Angle.degrees(Double(animRotationAngle)) :
                            Angle.degrees(0),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .rotationEffect(
                        number != correctAnswer ?
                            .degrees(-(animIncorrectOffset-1) * 25) :
                            .degrees((animIncorrectOffset-1) * 25)
                    )
                    .scaleEffect(
                        number != correctAnswer ?
                            CGFloat(animIncorrectOffset==1.0 ? 1 : 0.7 ) :
                            CGFloat(animIncorrectOffset)
                    )
                }
                Text("Score: \(score)")
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("\(extraMessage)Your Score is \(score)"), dismissButton: .default(Text("Continue"))  {
                animOpacity = 1
                animRotationAngle = 0
                animIncorrectOffset = 1
                backgroundColor = .blue
                self.askQuestion()
            })
        }
        .foregroundColor(.white).animation(.easeIn)
    }
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        extraMessage = number == correctAnswer ? "" : "Wrong! That’s the flag of \(countries[number]).\n"
        if number == correctAnswer {
            animOpacity = 0.25
            animRotationAngle = 360
            score += 100
            backgroundColor = .green
        } else {
            withAnimation(Animation.interpolatingSpring(stiffness: 40, damping: 10).repeatCount(5, autoreverses: true)) {
                animIncorrectOffset = 1.5
                backgroundColor = .red
            }
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//    @State private var showingAlert = false

//var body: some View {
//    NavigationView {
//        VStack {
//            HStack {
//                Rectangle().foregroundColor(.red)
//                Rectangle().foregroundColor(.pink)
//                Rectangle().foregroundColor(.purple)
//            }
//            HStack {
//                Rectangle().foregroundColor(.blue)
//                Rectangle().foregroundColor(.green)
//                Rectangle().foregroundColor(.yellow)
//            }
//            HStack {
//                Rectangle().foregroundColor(.orange)
//                Rectangle().foregroundColor(.gray)
//                Rectangle().foregroundColor(.black)
//            }
//        }
//        .navigationTitle("Sample")
//    }
//    ZStack {
//        Color(red: 1, green: 0.8, blue: 0)
//            .edgesIgnoringSafeArea(.all)
//            .frame(width: 200, height: 200, alignment: .center)
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//        AngularGradient(gradient: Gradient(colors: [Color.red, .yellow, .green,  Color.blue, .purple, .pink]), center: .center)
//        Text("Your Content")
//    }
//    Button(action: {
//        self.showingAlert = true
//    }, label: {
//        Image(systemName: "pencil")
//        Text("Edit")
//    }).alert(isPresented: $showingAlert) {
//        Alert(title: Text("Hello SwiftUI"), message: Text("This is a detailed message"), dismissButton: .default(Text("OK")))
//    }
//}
