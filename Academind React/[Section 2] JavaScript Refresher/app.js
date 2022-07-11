// Let and Const
const myName = "Max";
console.log(myName);

// const myName = "Manu"; // Error
// console.log(myName);

// Arrow Functions
const printMyName = (name) => {
  console.log(name);
};
printMyName("Max");

const multiply = (number) => number * 2;
console.log(multiply(2));

// Exports and Imports (Modules)
// import prs from "./person.js"; // Default export, can be named anything
// import { baseData } from "./utility.js"; // Named Exports
// import { clean } from "./utility.js";

// Classes
// ES5
// class Human {
//   constructor() {
//     this.gender = "Male";
//   }
//   printGender() {
//     console.log(this.gender);
//   }
// }

// class Person extends Human {
//   constructor() {
//     super();
//     this.name = "Max";
//   }

//   printMyName() {
//     console.log(this.name);
//   }
// }

// const person = new Person();
// person.printMyName();
// person.printGender();

// ES6
class Human {
  gender = "Male";

  printGender = () => {
    console.log(this.gender);
  };
}

class Person extends Human {
  name = "Max";

  printMyName = () => {
    console.log(this.name);
  };
}

const person = new Person();
person.printMyName();
person.printGender();

// Spread/Rest operator: ...
// Spread: Used to Split up Array Elements OR Object Properties
const oldArray = [3, 4, 5];
const newArray = [...oldArray, 1, 2];
console.log("newArray :>> ", newArray);
// REST: Used to merge a list of function arguments into an array

const oldPerson = {
  name: "Max",
};

const newPerson = {
  ...oldPerson,
  age: 28,
};

console.log("newPerson :>> ", newPerson);
const filter = (...args) => {
  return args.filter((el) => el === 1);
};

console.log(filter(1, 2, 3));

// Destructuring
// Array Destructuring
[a, b] = ["Hello", "Max"];
console.log(a);
console.log(b);
const numbers = [1, 2, 3];
[num1, , num3] = numbers;
console.log(num1, num3);

const { name } = { name: "Max", age: 28 };
console.log(name);
// console.log(age);

// Reference and Primitive Types
// Primitive Type
const number = 1;
const num2 = number; // Real Copy of number

console.log(num2);

// Reference Types
const new_person = {
  name: "Max",
};

const secondPerson = new_person;

const secondRealCopyPerson = {
  ...new_person,
};

new_person.name = "Manu";

console.log(secondPerson);
console.log(secondRealCopyPerson);

// Array Functions
// Map:
const oldDoubleNumArray = [1, 2, 3];
const doubleNumArray = oldDoubleNumArray.map((num) => num * 2);

console.log("oldDoubleNumArray :>> ", oldDoubleNumArray);
console.log("doubleNumArray :>> ", doubleNumArray);
