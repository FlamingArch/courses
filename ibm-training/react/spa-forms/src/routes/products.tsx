import { useContext } from "react"
import { ProductContext } from "../provider"
import { ProductsTable, ProductsTableItem } from "../components/table"

export default function PageProducts() {
  const { products, searchTerm } = useContext(ProductContext)

  return (
    <div>
      <header className="p-3">
        <h2>Products</h2>
        <div>
          <h4>{searchTerm ? "Searching for " + searchTerm : "All Products"}</h4></div>
      </header>
      <ProductsTable>
        {products && products.map(product => (<ProductsTableItem key={product.productId} product={product} />))}
      </ProductsTable>
    </div>
  )
}
