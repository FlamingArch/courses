import UIKit

// Classes
// 1. Classes do not provide default initializer, and need to be created.
class Dog {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    func makeNoise() {
        print("Woof")
    }
}
let ben = Dog(name: "Ben", breed: "Labrador")
ben.makeNoise()
// 2. Classes allow inheritance and overriding, and can be marked final
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("Yip")
    }
}
let poppy = Poodle(name: "Poppy")
poppy.makeNoise()
// Classes marked final makes them non-inheritable, hence unmodifiable
final class DogFinal {
    let message = "Dogs are best"
}
// Throws Error
// class DogChange: DogFinal {
//     override let message = "Dogs are not the best"
// }

// 3. Classes are reference types, unlike structs, which are value types
// Copied Classes point to the same thing
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var newSinger = singer
newSinger.name = "Justin Beiber"
print(singer.name)

// 4. Classes can have deinitializers
class Person {
    var name = "John Doe"
    init() {
        print("\(name) is alive!")
    }
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// 5. Classes are Mutable, and hence don't need mutating keyword
class Singer2 {
    var name = "Taylor Swift"
}
let taylor = Singer2()      // Defined with let, i.e. constant
taylor.name = "Ed Sheeran"
print(taylor.name)


