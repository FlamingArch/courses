const prices = [75456.5, 89564.5, 5, 54345.5, 23456.5, 99678.5];
console.log(prices == typeof Array);
// Push, Pop, Sort...

const comparator = function (a, b) {
  return b - a;
};

// Sort without mutating (Node 20+)
console.log(prices.toSorted());
console.log(prices.toSorted(comparator));
console.log(prices);

console.log(prices.sort(comparator));
console.log(prices);
