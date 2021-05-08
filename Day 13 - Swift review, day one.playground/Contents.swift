import UIKit

// Variables and Constants
var name = "Tim McGraw"
name = "Romeo"
//var name = "Romeo"              /// Not Allowed

// Constants
let name_const = "Tim McGraw"
//name_const = "Romeo"            /// Gonna Throw an Error


// Types of Data
// String
var name_type = ""

// Gonna Throw an Error
// var new_name
// new_name = "Tim McGraw"

var new_name: String
new_name = "Tim McGraw"

// Integer
var age: Int
age = 25

// Gonna Throw an Error
// name = 25
// age = "Tim McGraw"

// Double and Float
var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
// Notice Difference in accuracy
latitude = 12231.313313
longitude = -12432.127872
latitude = 122135431231131.123213

// Booleans
var stayOutTooLate: Bool
stayOutTooLate = false

var nothingInBrain: Bool
nothingInBrain = false

var missABeat = false


// Operators
var a = 10
a = a + 1
a = a - 1
a = a * a
a = a / 10
a = a % 3

var b = 10
b += 1
b -= 1
b *= a
b /= 10
b %= 10

var a1 = 1.1
var b1 = 2.2
var c1 = a1 + b1

c1 > 3
c1 >= 3
c1 > 4
c1 < 4

var name1 = "Tim McGraw"
name1 == "Tim McGraw"
name1 != "Tim McGraw"

nothingInBrain
stayOutTooLate


// String Interpolation
var name2 = "Tim McGraw"
"Your name is \(name2)"
"Your name is " + name2         // Not Efficient, only works with string
var age2 = 20
"Your name is \(name2), Your age is \(age2)"
"Your name is \(name2), Your age is \(age2), and in another \(age2) years, you'll be \(age2+age2)."


// Arrays
var eventNumbers = [2,4,6,8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]

songs[0]        // First item is at 0 index
songs[1]
songs[2]
//songs[3]        // Will cause an Error

type(of: songs)

// Heterogeneous arrays need to be marked as such
//var mix = [1,"Sup",21.42]   // Error
var mix: [Any] = [1,"Sup",21.42]
type(of: mix)

// Arrays are not created instantly when intialization
//var songs1: [String]
//songs1[0] = "Shake it off" //Error
var songs1: [String] = []
//songs1[0] = "Shake it off" //Error, we have not created 0th item yet, so we can't modify it/

// Array Operators
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var songs3 = ["Shake it Off", "You Belong with Me", "Love Story"]

var both = songs2 + songs3
both += ["Everything has changed"]


// Dictionaries
// lets you access values based on a key you specify
var person = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]
person[0]
person[3]
// Difficult to remember indexes
var person1 = [
    "first": "Taylor",
    "middle": "Alison",
    "last": "Swift",
    "month": "December",
    "website": "taylorswift.com"
]
person1["middle"]
person1["month"]
person1["birthYear", default: "Not Present"]

person1.keys    // All keys
person1.values  // All values


// Conditional Statements
var action: String
var personToCheck = "hater"
if personToCheck ==  "hater" {
    action = "hate"
} else if personToCheck ==  "player" {
    action = "play"
} else {
    "Cruise"
}

var newAction: String
var stay_Out_Too_Late = true
var nothing_In_Brain = true

if stay_Out_Too_Late && nothing_In_Brain {
    newAction = "cruise"
}

if !stay_Out_Too_Late && !nothing_In_Brain {
    newAction = "cruise again"
}

var stay_out_too_late = true
var nothing_in_brain = true


// Loops
print("Multiplication table of:")
print("1 x 10 is \(1*10)")
print("2 x 10 is \(2*10)")
print("3 x 10 is \(3*10)")
print("4 x 10 is \(4*10)")
print("5 x 10 is \(5*10)")
print("6 x 10 is \(6*10)")
print("7 x 10 is \(7*10)")
print("8 x 10 is \(8*10)")
print("9 x 10 is \(9*10)")
print("10 x 10 is \(10*10)")
// Instead of this, use loops:
print("Using Loop:")
for i in 1...10 {
    print("\(i) x 10 is \(i*10)")
}
// In case you don't need a variable
var str = "Fakers gonna"
for _ in 1...5 {
    print("Fake")
}
// Doesn't assigns to variable, more efficient
// Make sure to use correct range operator
for i in 1..<5 {
    print(i)
}

var taylor_songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]
for i in taylor_songs {
    print("My Favourite Song is \(i)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0...3 {
    print("\(people[i]) gonna \(actions[i])")
}
// or
for i in 0..<people.count {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"

    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }

    print(str)
}

for song in songs {
    if song == "You Belong with Me" {
        continue        // Skips execution after this, and moves on to next iterstion
    }

    print("My favorite song is \(song)")
}

// While Loop
var counter = 0

while true {            // Infinite loop, as condition evaluates to (cause it is) true
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break           // Stops Execution
    }
}


// Switch Case
let live_albums = 2

switch live_albums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}
// Cases Must be Exhaustive
// Swift Cases aren't fallthrough by default. Use `fallthrough` keyword for that.
