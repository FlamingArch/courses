import filterProductsAsync from "./analytics/search";
import { showCategories } from "./service/productCategories";

const main = async () => {
  const data = await filterProductsAsync();
  console.log(data);
};

main();
showCategories(1, "Hardware", "Software");

const prices = [5456.5, 75456.5, 85647.4, 23456.5];

console.log(Math.max(...prices));
console.log(Math.min(...prices));

let [price1, ...price2] = prices;

console.log(`${price1} ${price2}`);

try {
  let [value1, value2] = prices;
} catch (error) {
  console.error(error);
}

let products1 = {
  high: 54432.23,
  low: 2345.23,
  average: 23432.23,
};

let high, low, average;

({ high, low } = { average } = { products1 });
console.log(`${high} ${low} ${average}`);
