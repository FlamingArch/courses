//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 05/06/21.
//

import SwiftUI
import SSSwiftUIGIFView

struct ContentView: View {
    @State private var tableRange = 6
    
    private var quesPicks = ["5", "10", "20", "All"]
    @State private var noQues = 0
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                //                LinearGradient(gradient: Gradient(colors: [.pink, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                //                    .edgesIgnoringSafeArea(.all)
                Color.secondary.opacity(0.4).edgesIgnoringSafeArea(.all)
                SwiftUIGIFPlayerView(gifName: "source")
                    .frame(width: 200, height: 200, alignment: .center)
                    .padding()
                    .padding(.top, 100)
                
                VStack {
                    Spacer()
                    VStack() {
                        Stepper("Up To: \(tableRange)", value: $tableRange, in: 1...12)
                            .font(.headline)
                            .padding(.bottom)
                        Text("No. of Questions")
                        Picker("No. of Questions", selection: $noQues) {
                            ForEach(quesPicks, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.bottom)
                        Button(action: {
                            // Do Something
                        }) {
                            Text("Start").padding().padding(.leading, 50).padding(.trailing, 50)
                        }
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white))
                        .padding(.bottom, 40)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color.white.opacity(0.8)))
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            .background(
                SwiftUIGIFPlayerView(gifName: "background")
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .scaleEffect(1.6)
                    .blur(radius: 50)
            )
            .navigationTitle(Text("Sup"))
        }
    }
}
