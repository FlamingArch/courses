//
//  Order.swift
//  Cupcake Corner
//
//  Created by Harsh Chaturvedi on 07/01/22.
//

import SwiftUI

class Order: ObservableObject, Codable {
    @Published var model = OrderModel()
    
    enum CodingKeys: CodingKey {
        case model
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decode(OrderModel.self, forKey: .model)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
    }
    
    struct OrderModel: Codable {
        static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
        
        var type = 0
        var quantity = 3
        
        var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        var extraFrosting = false
        var addSprinkles = false
        
        var name = ""
        var streetAddress = ""
        var city = ""
        var zip = ""
        
        var hasValidAddress: Bool {
            if (!(name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty)) {
                if (name.contains(where: {$0 != " "}) && streetAddress.contains(where: {$0 != " "}) && city.contains(where: {$0 != " "}) && zip.contains(where: {$0 != " "})) {
                    return true
                }
            }
            return false
        }
        
        var cost: Double {
            // $2 Per Cake
            var cost = Double(quantity) * 2
            
            // Complicated cakes cost more
            cost += (Double(type) / 2)
            
            // $1/cake for extra frosting
            if extraFrosting {
                cost += Double(quantity)
            }
            
            // $0.50/cake for sprinkles
            if addSprinkles {
                cost += Double(quantity) / 2
            }
            
            return cost
        
        }
    }
}

//class Order: ObservableObject, Codable {
//    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
//
//    @Published var type = 0
//    @Published var quantity = 3
//
//    @Published var specialRequestEnabled = false {
//        didSet {
//            if specialRequestEnabled == false {
//                extraFrosting = false
//                addSprinkles = false
//            }
//        }
//    }
//    @Published var extraFrosting = false
//    @Published var addSprinkles = false
//
//    @Published var name = ""
//    @Published var streetAddress = ""
//    @Published var city = ""
//    @Published var zip = ""
//
//    var hasValidAddress: Bool {
//        if (!(name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty)) {
//            if (name.contains(where: {$0 != " "}) && streetAddress.contains(where: {$0 != " "}) && city.contains(where: {$0 != " "}) && zip.contains(where: {$0 != " "})) {
//                return true
//            }
//        }
//        return false
//    }
//
//    var cost: Double {
//        // $2 Per Cake
//        var cost = Double(quantity) * 2
//
//        // Complicated cakes cost more
//        cost += (Double(type) / 2)
//
//        // $1/cake for extra frosting
//        if extraFrosting {
//            cost += Double(quantity)
//        }
//
//        // $0.50/cake for sprinkles
//        if addSprinkles {
//            cost += Double(quantity) / 2
//        }
//
//        return cost
//    }
//
//    enum CodingKeys : CodingKey {
//        case type, quantity, specialRequestsEnabled, extraFrosting, addSprinkles, name, streetAddress, city, zip
//    }
//
//    init() {}
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        specialRequestEnabled = try container.decode(Bool.self, forKey: .specialRequestsEnabled)
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(type, forKey: .type)
//        try container.encode(quantity, forKey: .quantity)
//
//        try container.encode(specialRequestEnabled, forKey: .specialRequestsEnabled)
//        try container.encode(extraFrosting, forKey: .extraFrosting)
//        try container.encode(addSprinkles, forKey: .addSprinkles)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(streetAddress, forKey: .streetAddress)
//        try container.encode(city, forKey: .city)
//        try container.encode(zip, forKey: .zip)
//    }
//}
