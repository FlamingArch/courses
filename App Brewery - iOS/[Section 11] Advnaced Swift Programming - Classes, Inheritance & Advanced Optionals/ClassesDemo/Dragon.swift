//
//  Dragon.swift
//  ClassesDemo
//
//  Created by Harsh Chaturvedi on 11/09/20.
//  Copyright © 2020 Harsh Chaturvedi. All rights reserved.
//

class Dragon: Enemy {
    var wingSpan = 2
    
    func talk(speech: String) {
        print("Says: \(speech)")
    }
    
    override func move() {
        print("Fly forewards")
    }
    
    override func attack() {
        super.attack()
        print("Breathes fire, does 10 damage.")
    }
}
