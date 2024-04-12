import products from "./products.mjs";

console.log(products.sort((a, b) => a.price - b.price));
console.log(products.filter((product) => product.price >= 75000));
