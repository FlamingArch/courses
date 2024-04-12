import HTTPClient from "../handler/http";
import ProductsView from "../view/products";

async function getProducts() {
  const products = await HTTPClient.get(new URL("http://localhost:3000/products"))
  ProductsView.showProducts(products)
}

export default getProducts
