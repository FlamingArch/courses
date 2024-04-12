import products from "../data/products";

const filterProductsAsync = async () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      products
        ? resolve(products.filter((p) => p.price > 75000))
        : reject("No products found");
    }, 1000);
  });
};

export default filterProductsAsync;
