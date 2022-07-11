//DeclaringTheSpreadAndRestOperators.js

function sum() {
  var sum = 0;
  params.forEach((element) => {
    sum += element;
  });
  return sum;
}

let params = [1, 2, 3];

console.log(sum(...params)); //Spread Operator

//Same code written in ES5:
console.log(sum.apply(undefined, params));

//Can also be used as a rest operator
function restParameterFunction(x, y, ...a) {
  return (x + y) * a.length;
}

console.log(restParameterFunction(1, 2, "hello", true, 7));

//Same as:
function restParameterFunctionES5(x, y) {
  var a = Array.prototype.slice.call(arguments, 2);
  return (x + y) * a.length;
}
console.log(restParameterFunctionES5(1, 2, "hello", true, 7));