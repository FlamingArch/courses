import { FC, useCallback, useEffect, useState } from "react"
import { useNavigate, useParams } from "react-router-dom"
import IProduct from "../model/product"
import httpClient from "../apiClient/httpClient"

export const ProductDetails: FC<any> = () => {

    const { id } = useParams<string>()// react hook that will help us to read path parameter... it will give the id

    const [product, setProduct] = useState<IProduct>({} as IProduct) //{} initializing with an empty oject

    const getProductById = useCallback(async () => {
        const response = await httpClient.getById('http://localhost:3000/products', Number(id))
        setProduct(response)

    }, [])

    useEffect(() => {
        getProductById()
    }, [])

    const navigator = useNavigate()

    return (
        <div className="card-body">
            <div className="row">
                <div className="col-md-3">ProductName</div>
                <div className="col-md-6">{product.productName}</div>
            </div>
            <div className="row">
                <div className="col-md-3">Price</div>
                <div className="col-md-6">{product.price}</div>
            </div>
            <div className="row">
                <div className="col-md-3">ProductAvailability</div>
                <div className="col-md-6">{product.productAvailable}</div>
            </div>
            <div className="row">
                <div className="col-md-3">Rating</div>
                <div className="col-md-6">{product.starRating}</div>
            </div>

            <div className="row">
                <div className="col-md-3">
                    <button className="btn btn-info btn-block" onClick={() => navigator('/products')}>Back</button>
                </div>
                <div className="col-md-6">
                    <button className="btn btn-info btn-block" onClick={() => navigator(`/products/${product.productId}/edit`)}>{`Edit ${product.productName}`}</button>
                </div>
            </div>

        </div>
    )
}
