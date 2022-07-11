// Functions
// A block of code that executes a routine task using a series of instructions.

Range();
function printThanks() {
  console.log("Thanks for Shopping!");
  console.log("Discounts expire Dec 1!");
}

function computePrice(cost, discount) {
  let reduction = cost * discount;
  let price = cost - reduction;
  return price;
}

function isCountingDown(var1, var2) {
  return var1 - var2 >= 0;
}

printThanks();
console.log("computePrice(100,10) :>> ", computePrice(100, 10));
console.log("isCountingDown(2,1) :>> ", isCountingDown(2, 1));

// Naming
// Use alphabets, numbers, $ and _
// You can get the name of the function using .name (returns anonymous for anonymous functions)

// Parameters
// Placeholders for input values
// Are optional, functions without parameters can exist.
// Argument type/ number are not checked against definitions.
//  Missing values will be set to undefined.

// Arrow Functions (aka Fat Arrow Functions)
// Changes to the `this` context, support implicit return types.
// Must be assigned to a variable or immediately used.
// Implicit Return: Single line functions return statement result

const add = (a, b) => a + b;
console.log(add(1, 2));
const subtract = (a, b) => {
  return a - b;
};
console.log(subtract(2, 1));

// `this` Context
// Inherited from parent scope
// Cannot be changed
// Maintained when the function is passed as a reference
