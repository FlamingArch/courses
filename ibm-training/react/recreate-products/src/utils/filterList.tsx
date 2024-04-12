import IProduct from "../models/product";

export default function filterProducts(productsList: IProduct[], searchTerm: string): IProduct[] {
  return searchTerm === ""
    ? productsList
    : productsList.filter(product => product.productName.toLocaleLowerCase().includes(searchTerm.toLocaleLowerCase()))
}
