import { FC, ReactElement, createContext, useEffect, useState, useCallback } from "react"
import { IProduct } from "./types"
import HTTPClient from "./handler"

interface ProductProviderProps {
  children: ReactElement
  url: string
}

export default function filterProducts(productsList: IProduct[], searchTerm: string): IProduct[] {
  return searchTerm === ""
    ? productsList
    : productsList.filter(product => product.productName.toLocaleLowerCase().includes(searchTerm.toLocaleLowerCase()))
}

type ProductContextProps = {
  products: IProduct[],
  url: string,
  searchTerm: string,
  setSearchTerm: React.Dispatch<React.SetStateAction<string>>
  imageVisible: boolean,
  toggleImage: () => void
  getProductById: (id: number) => IProduct | undefined
  fetchProductById: (id: string, completion: (response: IProduct) => void) => void
}

export const ProductContext = createContext<ProductContextProps>({
  products: [] as IProduct[],
  url: '',
  searchTerm: '',
  setSearchTerm: () => { },
  imageVisible: false,
  toggleImage: () => { },
  getProductById: () => { return undefined },
  fetchProductById: () => { return undefined }
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
    const response = await HTTPClient.get('http://localhost:3000/products')
    setProducts(response)
  }, [url])


  const getProductById = (id: number): IProduct | undefined => {
    let product
    products.forEach(p => {
      if (p.productId === id) {
        product = p
      }
    });
    return product
  }

  const fetchProductById = useCallback(async (id: string, completion: (response: IProduct) => void) => {
    const url = `http://localhost:3000/products`
    const response = await HTTPClient.getById(url, id) //converting id to number
    completion(response as IProduct)
  }, [])

  useEffect(() => { getProducts() }, [url])
  useEffect(() => setFilteredProducts(products), [products])
  useEffect(() => setFilteredProducts(filterProducts(products, searchTerm)), [searchTerm])


  const context = { products: filteredProducts, url, searchTerm, setSearchTerm, imageVisible, toggleImage, getProductById, fetchProductById }

  return (
    <ProductContext.Provider value={context}>
      {children}
    </ProductContext.Provider>

  )
}
