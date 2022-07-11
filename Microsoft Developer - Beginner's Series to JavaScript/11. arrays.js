// Array
// Array is a list or collection of value.
// They can contain many different values of different datatype.

// Index
// An index is a unique numerical value that represents the
// value in the array.

// After an array is created, you can check it's value using
// `arrayName.length`.
// Length will start at 1 and will always be 1 larger than max index.

let length = 5;
let arr1 = [];
let arr2 = Array(length); // Using `Array` object requires length.

// Populating Arrays
// Adding Data During Creation
let arr3 = ["A", true, 2];
console.log(arr3[0]);
console.log(arr3[1]);
// Adding Data after Creation
let arrayLength = 2;
let arr4 = Array(arrayLength);
arr4[0] = "Value at index 0";
console.log("arr4[0] :>> ", arr4[0]);
console.log("arr4[1] :>> ", arr4[1], " (No Value Present at Index)");

// Print Last Element
console.log("arr3[arr3.length - 1] :>>", arr3[arr3.length - 1]);

// Array Methods
let arr = [false, 1, '2']
// Adds Element to the end of the array
arr.push('3')
console.log('arr :>> ', arr);
// Removes Element from the end of the array
console.log('arr.pop() :>> ', arr.pop());
console.log('arr :>> ', arr);
// Removes Element from the start of the array
console.log('arr.shift() :>> ', arr.shift());
console.log('arr :>> ', arr);
// Adds Element to the end of the array
arr.unshift('3')
console.log('arr :>> ', arr);
// Combines two arrays into a new one
console.log('arr.concat(arr1) :>> ', arr.concat(arr1));
