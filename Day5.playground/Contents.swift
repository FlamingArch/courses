import UIKit


// Functions

func printHelp() {
    let message = """
Welcome to MyApp!

Run This app inside  a directory of images and
MyApp will resize them all into thumbnails
"""
    print(message)
}

printHelp()


// Accepting Parameters
func square(number: Int) {
    print(number*number)
}

square(number: 8)

// Accepting Parameters
func squareReturn(number: Int) -> Int {
    return number*number
}

print(squareReturn(number: 8))

// In case of a single expression, return statement can be omitted
func doMath() -> Int {
    5+5
}

print(doMath())

func greet(name: String) -> String {
    name == "Taylor Swift" ? "Oh Wow!" : "Hello, \(name)"
}

greet(name: "Taylor Swift")
greet(name: "Paul Hudson")

// Returning multiple values from a function
func getUser() -> [String] {
    ["Taylor", "Swift"]
}

print(getUser()[0])

// Returning multiple values from a function
func getUserTuple() -> (first: String, last: String) {
    (first: "Taylor", last: "Swift")
}

print(getUserTuple().first)


// Parameter Labels
func sayHello(to name: String) {
    print("Hello, \(name)")
}

sayHello(to: "Tim")

func setAge(for person: String, to value: Int) {
    print("\(person) is now \(value)")
}

// Omitting Parameter Labels
func greet0(_ to: String){
    print("Hello, \(to)")
}

greet0("Tim")


// Default Parameters
func greetNicely(_ person: String, nicely:Bool = true) {
    print(nicely ? "Hi, \(person)!" : "Oh No! It's \(person) again" )
}

greetNicely("Paul")
greetNicely("Taylor", nicely: false)


// Variadic Functions
print("Haters", "Gonna", "Hate")

func squareMany(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number*number)")
    }
}

squareMany(numbers: 1,2,3,4,5)


// Throwing Functions
enum PasswordError: Error {
    case obvious
}

func checkPassord(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassord("password")
    print("That password is good")
} catch {
    print("You can't use that password")
}


// inout Parameters
func doubleInPlace(number: inout Int) {
    number *= 2
}

var num = 69
doubleInPlace(number: &num)
print(num)
