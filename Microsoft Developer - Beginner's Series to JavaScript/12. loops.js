// Loops
// Execute code multiple times based on:
// - Hard Coded Value
// - While Something is true
// - Iterate through a list
// Common loop types:
// - `while`
// - `for`
// - `for ... of`

const names = ["John", "Jane", "Ken"];

// `while` Loop
console.log("WHILE LOOP");
var index = 0;
while (index < names.length) {
  console.log("names[index] :>> ", names[index]);
  index++;
}

// `for` Loop
console.log("FOR LOOP");
for (index = 0; index < names.length; index++) {
  console.log("names[index] :>> ", names[index]);
}

// `for ... of` Loop
console.log("FOR ... EACH LOOP");
for (let name of names) {
  console.log("name :>> ", name);
}
