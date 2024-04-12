import IProduct from "../model/product"
import { useEffect, useState } from "react"
import { Rating } from "./rating"
import { Link } from "react-router-dom"
import { UseSelector, useDispatch, useSelector } from "react-redux";
import { fetchProducts } from "../redux/productListSlice";
import { AppDispatch, RootState } from "../redux/store";


const ProductsList = () => {
    const { products } = useSelector((state: RootState) => ({
        products: state.products.products //
    }))

    const dispatch = useDispatch<AppDispatch>()

    useEffect(() => {
        dispatch(fetchProducts("")) //this will call te slice fetch products
    }, [])

    const title = "Products App"
    const [show, setShow] = useState(false)
    const [filterKey, setFilterKey] = useState("")

    const filteredProducts = filterKey === "" ? products : products.filter(p => p.productName.includes(filterKey))


    const showOrHideImage = () => {
        setShow(!show)
    }

    return (
        <div className='card'>
            <div className='card-header'>
                {title}
            </div>
            <div className='card-body'>

                <div className='row'>
                    <div className='col-md-6'>
                        <h4>Filtered by: {filterKey}</h4>
                    </div>
                </div>
                <div className='table-responsive'>
                    <table className='table'>
                        <thead>
                            <tr>
                                <th>
                                    <button className='btn btn-primary' onClick={showOrHideImage}>
                                        {show ? 'Hide ' : 'Show '}Image
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

                            {filteredProducts.map((product: IProduct) =>

                                <tr key={product.productId}>
                                    <td>
                                        <img hidden={!show} src={product.imageUrl} title={product.productName} className="avatar" style={{ width: 75, margin: 2 }} />
                                    </td>
                                    <td><Link to={`/products/${product.productId}`}>{product.productName}</Link></td>
                                    <td>{product.productCode}</td>
                                    <td>{product.productAvailable}</td>
                                    <td>{product.price}</td>
                                    <td><Rating rating={product.starRating} /></td>
                                </tr>
                            )
                            }

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    )

}

export default ProductsList
