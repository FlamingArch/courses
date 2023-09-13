import UIKit

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()


struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation")
            print("Days Remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14) // Can't be a let constant
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

let a = 1
let b = 2.0
print(Double(a) + b)

struct NewEmployee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var newArcher = NewEmployee(name: "Sterling Archer", vacationAllocated: 14)
newArcher.vacationTaken += 4
newArcher.vacationRemaining = 5
print(newArcher.vacationAllocated)

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
    
}

var game = Game()

game.score += 10

struct App {
    var contacts = [String](){
        willSet {
            print("Current value is \(contacts)")
            print("New value will be \(newValue)")
        }
        didSet {
            print("Current value is \(contacts)")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 0..<99)
    }
}

let player = Player(name: "Megan R")    // Memberwise Initializer
print(player.number)

