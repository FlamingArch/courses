//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 15/05/21.
//

import SwiftUI

struct ContentView: View {
    //    @State private var showingAlert = false
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var extraMessage = "\n"
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer]).font(.largeTitle).fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        // Flag was tapped
                        self.flagTapped(number)
                    }, label: {
                        Image(self.countries[number]).clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    })
                }
                Text("Score: \(score)")
                Spacer()
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("\(extraMessage)Your Score is \(score)"), dismissButton: .default(Text("Continue"))  {
                self.askQuestion()
            })
        }.foregroundColor(.white)
    }
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        extraMessage = number == correctAnswer ? "" : "Wrong! That’s the flag of \(countries[number]).\n"
        if number == correctAnswer {
            score += 100
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView()
//     }
// }


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
