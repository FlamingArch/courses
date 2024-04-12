import products from "./products.mjs";

console.log(
  products.reduce(
    (acc, curr) => {
      acc.min = Math.min(acc.min, curr.price);
      acc.max = Math.max(acc.max, curr.price);
      return acc;
    },
    { min: Infinity, max: -Infinity }
  )
);
