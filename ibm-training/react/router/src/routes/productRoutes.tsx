import { Route, Routes } from "react-router-dom"
import App from "../App"
import ProductsList from "../components/ProductList"
import { Home } from "../components/home"
import ProductsListSearch from "../components/ProductListSearch"

export const AppRoutes: React.FC<any> = (): React.ReactElement => {
  return <App>
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/products" element={<ProductsList />} />
      <Route path="/products/search/:q" element={<ProductsListSearch />} />
      <Route path="/products/:id" element={<ProductsList />} />
      <Route path="/products/:id/edit" element={<ProductsList />} />
    </Routes>
  </App>
}
