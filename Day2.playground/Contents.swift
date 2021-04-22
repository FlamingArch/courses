import UIKit

// Array
let john = "John Lenon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john,paul,george,ringo] // : [String] // Optional Type Annotation

beatles[1]
// beatles[9] // Index Error


// Sets
// 1. Items stored in random order
let colors = Set(["red","green","blue"])
// 2. Items can't repeat and must be unique
let colors2 = Set(["red", "green", "blue","red", "green"])


// Tuples
// 1. Items can't be added or removed.
// 2. Items can be changed, but not their types.
// 3. Items can be accessed by index or by names. Swift won't let you access non-existent items.
var name = (first: "Taylor", last: "Swift")
name.0
name.last
name = (first: "John", last: "Krasinki")
//name = (first: "James", age: 007) // Error


// Dictionary
let height = [
    "Taylor Swift" : 1.78,
    "Ed Sheeran" : 1.73
]  // : [String:Doube] // Optional Type Annotation
height["Taylor Swift"]

// Default Value
// Reading a key that doesn't exist sends back a nil.
let favouriteIceCream = [
    "Paul":"Chocolate",
    "Sophie":"Vanilla"
]
favouriteIceCream["Paul"]
favouriteIceCream["Charlotte"]  // returns nil
favouriteIceCream["Charlotte", default:"Unknown"]
// returns default value "Unknown" instead of nil


// Empty Collections
var teams = [String:String]()
teams["Paul"] = "Red"
// same as
// var teams = Dictionary<String,String>()

var result = [Int]()
// same as
// var result = Array<Int>()

var words = Set<String>()
var numbers = Set<Int>()
// (No special syntax for these)


// Enumerations
let result1 = "failure"
let result2 = "failed"
let result3 = "fail"

// Better way:
enum Result {
    case Success, Failure
}

let result4 = Result.Failure
// Enum Associated Values
enum Activity {
    case bored
    case running(destination:String)
    case talking(topic:String)
    case singing(volume:Int)
}

let talking = Activity.talking(topic: "Football")

enum Planet: Int {
    case Mercury = 1
    case Venus
    case Earth
    case Mars
    case Jupyter
}

let earth = Planet(rawValue: 3)
