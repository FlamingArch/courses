let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

// INSERTING ELEMENTS

// Inserting element at the end
numbers[numbers.length] = 10;
// Or, JS Way:
numbers.push(11);

// Inserting at the first position
// 1. Free position by shifting elements
// 2. Assign value
// Adding method to do so to built-in Array type:
Array.prototype.insertFirstPosition = function (value) {
  for (let i = this.length; i >= 0; i--) {
    this[i] = this[i - 1];
  }
  this[0] = value;
};
numbers.insertFirstPosition(-1);
// Or alternatively, the built-in function:
numbers.unshift(-2);
numbers.unshift(-4, -3);
console.log("numbers :>> ", numbers);

// REMOVING ELEMENTS
// Removing an element from the end of the array
numbers.pop();
console.log("numbers :>> ", numbers);

// Removing an element from the start of the array
for (let i = 0; i < numbers.length; i++) {
  numbers[i] = numbers[i + 1];
}
console.log("numbers :>> ", numbers);