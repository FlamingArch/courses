import UIKit

// Clousures
let driving = {
    print("I'm Driving in my Car")
}
driving()

let driving0 = { (place: String) in
    print("I'm going to place in \(place)")
    
}
driving0("London")

 
let driving1 = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

print(driving1("London"))
// NOTE: When calling closures, parameter labels aren't used.

func travel(action: ()->Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived.")
}

travel(action: driving)

travel() {
    print("I'm getting ready to go")
}

travel {
    print("I'm getting ready to go")
}

