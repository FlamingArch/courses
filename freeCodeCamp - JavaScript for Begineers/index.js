/* 
Datatypes
---------
undefined => Variable is not set, and contains nothing
null => Variable is set, and still contains nothing
boolean => true / false
string => Characters
symbol => Immutable primitive value that is unique
number => Numbers
object => Collection of key-value pairs
*/

var myName = "Beau"; // Global, can be used anywhere
myName = 8;
let ourName = "freeCodeCamp"; // Only used in scope declared
const pi = 3.14; // Cannot be changed once assigned

var a;
var b = 2;
a = 7;
b = a;

console.log("a :>> ", a);
console.log("b :>> ", b);

var a = 5;
var b = 10;
var c = "I am a";

a = a + 1;
b = b + 5;
c = c + " String!";

// Declarations
var studlyCapVar;
var properCamelCase;
var TitleCaseOver;

// Assignments
studlyCapVar = 10;
properCamelCase = "Sup";
TitleCaseOver = false;

var sum = 10 + 10;
var difference = 45 - 12;
var product = 8 * 10;
var quotient = 66 / 33;
var remainder = 11 % 3;

var incrementVar = 87;
incrementVar++;

var decrementVar = 87;
decrementVar--;

var myDecimal = 210.32131;
// Same Operators as whole numbers
var a = 20;
var b = 12;
a += 12;
b -= 9;
a += 10;
b /= 21;
a %= 12;

// String Litrals
var firstName = "Beau";
var myLastName = "Carnes";

//Escape Characters
var myStr0 = 'I am a "double quoted" string inside a double quotes';
console.log("myStr0 :>> ", myStr0);
var myStr1 = 'I am a "double quoted" string inside a single quotes';
var myStr2 = `I am a "double quoted" and 'single quoted' string inside a back-ticked quotes`;
var myStr3 = "I'm a \\ (back-slash) - ed string";

// Concatenating String
var myStr4 = "This is the start, " + "This is the second";
var myStr5 = "This is the first sentence.";
myStr5 += " This is the second sentence.";
console.log("myStr5 :>> ", myStr5);

// String Length
console.log("myStr0.length :>> ", myStr0.length);

// Bracket Notation
console.log("myStr0[0] :>> ", myStr0[0]);
console.log("myStr0[2] :>> ", myStr0[2]);
console.log("myStr0[5] :>> ", myStr0[5]);

// Strings are immutable
var myStrImmutable = "Jello World";
myStrImmutable[0] = "h"; // Wont Work
console.log("myStrImmutable :>> ", myStrImmutable);
myStrImmutable = "Hello World"; // Works
console.log("myStrImmutable :>> ", myStrImmutable);

// Last Letter in the String
console.log("myStr0[myStr0.length-1] :>> ", myStr0[myStr0.length - 1]);

// Mad Lib
function wordBlanks(myNoun, myAdjective, myVerb, myAdverb) {
  var result = "";
  result +=
    "The " +
    myAdjective +
    " " +
    myNoun +
    " " +
    myVerb +
    " to the store " +
    myAdverb;
  return result;
}

console.log(
  'wordBlanks("dog", "big", "ran", "quickly") :>> ',
  wordBlanks("dog", "big", "ran", "quickly")
);
console.log(
  'wordBlanks("bike", "slow", "flew", "slowly") :>> ',
  wordBlanks("bike", "slow", "flew", "slowly")
);

// Arrays
var myArray0 = ["John", 23];
console.log("myArray0 :>> ", myArray0);

var myArrayNested = [
  ["John", 23],
  ["Seth", 32],
];
console.log("myArrayNested :>> ", myArrayNested);

var myArray1 = [23, 12, 56];
console.log("myArray1[1] :>> ", myArray1[1]);

console.log("myArrayNested[1][0] :>> ", myArrayNested[1][0]);

// Append Data to Array

// Push element to last position
myArray1.push(67);
console.log("myArray1 :>> ", myArray1);

// Pop element at last position
var removedLast = myArray1.pop();
console.log("removedLast :>> ", removedLast);

// Push element to first position
myArray1.unshift("Unknown");

// Pop element at first position
var removedFirst = myArray1.shift();
console.log("removedFirst :>> ", removedFirst);

// Functions
function reusableFunction() {
  console.log('reusableFunction() : "Hello World"');
}

reusableFunction();
reusableFunction();
reusableFunction();

function substract(a, b) {
  console.log(`subtract(a:${a},b:${b}) : a - b :>> `, a - b);
}

substract(10, 5);

// Note: New variables not used with var, const or let are automatically declared in global scope
function sample() {
  improperDeclaredVar = 20;
}
sample();
console.log("improperDeclaredVar :>> ", improperDeclaredVar);

// Scoping
function myLocalScope() {
  var myVarInsideMyLocalScope = 5;
  console.log(
    "myLocalScope() : myVarInsideMyLocalScope :>> ",
    myVarInsideMyLocalScope
  );
}
myLocalScope();
// console.log("myVarInsideMyLocalScope :>> ", myVarInsideMyLocalScope); // Undefined Error

