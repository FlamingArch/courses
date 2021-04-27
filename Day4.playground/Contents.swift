import UIKit


// For Loops
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")

for _ in 1...5 {
    print("play")
}


// While Loop
var number = 1

while number <= 20 {
    print(number)
    number+=1
}
print("Ready or not, Here I come!")


// Repeat
var number0 = 1

repeat {
    print(number0)
    number0+=1
} while number0 <= 20


print("Ready or not, Here I come!")

// Similar to while loop, except Runs at least once
repeat {
    print("This is false")
} while false


// Exiting Loops
var countDown = 10
while countDown >= 0 {
    print(countDown)
    if countDown == 4 {
        print("I'm bored, Let's go now")
        break
    }
    countDown-=1
}

// Exiting Multiple Loop
outerloop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        if product==50 {
            print("It's a bull's eye.")
            break outerloop
        }
    }
}

// Labeled Statements
let options = ["up", "down", "left", "right"]
let secretCombination = ["up", "up", "right"]

outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In Loop")
            let attempt = [option1, option2, option3]
            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


// Skipping Items
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}


// Infinite Loops
var counter = 0
while true {
    print(" ")
    counter+=1
    
    if counter == 273 {
        break
    }
}
