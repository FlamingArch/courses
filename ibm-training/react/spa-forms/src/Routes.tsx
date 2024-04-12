import { Route, Routes } from 'react-router-dom'
import AppScaffold from './app'
import PageHome from './routes/home'
import PageProducts from './routes/products'
import ProductDetails from './routes/details'
import PageEdit from './routes/edit'
import { NewProductData } from './types'
import HTTPClient from "./handler"

function AppRoutes() {
  async function handleUpdate(newProductData: NewProductData) {
    await HTTPClient.put(`http://localhost:3000/products/${newProductData.productId}`, newProductData)
  }

  return (
    <AppScaffold>
      <Routes>
        <Route path="/" element={<PageHome />} />
        <Route path="/products" element={<PageProducts />} />
        <Route path="/products/:id" element={<ProductDetails />} />
        <Route path="/products/:id/edit" element={<PageEdit onSave={handleUpdate} />} />
      </Routes>
    </AppScaffold>
  )
}

export default AppRoutes
