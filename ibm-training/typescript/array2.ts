const productsTyped: Array<Listing> = [
  {
    name: "iPhone 15",
    price: 85456.5,
    id: 3,
  },
  {
    name: "OnePlus 12R",
    price: 32456.5,
    id: 1,
  },
  {
    name: "Samsung S24 Ultra",
    price: 1105456.5,
    id: 2,
  },
];

type Listing = {
  name: string
  price: number
  id: number
}

console.log(products.sort((a, b) => a.price - b.price));
