import UIKit

// Handling Missing Data
var age : Int? = nil
age = 38


// Unwrapping Optionals
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing Name")
}


// Unwrapping with Guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name")
        return
    }
    print("Hello, \(unwrapped)")
}
greet(nil)
greet("Taylor")


// Force Unwrapping
let str = "5"
let num = Int(str)!
print(num)


// Implicitly Unwrapped Optionals
let age_implicit: Int! = nil


// Nil-coalescing
func username(for id: Int) -> String? {
    if id==1{
        return "Taylor Swift"
    } else {return nil}
}

let user = username(for: 15) ?? "Anonymous"


// Optional Chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()


// Optional Try
enum PasswordError: Error { case obvious }
func checkPassword(_ password: String) throws -> Bool {
    if password=="password" { throw PasswordError.obvious }
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch { print("You can't use that password.") }

// In case you know it won't fail, you can use this instead:
try! checkPassword("sekrit")
print("OK!")


// Failable Initializers
let str1 = "5"
let num1 = Int(str)  // Returns an optional, as string my contain non-numerical items which cant be converted to int. This is an failable intializer: an initializer that may work or might not.

// Creating custom one:
// Person struct that must be created using a nine-letter ID string
struct Person {
    var id: String
    init?(id:String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

struct Employee {
    var username: String
    var password: String
    init?(username: String, password: String) {
        guard password.count >= 8 else { return nil }
        guard password.lowercased() != "password" else { return nil }
        
        self.username = username
        self.password = password
    }
}

let tim = Employee(username: "TimC", password: "app1e")         // Returns nil cause password < 8 characters long
let craig = Employee(username: "CraigF", password: "ha1rf0rce0ne")


// Typecasting
class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("Woof")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

class Person1 {
    var name = "Anonymous"
}

class Customer1: Person1 {
    var id = 12345
}

class Employee1: Person1 {
    var salary = 50_000
}

let customer = Customer1()
let employee = Employee1()
let people = [customer, employee]
// Because both Customer and Employee inherit from Person1, Swift will consider that people constant to be a Person1 array. So, if we loop over people we’ll only be able to access the name of each item in the array – or at least we would only be able to do that, if it weren’t for type casting.
for person in people {
    if let customer = person as? Customer1 {
        print("I'm a customer with id \(customer.id)")
    } else if let employee = person as? Employee1 {
        print("I'm an employee, earning \(employee.salary)")
    }
}
