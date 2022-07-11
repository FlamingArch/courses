// Comparing Values
// ----------------------------------------
// |         COMPARISON OPERATORS         |
// ________________________________________
// | <   :  Less than                     |
// | <=  :  Less than or equal to         |
// | >   :  Greater than                  |
// | >=  :  Greater than or equal to      |
// | ==  :  Equality regardless of type   |
// | === :  Equality with same type       |  * BEST PRACTICE *
// | !=  :  Inequality regardless of type |
// | !== :  Inequality with same type     |  * BEST PRACTICE *
// ----------------------------------------

// Conditional Operations
const status = 200;
if (status === 200) {
  console.log("OK");
} else if (status === 400) {
  console.log("Error!");
} else {
  console.log("Unknown status :>> ");
}
// Same as:
if (status === 200) console.log("OK");
else if (status === 400) console.log("Error!");
else console.log("Unknown status :>> ");

// Ternary (instant)
const message = status === 200 ? "OK" : "Error";

// Implicit False Values:
// STRING: Empty String
// OBJECTS: null or undefined
// Numbers: 0
const x = 0;
if (x) {
  console.log("x contains a value");
}
if (!x) {
  console.log("x does not contains a value");
}

//STRINGS ARE CASE SENSITIVE
var str1 = "Sup";
var str2 = "sup";
console.log(str1 === str2 ? "Same" : "Different");

// Combining Comparisons
// Logical AND (Both sides must be true)
// (x & y)
// (x && y)    * BEST PRACTICE *
// Logical OR (Either side can be true)
// (x | y)
// (x || y)    * BEST PRACTICE *

// Switch (case) Statement
switch (status) {
  case 200:
    console.log("OK!");
    break;    // IMPORTANT TO PREVENT SILENT FALLTHROUGH
  case 400:
  case 500:
    console.log("ERROR");
    break;
  default:
    console.log("Unknown Value");
    break;
}
