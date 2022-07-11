//
//  Enemy.swift
//  ClassesDemo
//
//  Created by Harsh Chaturvedi on 11/09/20.
//  Copyright © 2020 Harsh Chaturvedi. All rights reserved.
//

class Enemy {
    var health : Int
    var attackStrength : Int
    
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    
    func takeDamage(amount: Int) {
        health = health - amount
    }
    
    func move() {
        print("Walk")
    }
    
    func attack() {
        print("Land a hit, does \(attackStrength) damage.")
    }
}
