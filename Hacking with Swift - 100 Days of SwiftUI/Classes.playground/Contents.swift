import Foundation

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I am writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours)hours.")
    }
} // Final class, can inherit but can't be inherited from.

let robert = Developer(hours: 8)
let manager = Manager(hours: 10)

robert.work()
manager.work()

extension Employee {

}

let novall = Developer(hours: 8)
novall.printSummary()

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isConvertible: Bool, isElectric: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaModelX = Car(isConvertible: false, isElectric: true)

class User {
    var username = "Anonymous"
}

// Objects created from classes are reference types.
var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user2.username)
print(user1.username)

// To create a deep copy, create a new instance and copy it across all your data safely.
extension User {
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

let user3 = user1.copy()
user3.username = "Eminem"
print(user3.username)
print(user1.username)

class UserCreation {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = UserCreation(id: i)
    print("User \(user.id): I'm in control")
}

var users = [UserCreation]()

for i in 1...3 {
    let user = UserCreation(id: i)
    print("User \(user.id): I'm in control")
    users.append(user)
}

print("Loop is finished")
users.removeAll()
print("Array is clear")

class UserProperties {
    var name = "Paul"
}

let user = UserProperties()
user.name = "Taylor"
print(user.name)

var user4 = UserProperties()
user4.name = "Taylor"
user4 = UserProperties()
print(user4.name)


