import UIKit

func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetCopy()

let sayHello = {
    print("Hi There!")
}

sayHello()

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

print(sayHello2("Harsh"))

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})

let sorted = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

print(captainFirstTeam)
print(sorted)

let reverseSorted = team.sorted { $0 > $1 }
print(reverseSorted)

let filteredList = team.filter { $0.hasPrefix("T") }
print(filteredList)

let mappedList = team.map { $0.uppercased() }
print(mappedList)

let reducedList = team.reduce("Team") { $0 == "Team" ? "\($0): \($1)" : "\($0), \($1)" }
print(reducedList)

func makeArray(size: Int, using generator: ()-> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}
print(rolls)

func doImportantWork(first: ()->Void, second:()->Void,third: ()->Void) {
    print("About to start first work")
    first()
    
    print("About to second first work")
    second()
    
    print("About to third first work")
    third()
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

