type Style = string;

let font: String;
// Check type of 'font' using IDE

type Style2 = "bold" | "italic" | 400;

var font2: Style2
font2 = "bold"
// font2 = "underline" // Error

// Consider the following objects:

const person1 = {
    first: "John",
    last: "Doe"
}
const person2 = {
    first: "Jane",
    last: "Doe"
}

// We have to make sure that the objects remain the same shape
// This is not allowed:
const person3 = {
    first: "Jane",
    last: "Doe",
    middle: "K"
}

// We can enforce the shape of an object using interfaces
interface Person {
    first: string
    last: string
}

const person4: Person = {
    first: "Usain",
    last: "Bolt",
}

// const person5: Person = {
//     first: "Danielle",
//     middle: "Rose"
//     last: "Russel",
// }
// ERROR

// For option of additional properties, add a [key:string]:any to the interface:
interface Person2 {
    first: string
    last: string
    [key: string]: any
}