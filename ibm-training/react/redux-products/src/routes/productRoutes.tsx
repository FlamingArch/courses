import { FC, ReactElement } from "react";
import App from "../App"
import { useNavigate, Route, Routes } from "react-router-dom";
import ProductsList from "../components/productsList";
import { Home } from "../components/home";
import { ProductDetails } from "../components/productDetails";
import { ProductEdit } from "../components/productEdit";
import httpClient from "../apiClient/httpClient";
import { NewProductData } from "../components/types";

export const AppRoutes: FC<any> = (): ReactElement => { //reaturs a react element with no props
    const navigate = useNavigate()
    async function handleUpdate(newProductData: NewProductData) {
        await httpClient.put('http://localhost:3000/products', newProductData)
        navigate('/products')
    }
    return (
        <App>
            <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/products" element={<ProductsList />} />
                <Route path="/products/:id" element={<ProductDetails />} />
                <Route path="/products/:id/edit" element={<ProductEdit onSave={handleUpdate} />} />
            </Routes>
        </App>
    )
}
