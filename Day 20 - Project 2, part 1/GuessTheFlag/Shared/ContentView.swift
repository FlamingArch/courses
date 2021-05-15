//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 15/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        //        NavigationView {
        //            VStack {
        //                HStack {
        //                    Rectangle().foregroundColor(.red)
        //                    Rectangle().foregroundColor(.pink)
        //                    Rectangle().foregroundColor(.purple)
        //                }
        //                HStack {
        //                    Rectangle().foregroundColor(.blue)
        //                    Rectangle().foregroundColor(.green)
        //                    Rectangle().foregroundColor(.yellow)
        //                }
        //                HStack {
        //                    Rectangle().foregroundColor(.orange)
        //                    Rectangle().foregroundColor(.gray)
        //                    Rectangle().foregroundColor(.black)
        //                }
        //            }
        //            .navigationTitle("Sample")
        //        }
        //        ZStack {
        //            Color(red: 1, green: 0.8, blue: 0)
        //                .edgesIgnoringSafeArea(.all)
        //                .frame(width: 200, height: 200, alignment: .center)
        //            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        //            AngularGradient(gradient: Gradient(colors: [Color.red, .yellow, .green,  Color.blue, .purple, .pink]), center: .center)
        //            Text("Your Content")
        //        }
        Button(action: {
            self.showingAlert = true
        }, label: {
            Image(systemName: "pencil")
            Text("Edit")
        }).alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI"), message: Text("This is a detailed message"), dismissButton: .default(Text("OK")))
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView()
//     }
// }
