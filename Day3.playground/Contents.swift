import UIKit

// Arithmetic Operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore


// Precision Error
// let value: Double = 90000000000000001   // (Read Warning from Xcode)
// let value: Int = 90000000000000001      // (Int doesn't have this issue, as it can store large enough numbers)

let isMultiple = firstScore.isMultiple(of: secondScore)


// Operator Overloading
let meaningOfLife = 42
let doubleMeaning = meaningOfLife + 42     // Add in case of int

let fakers = "Fakers gonna "
let action = fakers + "fake"               // Concatenate in case of string

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf       // Combine in case of array


// Compound Assignment Operators
var score = 95
score += 95

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"


// Comparation Operators
let firstScore1 = 6
let secondScore1 = 4

firstScore1 == secondScore1
firstScore1 != secondScore1

firstScore < secondScore
firstScore <= secondScore
firstScore > secondScore
firstScore >= secondScore

"Taylor" <= "Swift"


// Conditions
let firstCard = 11
let secondCard = 19

if firstCard + secondCard == 2 {
    print("Aces - Lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// Combining Operators
let age1 = 12
let age2 = 21
if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}

// Ternary Operator
let firstCardTO = 11
let secondCardTO = 10

print(firstCardTO==secondCardTO ? "Cards are the same" : "Cards are different")


// Switch Statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}


// Range Operators
1...5
1..<5

let score1 = 85

switch score1 {
case 0..<50:
    print("You failed badly")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!.")
}

let names = ["Piper", "Alex", "Suzanne", "Gloria"]
print(names[0...2])
print(names[..<2])
print(names[1...])
print(names[...])
print(names)
