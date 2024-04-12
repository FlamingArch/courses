import { FC, ReactElement, createContext, useEffect, useState, useCallback } from "react"
import IProduct from "../model/product"
import httpClient from "../apiClient/httpClient"

interface Product_Context {
    products: IProduct[]
    url: string
}
interface Props {
    children: ReactElement
    url: string
}

export const ProductContext = createContext<Product_Context>({
    products: [],
    url: ''
})

export const ProductProvider: FC<Props> = ({ children, url }): ReactElement => {//FC=functional component
    // we r providing a ProductProvider which is of type functional component (FC)
    // and we r destructuring the array and returning a react element
    const [products, setProducts] = useState<IProduct[]>([]);

    const [filteredProducts, setFilteredProducts] = useState<IProduct[]>(products)
    const getProducts = useCallback(async () => {
        // Unnecessary rendering of components get minimized.
        const response = await httpClient.get('http://localhost:3000/products')
        setProducts(response)
        setFilteredProducts(response)
    }, [url])

    useEffect(() => {
        getProducts();
    }, [url, products])
    const context = { //object literal extension is used here. we have same values for key-value pair
        products,     // if key == value, then we dont need products:products
        url           // if key == value, then we dont need url: url
    }
    return (
        <ProductContext.Provider value={context}>
            {children}
        </ProductContext.Provider>

    )
}
