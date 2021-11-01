//
//  DetailView.swift
//  challenge
//
//  Created by Harsh Chaturvedi on 01/11/21.
//

import SwiftUI
import WrappingStack

struct DetailView: View {
    var controller: UserController
    var user: User
    var body: some View {
        List {
            Section {
                VStack {
                    Text(user.name).font(.largeTitle)
                    if user.isActive {
                        ActiveBadge()
                    }
                    Text(user.id).foregroundColor(.secondary).lineLimit(1)
                }
            }
            
            Section {
                Text(user.about)
            } header: {
                Text("About")
            }
            
            Section {
                ForEach(user.friends) { friend in
                    if let friendObject = controller.users.first(where: { user in
                        user.id == friend.id
                    }) {
                        NavigationLink {
                            DetailView(controller: controller, user:friendObject)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(friend.name)
                                Text(friendObject.about).lineLimit(1).foregroundColor(.secondary)
                            }
                        }
                    }
                }
            } header: {
                Text("Friends")
            }
            
            Section {
                _ListItem(text1: "Company", text2: user.company)
                _ListItem(text1: "Age", text2: "\(user.age)")
                _ListItem(text1: "Email", text2: user.email)
                _ListItem(text1: "Address", text2: user.address)
                _ListItem(text1: "Registered", text2: user.registered)
            } header: {
                Text("Details")
            }
            
            Section {
                WrappingHStack (id: \.self, alignment: .leading) {
                    ForEach(user.tags, id: \.self) {
                        Text($0)
                            .padding(10)
                            .background(Color.blue)
                            .cornerRadius(25.0)
                            .padding(5)
                    }
                }
            } header: {
                Text("Tags")
            }
            
        }
    }
}

struct _ListItem : View {
    var text1: String
    var text2: String
    var body: some View {
        
        HStack(alignment: .top) {
            Text(text1)
            Spacer()
            Text(text2).foregroundColor(.secondary).multilineTextAlignment(.trailing)
        }
    }
}
