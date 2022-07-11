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

func travelReturnClosure()->(String)->Void{
    return {
        print("I'm going to \($0)")
    }
}

let result = travelReturnClosure()
result("London")

func getRandomNumber()-> Int {
    Int.random(in: 1...10)
}

func makeRandomGenerator()->()->Int {
    let function = {Int.random(in: 1...10)}
    return function
}

let generator = makeRandomGenerator()
let random1 = generator()
print(random1)

func travelReturnClosureCaptureVariable()->(String)->Void{
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let resultNew = travelReturnClosureCaptureVariable()
resultNew("London")
resultNew("London")
resultNew("London")
