import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'
import { BrowserRouter } from 'react-router-dom'
import { ProductProvider } from './context/productContext.tsx'
import { AppRoutes } from './routes/productRoutes.tsx'

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter>
      <ProductProvider url="https://localhost:3000/products">
        <AppRoutes />
      </ProductProvider>
    </BrowserRouter>
  </React.StrictMode>,
)
