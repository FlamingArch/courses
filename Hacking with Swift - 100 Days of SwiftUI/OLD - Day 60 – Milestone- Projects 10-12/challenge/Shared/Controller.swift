//
//  Controller.swift
//  challenge
//
//  Created by Harsh Chaturvedi on 01/11/21.
//

import Foundation

class UserController: ObservableObject {
    @Published var users: [User] = []
    
    init() { fetchJSON() }
    
    func fetchJSON() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, res, err in
            DispatchQueue.main.async {
                guard err == nil else { print("Error Fetching Data: \(String(describing: err))"); return }
                if let data = try? JSONDecoder().decode([User].self, from: data!) {
                    self.users = data
                }
            }
        }.resume()
    }
}
