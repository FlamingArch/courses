import { FC, ReactElement, createContext, useEffect, useState, useCallback } from "react"
import IProduct from "../models/product"
import httpClient from "../handlers/http"
import filterProducts from "../utils/filterList"

interface ProductProviderProps {
  children: ReactElement
  url: string
}

type ProductContextProps = {
  products: IProduct[],
  url: string,
  searchTerm: string,
  setSearchTerm: React.Dispatch<React.SetStateAction<string>>
  imageVisible: boolean,
  toggleImage: () => void
}

export const ProductContext = createContext<ProductContextProps>({
  products: [] as IProduct[],
  url: '',
  searchTerm: '',
  setSearchTerm: () => { },
  imageVisible: false,
  toggleImage: () => { }
})

export const ProductProvider: FC<ProductProviderProps> = ({ children, url }): ReactElement => {
  const [products, setProducts] = useState<IProduct[]>([]);
  const [filteredProducts, setFilteredProducts] = useState<IProduct[]>([])
  const [searchTerm, setSearchTerm] = useState("")
  const [imageVisible, setImageVisible] = useState(true)

  const toggleImage = () => {
    setImageVisible(imageVisible => !imageVisible);
  };

  const getProducts = useCallback(async () => {
    const response = await httpClient.get('http://localhost:3000/products')
    setProducts(response)
  }, [url])

  useEffect(() => { getProducts() }, [url])
  useEffect(() => setFilteredProducts(products), [products])
  useEffect(() => setFilteredProducts(filterProducts(products, searchTerm)), [searchTerm])


  const context = { products: filteredProducts, url, searchTerm, setSearchTerm, imageVisible, toggleImage }

  return (
    <ProductContext.Provider value={context}>
      {children}
    </ProductContext.Provider>

  )
}
