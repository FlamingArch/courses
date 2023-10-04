import UIKit

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("Bark!")
    }
}

class GermanShephard: Dog {
    override func speak() {
        print("Barks Gloriously after eating 5 children alive!")
    }
}

class Husky: Dog {
    override func speak() {
        print("Barks Annoyingly with constant houling!")
    }
}

class Chihuahua: Dog {
    override func speak() {
        print("Barks in 'Look at me, I am a little shit full of bloodlust'")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

class Persian: Cat {
    let color = "White"
}

class Lion: Cat {
    let color = "Orange"
}
