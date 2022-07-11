// JS is weakly typed
// Variables are defined in a sudo-dynamic way.
// SIMPLE: Number(both int or float), String, Boolean, Date, Function, Array, Object
// SPECIAL: NaN (Not a Number), null, undefined

// Checking Types:
var num = 69;
console.log("typeof(num) :>> ", typeof num);

// !
var arr = [21, 123, 34, 23, 43, 45];
console.log("typeof(arr) :>> ", typeof arr);

// Types can change
let x = 'something'
x = 1
console.log('typeof(x) :>> ', typeof(x));

x = 1+'hello'
console.log('typeof(x) :>> ', typeof(x));

// Equality Gotchas
let x2 = 0 == ''    // true, Type Coerced
let x3 = 0 === ''   // false, Type Respected

console.log('x2 :>> ', x2);
console.log('x3 :>> ', x3);

const people = ['John', 'Jane']
const one = 1
const str = "Hello, World!"
const b = true
const person = {
    firstName: "Jane",
    lastName: 'Doe'
}
function sayHello(personName) {
    console.log('Hello, ' + personName.firstName);
}

// Checking Types
console.log('TypeOf');
console.log('typeof people :>> ', typeof people);
console.log('typeof one :>> ', typeof one);
console.log('typeof str :>> ', typeof str);
console.log('typeof b :>> ', typeof b);
console.log('typeof person :>> ', typeof person);
console.log('typeof sayHello :>> ', typeof sayHello);

// Checking Instance Against
console.log('InstanceOf');
console.log('people instanceof Array :>> ', people instanceof Array);
console.log('one instanceof Number :>> ', one instanceof Number);
console.log('str instanceof String :>> ', str instanceof String);
console.log('b instanceof Boolean :>> ', b instanceof Boolean);
console.log('person instanceof Object :>> ', person instanceof Object);
console.log('sayHello instanceof Function :>> ', sayHello instanceof Function);

// Creating var from an Instance is different from creating var from a constant.
var number = 3
console.log('number instanceof Number :>> ', number instanceof Number);

var number2 = new Number(3)
console.log('number2 instanceof Number :>> ', number2 instanceof Number);

