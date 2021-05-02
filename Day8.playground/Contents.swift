import UIKit

// Structs
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn Tennis"

// Computed Properties
struct SportComputedProperties {
    var name:String
    var isOlympicSport: Bool
    var olympicStatus: String {
        return isOlympicSport ? "\(name) is an olympic sport": "\(name) is not an olympic sport"
    }
}

var chessBoxing = SportComputedProperties(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// Property Observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading Data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


// Methods
struct City {
    var population: Int
    func collectTaxes()->Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
print(london.collectTaxes())


// Mutating Methods
struct Person {
    var name : String
    mutating func makeAnonymus() {
        name = "Anonymus"
    }
}

// Properties and Methods of Strings
let string = "Do or Do not, there is no try"
print("Length: \(string.count)")
print("Does it Begin with: \(string.hasPrefix("Do"))")
print("Uppercase: \(string.uppercased())")
print("Sorted: \(string.sorted())")


// Properties and Methods of Arrays
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
print(toys.firstIndex(of: "Buzz"))
print(toys.sorted())
toys.remove(at: 0)
