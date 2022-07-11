//
//  main.swift
//  Protocols Demo
//
//  Created by Harsh Chaturvedi on 22/09/20.
//

protocol CanFly {
    func fly()
}

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale{
            print("The bird makes a new bird in a shell.")
        }
    }

}

class Eagle: Bird, CanFly {
    func fly() {
        print("The Eagle flaps its wings and lifts off into the sky.")
    }
    
    
    
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles through water.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly)
    {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
}

let myEagle = Eagle()
//myEagle.fly()
//myEagle.layEgg()
//myEagle.soar()

let myPenguin = Penguin()
//myPenguin.layEgg()
//myPenguin.swim()
//myPenguin.fly()

let myPlane = Airplane()

let muesum = FlyingMuseum()
muesum.flyingDemo(flyingObject: myPlane)
