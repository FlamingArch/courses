import UIKit

// Properties
struct Person {
    var age: Int = 10
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    var clothes: String {
        willSet {
            updateUI("I'm changing from \(clothes) to \(newValue)")
        }
        didSet {
            updateUI("I just changed from \(oldValue) to \(clothes)")
        }
    }
    var shoes: String
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

func updateUI(_ str: String) {
    print(str)
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

taylor.describe()
other.describe()

taylor.ageInDogYears


// Static Properties
struct TaylorFan {
    static var favoriteSong = "Look what you made me do"
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)


// Access Control
//Public: this means everyone can read and write the property.
//Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.
//File Private: this means that only Swift code in the same file as the type can read and write the property.
//Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.
class TaylorFanNew {
    private var name: String?
}


// Polymorphism and Typecasting
class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots."
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots."
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots."
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
}

for album in allAlbums {
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

// Crashes
// for album in allAlbums {
//     let studioAlbum = album as! StudioAlbum
//     print(studioAlbum.studio)
// }

// Try to convert allAlbums to be an array of LiveAlbum objects, but if that fails just create an empty array of live albums and use that instead” – i.e., do nothing.
for album in allAlbums as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.getPerformance())
    print(album.location)
}

let vw = UIView()

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
