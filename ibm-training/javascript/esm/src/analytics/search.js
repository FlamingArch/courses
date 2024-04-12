import products from "../data/products";
import { setTimeout } from "timers/promises";

const filterProductsAsync = async () => {
  await setTimeout(1000);
  return products.filter((p) => p.price > 75000);
};

export default firstProductsAsync;
