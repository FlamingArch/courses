import React from 'react'
import ReactDOM from 'react-dom/client'
import './index.css'
import { BrowserRouter } from 'react-router-dom'
import { Route, Routes } from "react-router-dom";
import App from "./app";
import PageHome from "./app/home";
import PageProducts from "./app/products";

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <BrowserRouter>
      <App>
        <Routes>
          <Route path="/" element={<PageHome />} />
          <Route path="/products" element={<PageProducts />} />
        </Routes>
      </App>
    </BrowserRouter>
  </React.StrictMode>,
)
