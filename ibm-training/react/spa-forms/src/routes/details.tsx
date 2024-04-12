import { useContext, useEffect, useState } from "react"
import { IProduct } from "../types"
import { ProductContext } from "../provider"
import { useNavigate, useParams } from "react-router-dom"

export default function ProductDetails() {
  const { id } = useParams()
  const navigate = useNavigate()
  const [product, setProduct] = useState<IProduct | null | undefined>()
  const { getProductById } = useContext(ProductContext)

  useEffect(() => {
    if (id) {
      const intID = parseInt(id)
      const product = getProductById(intID)
      product ? setProduct(product) : navigate("/")
    } else {
      navigate("/")
    }
  }, [])


  return product && (
    <div className="card-body py-2">
      <div className="row px-4 py-2">
        <div className="col-md-3">ProductName</div>
        <div className="col-md-6">{product.productName}</div>
      </div>
      <div className="row px-4 py-2">
        <div className="col-md-3">Price</div>
        <div className="col-md-6">{product.price}</div>
      </div>
      <div className="row px-4 py-2">
        <div className="col-md-3">ProductAvailability</div>
        <div className="col-md-6">{product.productAvailable}</div>
      </div>
      <div className="row px-4 py-2">
        <div className="col-md-3">Rating</div>
        <div className="col-md-6">{product.starRating}</div>
      </div>
      <div className="px-4 py-2" style={{ display: 'flex', gap: '1rem' }}>
        <button className="btn btn-outline-primary">Back</button>
        <button className="btn btn-primary" onClick={() => navigate(`/products/${product.productId}/edit`)}>{`Edit ${product.productName}`}</button>
      </div>
    </div>
  )
}
