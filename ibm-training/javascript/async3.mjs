import products from "./products.mjs";

const filterProductsAsync = (callback) => {
  setTimeout(() => {
    callback(products.filter((p) => p.price >= 75000));
  }, 1000);
};

filterProductsAsync((data) => console.log(data));
console.log("After Timeout");
