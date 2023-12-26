//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Harsh Chaturvedi on 16/12/23.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0...rows, id: \.self) { row  in
                HStack {
                    ForEach(0 ..< columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
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
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State private var useRedText = false
    let colors: [Color] = [.blue, .green, .yellow, .red]
    
    let motto1 = Text("Draco dormiens")
    var motto2: some View { Text("nunquam titillandus") }
    // This doesnot place the text in a ViewBuilder, so you can't return multiple views.
    
    var spells: some View {
        Group {
            // Just sends views as a group of views, and is influenced by where you place this in
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spells2: some View {
        Text("Expellioarmus")
        Text("Crusio")
    }
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Button("Hello, World") {
                    print(type(of: self.body))
                    useRedText.toggle()
                }
                .frame(width: 200, height: 200)
                .background(useRedText ? .red.opacity(0.2) : .blue.opacity(0.2))
                .foregroundStyle(useRedText ? .red : .blue)
                
                Button {
                    print(type(of: self.body))
                } label: {
                    Text("Hello, World!")
                        .padding()
                        .background(.white)
                        .padding()
                        .background(.blue)
                        .padding()
                        .background(.green)
                        .padding()
                        .background(.yellow)
                        .padding()
                        .background(.red)
                }
                
                VStack {
                    Text("Gryffindor")
                    Text("Hufflepuff")
                    Text("Ravenclaw")
                    Text("Slytherin")
                }.font(.title)
                
                VStack {
                    motto1.foregroundStyle(.red)
                    motto2.foregroundStyle(.blue)
                }
                
                spells
                
                spells2
                
                CapsuleText(text: "First")
                    .foregroundStyle(.white)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
                
                Text("Hello, World")
                    .modifier(Title())
                
                Text("Hello, World")
                    .titleStyle()
                
                Color.blue
                    .frame(width: 300, height: 200)
                    .watermarked(with: "Watermark Text")
                
                GridStack(rows: 4, columns: 4) { row, column in
                    Image(systemName: "\(row * 4 + column).circle")
                    CapsuleText(text: "R\(row) C\(column)").foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.opacity(0.10))
    }
}

#Preview {
    ContentView()
}
