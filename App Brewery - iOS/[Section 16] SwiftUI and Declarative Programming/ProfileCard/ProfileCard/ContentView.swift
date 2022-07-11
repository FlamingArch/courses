//
//  ContentView.swift
//  ProfileCard
//
//  Created by Harsh Chaturvedi on 05/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.67, green: 0.0, blue: 0.0).edgesIgnoringSafeArea(.all)
            VStack {
                Image("harsh")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Harsh Chaturvedi")
                    .padding()
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+91 8953 642 875", imageName: "phone.fill")
                InfoView(text: "harshchaturvedi1002@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11 Pro Max")
    }
}
