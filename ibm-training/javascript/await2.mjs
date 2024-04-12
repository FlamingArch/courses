import products from "./products.mjs";
import { setTimeout } from "timers/promises";

const filterProductsAsync = async () => {
  await setTimeout(1000);
  return products.filter((p) => p.price > 75000);
};

async function main() {
  try {
    const data = await filterProductsAsync();
    console.log(data);
  } catch (err) {}
}
main();

console.log("After Timeout");
