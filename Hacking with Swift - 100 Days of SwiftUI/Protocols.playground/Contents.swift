import Foundation

// PROTOCOLS
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

// OPAQUE RETURN TYPES
func getRandomNumber() -> Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> Equatable {
    Bool.random()
}

// Int (and Bool) conforms to an Equatable protocol, which allows comparation of values using '==' operator
print(getRandomNumber() == getRandomNumber())