var outerWear = "TShirt";

function myOutFit1() {
  return outerWear;
}
console.log("myOutFit1() :>> ", myOutFit1());

function myOutFit2() {
  var outerWear = "Sweater";
  return outerWear;
}
console.log("myOutFit2() :>> ", myOutFit2());

// Queue
function nextInLine(arr, item) {
  arr.push(item);
  return arr.shift();
}

var testArr = [1, 2, 3, 4, 5];
console.log('"Before"\ntestArr :>> ', JSON.stringify(testArr));
console.log("nextInLine(testArr, 6) :>> ", nextInLine(testArr, 6));
console.log('"After"\ntestArr :>> ', JSON.stringify(testArr));

// Conditional Operation
var isItTrue = Math.random > 0.5; // Randomly Assign True or False

if (isItTrue) {
  console.log("Yes, it is true");
} else {
  console.log("No, it is not true");
}

var ten = 10;
if (ten === 10) {
  console.log("Yes, it is 10");
} else if (ten < 10) {
  console.log("No, it is greater than 10");
} else {
  console.log("No, it is less than 10");
}

// Equality vs Strict Equality
console.log("5 == 5 :>> ", 5 == 5);
console.log("5 === 5 :>> ", 5 === 5);

console.log('10 == "10" :>> ', 10 == "10");
console.log('10 === "10" :>> ', 10 === "10");

// Inequality vs Strict Inequality
console.log('"5" != 5 :>> ', "5" == 5);
console.log('"5" !== 5 :>> ', "5" !== 5);

// Lesser Than and Inclusive Lesser Than
console.log("5 < 5 :>> ", 5 < 5);
console.log("5 <= :>> ", 5 <= 5);

// Greater Than and Inclusive Greater Than
console.log("5 < 5 :>> ", 5 > 5);
console.log("5 <= :>> ", 5 >= 5);

// Logical AND
console.log("5 < 10 && 5 > 2 :>> ", 5 < 10 && 5 > 2);

// Logical OR
console.log("5 < 10 || 5 < 2 :>> ", 5 < 10 || 5 < 2);

// Switch Statements
var switchVar = 2;

switch (switchVar) {
  case 1:
    console.log("Alpha");
    break;
  case 2:
    console.log("Beta");
    break;
  case 3:
    console.log("Gamma");
  default:
    console.log("Theta");
    break;
}

var marks = 8;

switch (marks) {
  case 1:
    console.log("Why?");
  case 2:
    console.log("What Are You Doing?");
  case 3:
    console.log("Fail");
    break;
  case 4:
  case 5:
  case 6:
    console.log("Passed, Needs Improvement");
    break;
  case 7:
  case 8:
    console.log("Passed");
    break;
  case 9:
  case 10:
    console.log("Passed, Merit");
    break;
  default:
    break;
}

// Objects
var ourDog = {
  name: "Camper",
  legs: 4,
  tails: 4,
  friends: ["everything!"],
  bark: "Woof",
};

var myDog = {
  name: "Quincy",
  legs: 3,
  tails: 2,
  friends: [],
};

ourDog.name = "Happy Camper";

var testObj = {
  "en entree": "hamburger",
  "my side": "veggies",
  "the drink": "water",
};

var entreeValue = testObj["en entree"];
var drinkValue = testObj["the drink"];

// Testing object for properties
console.log("myDog.hasOwnProperty('name') :>> ", myDog.hasOwnProperty("name"));
console.log(
  "myDog.hasOwnProperty('hello') :>> ",
  myDog.hasOwnProperty("hello")
);

delete ourDog.bark;

var myMusic = [
  {
    artist: "Billy Joel",
    title: "Piano Man",
    release_year: 1973,
    formats: ["CD", "8T", "LP"],
    gold: true,
  },
  {
    artist: "Beau Carnes",
    title: "Cereal Man",
    release_year: 2003,
    formats: ["YouTube video"],
  },
];

console.log("myMusic[0]['formats'][2] :>> ", myMusic[0]["formats"][2]);

var myArray = [];
for (let i = 0; i < 5; i++) {
  myArray.push(i);
}
console.log("JSON.stringify(myArray) :>> ", JSON.stringify(myArray));

var ourArray = [];
let i = 0;
while (i < 5) {
  ourArray.push(i);
  i++;
}

console.log("JSON.stringify(ourArray) :>> ", JSON.stringify(ourArray));

// Random Decimal Number
console.log("Math.random() :>> ", Math.random());

// Random Whole Number B/W 10 && 20
var rand = 10 + Math.floor(Math.random() * 10);
console.log("rand :>> ", rand);

// Convert Integer into String
var noFromString = parseInt("69");
console.log("noFromString :>> ", noFromString);

// Convert from Radix of 2 to Int (Binary)
var noFromBinary = parseInt("1001101", 2);
console.log("noFromBinary :>> ", noFromBinary);

