import filterProductsAsync from "./analytics/search.js";

const main = async () => {
  const data = await filterProductsAsync();
  console.log(data);
};
