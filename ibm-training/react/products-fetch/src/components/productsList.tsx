import { useCallback, useEffect, useState } from "react"
import HTTPClient from "../api/http"
import IProduct from "../model/product"
import Rating from "./rating"

let portNo = 3000
const title = "Products App"

const ProductsList = () => {
    const [products, setProducts] = useState<IProduct[]>([])
    const [filteredProducts, setFilteredProducts] = useState<IProduct[]>(products)
    const [show, setShow] = useState(false)

    const getProducts = useCallback(async () => {
        const data = (await HTTPClient.get(`http://localhost:${portNo}/products`)) as IProduct[]
        setProducts(data)
        setFilteredProducts(data)
    }, [])

    const searchByName = useCallback((e: React.ChangeEvent<HTMLInputElement>) => {
        setFilteredProducts(products.filter(p => p.productName.toLocaleLowerCase().includes(e.target.value)))
    }, [])

    useEffect(() => { getProducts() }, [])

    const showOrHide = () => setShow(show => !show)

    return (
        <div className='card'>
            <div className='card-header'>
                {title}
            </div>
            <div className='card-body'>
                <div className='row'>
                    <div className='col-md-2'>Filter by:</div>
                    <div className='col-md-4'>
                        <input type='text' onChange={searchByName} />
                    </div>
                </div>
                <div className='row'>
                    <div className='col-md-6'>
                        <h4>Filtered by: </h4>
                    </div>
                </div>
                <div className='table-responsive'>
                    <table className='table'>
                        <thead>
                            <tr>
                                <th>
                                    <button className='btn btn-primary' onClick={showOrHide}>
                                        {show ? "Hide" : "Show"} Image
                                    </button>
                                </th>
                                <th>Product</th>
                                <th>Code</th>
                                <th>Available</th>
                                <th>Price</th>
                                <th>5 Star Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            {filteredProducts.map(product =>
                                <tr>
                                    <td>
                                        {show && <img src={product.imageUrl} title={product.productName} className="avatar" style={{ width: 75, margin: 2 }} />}
                                    </td>
                                    <td><a>{product.productName}</a></td>
                                    <td>{product.productCode}</td>
                                    <td>{product.productAvailable}</td>
                                    <td>{product.price}</td>
                                    <td><Rating rating={product.starRating} /></td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    )

}

export default ProductsList
