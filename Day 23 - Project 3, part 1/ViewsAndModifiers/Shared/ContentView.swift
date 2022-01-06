//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 18/05/21.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows) { row in
                
                HStack {
                    ForEach(0..<columns) { column in
                        self.content(row,column)
                    }
                }
                
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
    
}

struct Title: ViewModifier {
    func body(content:Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct TitleFont :ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func titleFont() -> some View {
        self.modifier(TitleFont())
    }
}

struct ContentView: View {
    
    @State private var useRedBg = false
    
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        
        ScrollView {
            VStack(spacing:32) {
                
                Text("Hello World")
                    .titleStyle()
                
                Text("Hello World")
                    .background(Color.red)
                    .frame(width: 200, height: 200)
                
                Text("Hello World")
                    .frame(width: 200, height: 200)
                    .background(Color.red)
                
                Text("Hello, world!")
                    .padding()
                    .background(Color.red)
                    .padding()
                    .background(Color.blue)
                    .padding()
                    .background(Color.yellow)
                    .padding()
                    .background(Color.green)
                
                Button(action: { useRedBg.toggle() }) {
                    Text("Tap Me").padding().foregroundColor(.white)
                }
                .background(useRedBg ? Color.red : Color.blue)
                .animation(.easeIn)
                
                motto1
                    .foregroundColor(.red)
                
                motto2
                    .foregroundColor(.blue)
                
                Color.blue
                    .frame(width: 300, height: 300)
                    .watermarked(with: "Hacking with Swift")
                
                GridStack(rows: 4, columns: 4) { row, col in
                    
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                    
                }
                
                Text("ViewModifier")
                    .titleFont()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

