//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 25/05/21.
//

import SwiftUI

struct ContentView: View {
    
    var moves = ["Rock", "Paper", "Scissors"]
    
    @State var randomMove = Int.random(in: 0..<3)
    @State var choiceWin = Bool.random()
    
    @State var showingAlert = false
    @State var message = "Tie"
    
    var body: some View {
        VStack {
            Text(choiceWin ? "Win" : "Lose")
                .font(.largeTitle)
            Text(moves[randomMove])
                .font(.title)
                .padding(.bottom, 200)
            HStack(spacing:30) {
                Button(action: {message = choiceWin == (randomMove == 2) ? "Win" : "Lose"; showingAlert=true}){
                    Text("Rock")
                }
                Button(action: {message = choiceWin == (randomMove == 0) ? "Win" : "Lose"; showingAlert=true}){
                    Text("Paper")
                }
                Button(action: {message = choiceWin == (randomMove == 1) ? "Win" : "Lose"; showingAlert=true}){
                    Text("Scissors")
                }
            }
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("You " + message))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
