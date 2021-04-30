import UIKit

func travel(action: (String)->Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived")
}

travel { (place:String) in
    print("I'm going to \(place) in my car")
}

let changeSpeed = { (speed: Int) in
    print("Changing speed to \(speed)kph")
}


func travelReturn(action: (String)->String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived")
}

travelReturn {
    "I'm going to \($0) in my car."
}

func travelTwoParameters(action: (String,Int)-> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived")
}

travelTwoParameters {
    "I'm going to \($0) at \($1)kmph"
}
