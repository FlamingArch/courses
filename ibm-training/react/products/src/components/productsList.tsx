import products from "../data/products"
import IProduct from "../model/product"
const ProductsList = () =>{

    return (
<div id="products">
        {
            products.map((product:IProduct) => 
                
            
         <div className="card mb-3">
            <div className="card-body">
            <h4 className="card-title">{product.productName}</h4>
            <h4 className="card-title">{product.price}</h4>
            <h3 className="card-title">{product.starRating}</h3>
            <a href="#" className="edit card-link" data-id={product.productId}>
            <i className="fa fa-pencil"></i>
            </a>
            <a href="#" className="delete card-link" data-id={product.productId}>
            <i className="fa fa-remove"></i>
            </a>
            </div>
            </div>
            )
        }
        </div>
    )

}

export default ProductsList