import products from "./products.mjs";

const filterProductsAsync = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      products
        ? resolve(products.filter((p) => p.price >= 75000))
        : reject(new Error("Could not fetch products"));
    }, 1000);
  });
};

filterProductsAsync()
  .then((data) => console.log(data))
  .catch((err) => console.error(err));

console.log("After Timeout");
