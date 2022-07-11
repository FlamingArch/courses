//EnhancedObjectProperties.js

// Array Destructuring
let [x, y] = ["a", "b"];

// Same as:
// let x = "a";
// let y = "b";

// Swap values:
[x, y] = [y, x];

// Same as:
// var temp = x;
// x = y;
// y = temp;

// Property Short Hand
let [x1, y1] = ["a", "b"];
let obj = { x1, y1 };
console.log(obj);

// Same as
// var x = "a";
// var y = "b";
// var obj2 = { x: x, y: y };
// console.log(obj2);

const hello = {
  name: "abcdef",
  printHello() {
    console.log("Hello");
  },
};
console.log(hello.printHello());

//Same as:
// var hello = {
//   name: "abcdef",
//   printHello: function printHello() {
//     console.log("Hello");
//   },
// };
// console.log(hello.printHello());
