import React from 'react'
import ReactDOM from 'react-dom/client'
import AppRoutes from './Routes.tsx'
import './index.css'
import { ProductProvider } from './providers/Products.tsx'
import { BrowserRouter } from 'react-router-dom'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter>
      <ProductProvider url='http://localhost:3000/products'>
        <AppRoutes />
      </ProductProvider>
    </BrowserRouter>
  </React.StrictMode>,
)
