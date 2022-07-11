//
//  PostData.swift
//  H4X0R N3WZ
//
//  Created by Harsh Chaturvedi on 08/11/20.
//

import Foundation

struct Results : Codable {
    let hits : [Post]
}

struct Post : Codable, Identifiable {
    var id : String {
        return objectID
    }
    let objectID : String
    let points : Int
    let title : String
    let url : String?
}
