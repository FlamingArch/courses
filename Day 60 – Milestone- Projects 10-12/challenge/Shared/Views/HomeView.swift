//
//  ContentView.swift
//  Shared
//
//  Created by Harsh Chaturvedi on 01/11/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var controller = UserController()
    var body: some View {
        controller.users.count == 0 ? ProgressView() : nil
        NavigationView {
            List{
                ForEach(controller.users) { user in
                    NavigationLink
                    {
                        DetailView(controller: controller, user: user)
                    } label:{
                        VStack(alignment: .leading) {
                            Text(user.name).font(.headline)
                            Text(user.company)
                            Text(user.about).foregroundColor(.secondary).lineLimit(2)
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}


