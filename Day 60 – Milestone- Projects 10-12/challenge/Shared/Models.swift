//
//  User.swift
//  challenge
//
//  Created by Harsh Chaturvedi on 01/11/21.
//

import Foundation

struct User: Decodable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Decodable, Identifiable {
    var id: String
    var name: String
}
