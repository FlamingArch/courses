import express from "express";
import products from "../products.js";

const router = express.Router();

router.get("/api/products", (req, res) => {
  res.json(products);
});

router.post("/api/products", (req, res) => {
  const newProduct = req.body;

  if (!newProduct.productName || !newProduct.price) {
    res.status(400).json({ message: "Product Name and Price is required" });
  }
  products.push(newProduct);
  res.json(products);
});

router.put("/api/products/:id", (req, res) => {
  const id = req.params.id;
  const exists = products.some((product) => product.productId === +id);

  if (exists) {
    const productToBeUpdated = req.body;
    console.log("Payload sent: ", productToBeUpdated);

    products.forEach((product) => {
      if (product.productId == productToBeUpdated.productId) {
        product = Object.assign(product, productToBeUpdated);
        res.json(products);
      }
    });
  }
  res.status(400).json({ msg: `Product ${id} does not exist.` });
});

router.delete("/api/products/:id", (req, res) => {
  const id = req.params.id;
  const exists = products.some((product) => product.productId === +id);

  if (exists) {
    products = products.filter((product) => product.productId !== +id);
    res.json(products);
  } else {
    res.status(400).json({ msg: `Product ${id} does not exist.` });
  }
});

export default router;
