import UIKit

// Initializers
struct User {
    var username: String
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"

// Moving initializer to extension prevents the default memberwise initializer from going away.
struct Employee {
    var name: String
    var yearsActive = 0
}

extension Employee {
    init() {
        name = "Anonymous"
        print("Creating an Anonymous Employee!")
    }
}

let roslin = Employee(name: "Laura Roslin")
let anon = Employee()


// Reffering to the current instance - self
struct Person {
    var name: String
    init(name:String) {
        print("\(name) was born")
        self.name = name
    }
}
var person = Person(name: "Joe")
print(person.name)


// Lazy Properties
struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}

struct PersonWithFamTree{
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name:String) {
        self.name = name
    }
}
// familyTree will only be created when it is first accessed
var ed = PersonWithFamTree(name: "Ed")
print("---")
ed.familyTree


// Static Properties and Methods
struct Student {
    static var classSize = 0
    var name: String
    init(name:String) {
        self.name = name
        Student.classSize += 1
    }
}
let ed2 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)


// Access Control
struct PersonSocialSecurity {
    private var id: String
    private var password = "password"
    init(socailSecurityNumber id:String) {
        self.id = id
    }
    func identity(password:String) -> String {
        return password == self.password ? id : "Wrong Password"
    }
}
var personSec = PersonSocialSecurity(socailSecurityNumber: "20193012")
print(personSec.identity(password: "password"))