// Ternary Operator
let marksObtained = 69;
let passed = marksObtained > 40 ? true : false;
let grade =
  marksObtained > 90
    ? "A"
    : marksObtained > 80
    ? "B"
    : marksObtained > 70
    ? "C"
    : marksObtained > 60
    ? "D"
    : "E";

console.log("==============");
console.log("____RESULT____");
console.log("passed :>> ", passed);
console.log("grade :>> ", grade);
console.log("==============");

// var Keyword = Lets you declare variable twice
var varVariable = 2;
var varVariable = 4;

// let Keyword = Doesn't let you declare the variable twice
let letVariable = 2;
// let letVariable = 4 // Throws Error
// "use strict"; // Strict Checking

// const Keyword = Declares variable that cannot be changed
const constVariable = 3.14151965;
// constVariable = 21;   // Throws Error

// Objects marked constant can still be changed
const arr = [1, 2, 3, 4, 6];
arr[4] = 5;
console.log("arr :>> ", JSON.stringify(arr));

// They can be frozen to prevent modifications
("use strict");
Object.freeze(arr);

try {
  arr[4] = 69;
  console.log("arr :>> ", JSON.stringify(arr));
} catch (error) {
  console.log("error :>> ", error);
}

// Arrow Function
const printPi = (a, b) => {
  console.log(a + b);
  console.log("Pi :>> ", 3.14151965);
  return 3.14151965;
};
printPi(2, 3);

var realNumberArray = [4, 5.6, 32, 3.45, 434.21, 420.69, 666];
console.log("realNumberArray :>> ", JSON.stringify(realNumberArray));
const squaredPositiveIntegers = realNumberArray
  .filter((num) => Number.isInteger(num) && num > 0)
  .map((val) => val * val);
console.log(
  "squaredPositiveIntegers :>> ",
  JSON.stringify(squaredPositiveIntegers)
);

var increment = (num, by = 1) => num + by;

// Rest Operator
var sum = (function () {
  return function sum(...args) {
    return args.reduce((a, b) => a + b, 0);
  };
})();

console.log("sum(1,2,3,4) :>> ", sum(1, 2, 3, 4));

// Spread Operator
// const arr1 = ["JAN", "FEB", "MAR", "APR", "MAY"];
// let arr2;
// (function () {
//   arr2 = arr1;
//   arr1[0] = "potato";
// })();
// console.log("arr2 :>> ", JSON.stringify(arr2));

// Instead of this, use the Spread Operator `[...arr]`
const arr1 = ["JAN", "FEB", "MAR", "APR", "MAY"];
let arr2;
(function () {
  arr2 = [...arr1];
  arr1[0] = "potato";
})();
console.log("arr2 :>> ", JSON.stringify(arr2));

// Destructuring Assignment
// var voxel = { x: 32, y: 36.3, y: 56.32 };

// Old way
// var x = voxel.x;
// var y = voxel.y;
// var z = voxel.z;

// New Way
const { x: a, y: b, z: c } = voxel;

const AVG_TEMPERATURES = {
  today: 77.5,
  tommorow: 79,
};

function getTempOfTmrw(avgTemperatures) {
  const { tommorow: tempOfTommorow } = avgTemperatures;
  return tempOfTommorow;
}

console.log(
  "getTempOfTmrw(AVG_TEMPERATURES) :>> ",
  getTempOfTmrw(AVG_TEMPERATURES)
);

let a = 10;
let b = 20;
[a, b] = [b, a];

var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var [, , ...firstTwoRemoved] = list;
console.log("firstTwoRemoved :>> ", firstTwoRemoved);

const stats = {
  max: 32.42,
  standard_deviation: 43.567,
  median: 32.5432,
  mode: 12.3423,
  min: 12.433232,
  average: 21.2121,
};

const half = (function () {
  return function half({ max, min }) {
    return (max + min) / 2.0;
  };
})();

const person = {
  name: "Zodiac Hasbro",
  age: 56,
};
// Template Literal
console.log(`Hello, my name is ${person.name}!
I am ${person.age} years old.`);

// Objects
// Old Way:
// var SpaceShuttle = function (targetPlanet) {
//   this.targetPlanet = targetPlanet;
// };
// var zeus = new SpaceShuttle("Jupiter");
// console.log("zeus.targerPlanet :>> ", zeus.targetPlanet);

// New Way:
class SpaceShuttle {
  constructor(targetPlanet) {
    this.targetPlanet = targetPlanet;
  }
}

var zeus = new SpaceShuttle("Jupiter");
console.log("zeus.targerPlanet :>> ", zeus.targetPlanet);

// Getter and Setter
class Book {
  constructor(author) {
    this._author = author;
  }
  get writer() {
    return this._author;
  }
  set writer(updatedAuthor) {
    this._author = updatedAuthor;
  }
}

var book = new Book("Bitch");

// Import Functions
import { capitalizeString } from "./capitaliseLib.js";
console.log('capitalizeString("Sup") :>> ', capitalizeString("Sup"));

// Import Everything
// import * as someName from "./capitaliseLib.js";

// Import Default Export
// import subtract from "./defaultExport";
