let outer = function (x) {
  return function (y) {
    return x + y;
  };
};

const addTo5 = outer(5);
console.log(addTo5(8));

console.log(outer(10)(50))
