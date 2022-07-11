//
//  ContentView.swift
//  H4X0R N3WZ
//
//  Created by Harsh Chaturvedi on 08/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List.init(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        VStack {
                            HStack {
                                Text(post.title)
                                Spacer()
                            }
                            HStack {
                                Text("👏 " + String(post.points))
                                    .font(.system(size: 13))
                                    .foregroundColor(Color.primary.opacity(0.64))
                                
                                Spacer()
                            }
                            .padding(.all)
                            
                        }
                    })
                
            }
            .navigationBarTitle("H4X0R N3WZ")
        }
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone SE")
    }
}



