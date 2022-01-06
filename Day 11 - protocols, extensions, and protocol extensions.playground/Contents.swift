import UIKit


// Protocol
protocol Identifiable {
    var id: String {get set}
}

struct User: Identifiable {
    var  id: String
    
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


// Protocol Inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation { func takeVacation(days:Int) }

protocol Employee: Payable, NeedsTraining, HasVacation { }


// Extensions
extension Int {
    var isEven: Bool {
        return self%2==0
    }
    func square() -> Int {
        return self*self
    }
}
// Extensions may not add new stored properties, only computed properties.

let number = 8
print(number.square())
print(number.isEven)


// Protocol Extensions
// Arrays and sets conform to protocol Collection
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()


// Protocol Oriented Programming
protocol NewIdentifiable {
    var id: String {get set}
    func identify()
}

extension NewIdentifiable {
    func identify() {
        print("My ID is \(id)")
    }
}

struct NewUser: NewIdentifiable {
    var id: String
}

let twostraws = NewUser(id: "twostraws")
twostraws.identify()
