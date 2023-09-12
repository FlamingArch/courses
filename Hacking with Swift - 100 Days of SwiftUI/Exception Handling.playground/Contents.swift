import UIKit

enum PasswordError: Error {
case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

// try! checkPassword(string) // Throws error

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

enum SquareRootError: Error {
    case outOfBounds, noSquareRoot
}

func squareRoot(_ number: Int) throws -> Int {
    if number > 10000 || number < 0 {
        throw SquareRootError.outOfBounds
    }
    
    for i in 0...100 {
        if number == (i * i) { return i }
    }
    
    throw SquareRootError.noSquareRoot
}

do {
    let root = try squareRoot(10000)
    print("Square root is \(root)")
} catch SquareRootError.noSquareRoot {
    print("No Square Root Exists")
} catch SquareRootError.outOfBounds {
    print("Input value out of bounds")
} catch {
    print("There was an error: \(error.localizedDescription)")
}
