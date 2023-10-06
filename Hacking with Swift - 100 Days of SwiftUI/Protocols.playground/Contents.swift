import Foundation

// MARK: PROTOCOLS
protocol Vehicle {
    var name: String { get }
    var currentPassangers: Int { get set } // Can't be a let constant
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol CanBeElectric {
    var isElectric: Bool {get}
}

class Car: Vehicle, CanBeElectric {
    let name = "Car"    // Make it var in case it is a computed property
    var currentPassangers = 0
    var isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
    
    func incrementPassangers() {
        currentPassangers += 1
    }
    
    func decrementPassangers() {
        currentPassangers -= 1
    }
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func estimateTime(distance: Double) -> Double {
        distance / 50.0
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Train: Vehicle {
    let name = "Train"
    var currentPassangers = 1
    
    mutating func incrementPassangers() {
        currentPassangers += 1
    }
    
    mutating func decrementPassangers() {
        currentPassangers -= 1
    }
    
    func estimateTime(for distance: Int) -> Int {
        distance / 120
    }
    
    func travel(distance: Int) {
        
        print("I'm riding \(distance)km")
    }
    
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}


func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow, I'll try using a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car(isElectric: true)
commute(distance: 100, using: car)

let train = Train()
commute(distance: 100, using: train)

getTravelEstimates(using: [car, train], distance: 500)

// MARK: OPAQUE RETURN TYPES
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// Int (and Bool) conforms to an Equatable protocol, which allows comparation of values using '==' operator
print(getRandomNumber() == getRandomNumber())

// Exact return type is hidden, but the compiler knows internally what is actually returned, allowing us to change return type later in the code.
// Uses protocols to hide exact type but provide an expectation for supporting a particular operation.
// Eg.: Equatable allows making sure the return type supports comparasion operations, without disclosing the exact return type.
// We can change the Int to Double in getRandomNumber(), and the function will still be valid, as Double implements equatable.
// We don't have to worry about the change afterwards. Even though we don't get all the features of double (eg.: methods)

// MARK: Extensions

var quote = "   The truth is rarely pure and never simple.   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines) // Y so long lol
print(trimmed)

extension String {
    var lines: [String] {
        self.components(separatedBy: .newlines)
    } // Return all lines seperated by line breaks in an array of String
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    } // In-place trimming
}

let newTrimmed = quote.trimmed() // Much better
print(newTrimmed)

var motive = """
Saving People
Hunting Things
The Family Business
"""

print(motive.lines)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
} // Won't disable automatic memberwise-initializer

let harryPotter = Book(title: "Harry Potter", pageCount: 1000)
print(harryPotter.readingHours)

// MARK: Protocol Extensions
let guests = ["Mario", "Luigi", "Peach"]

if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
} // Using Collection instead of Array, we can use the same property also in Dictionaries etc.

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String {get}
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi!, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

//extension Int {
extension Numeric {
    func squared()-> Self {
        self * self
    }
}

let wholeNumber = 5
print(wholeNumber.squared())

// Comparable inherits Equatable, so you don't need to add both
//struct User: Equatable, Comparable {
struct User: Comparable {
    let name: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
}

let user1 = User(name: "Link")
let user2 = User(name: "Zelda")

print(user1 == user2)
print(user1 != user2)
// It compares every proptery to check if 2 users are equal in case of Equatable

//func <(lhs: User, rhs: User) -> Bool {
//   lhs.name < rhs.name
//} // For Comparable Conformance, but its better to have it inside the struct instead of global scope.
print(user1 < user2)
print(user1 <= user2)
print(user1 > user2)
print(user1 >= user2)



