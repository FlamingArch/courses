import UIKit

// Functions
func favouriteAblum(name: String) {
    print("My favourite is \(name)")
}
favouriteAblum(name: "Fearless")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)
printAlbumRelease(name: "Speak Now", year: 2010)
printAlbumRelease(name: "Red", year: 2012)

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letter.")
}
countLetters(in: "Hello")

func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    if name == "Speak Now" { return true }
    if name == "Red" { return true }
    if name == "1989" { return true }
    
    return false
}

if albumIsTaylor(name: "Red") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}

if albumIsTaylor(name: "Blue") {
    print("That's one of hers!")
} else {
    print("Who made that?!")
}


// Optionals
func getHaterStatus(weather: String) -> String? {
    if weather=="Sunny" { return nil }
    return "Hate"
}

var status: String?
status = getHaterStatus(weather: "rainy")

func takeHaterStatus(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let unwrappedStatus = getHaterStatus(weather: "rainy") {
    takeHaterStatus(status: unwrappedStatus)
} else {
    print("Its sunny out here, no hating.")
}

func position(of string: String, in array: [String]) -> Int? {
    for i in 0..<array.count {
        if array[i] == string {
            return i
        }
    }
    return nil
}

var items = ["James", "John", "Sally"]

let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    if name == "Speak Now" { return 2010 }
    if name == "Red" { return 2012 }
    if name == "1989" { return 2014 }
    
    return nil
}

var year = yearAlbumReleased(name: "Red")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}

var name: String! = "Sam"


// Optional Chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased()
print("The album is \(album ?? "None")")


// Enumerations
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}


func getHaterStatusEnum(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
    case .snow:
        return "love"
    }
}

getHaterStatusEnum(weather: .sun)


// Structs
struct Person {
    var clothes: String
    var shoes: String
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "Flip Flops"

print(taylor)
print(taylorCopy)

class PersonClass {
    var cloths: String
    var shoes: String
    init(cloths:String, shoes:String) {
        self.cloths = cloths
        self.shoes = shoes
    }
    
}

class Singer {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func sing() {
        print("LaLaLa")
    }
}

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor.")
    }
}

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    // @objc makes code accessible to Objective C
    @objc override func sing() {
        print("Grrrrr rargh rargh rarrrrgh!")
    }
}

var taylor1 = CountrySinger(name: "Taylor", age: 25)

taylor1.name
taylor1.age
taylor1.sing()
