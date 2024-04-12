import { useState, useContext, useEffect } from "react";
import IProduct from "../model/product";
import Rating from "./Rating";
import { ProductContext } from "../context/productContext";
import { useParams } from "react-router-dom";

const ProductsListSearch = () => {
  const { products } = useContext(ProductContext);
  const { q } = useParams()
  const [filterProducts, setFilteredProducts] = useState<IProduct[]>(products);
  const [show, setShow] = useState(false);
  const title = "Products App";

  const showOrHideImage = () => {
    setShow(!show);
  };


  useEffect(() => {
    q ?
      setFilteredProducts(
        products.filter((p) =>
          p.productName
            .toLocaleLowerCase()
            .includes(q.toLocaleLowerCase())
        ))
      : setFilteredProducts(products)
  }, [q])



  return (
    <>
      <div className="card">
        <div className="card-header">{title}</div>
        <div className="card-body">
          <div className="row">
            <div className="col-md-2">Filter by:</div>
            <div className="col-md-4">
              <input type="text" onChange={() => { }} />
            </div>
          </div>
          <div className="row">
            <div className="col-md-6">
              <h4>Searching for: {q}</h4>
            </div>
          </div>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th>
                    <button
                      className="btn btn-primary"
                      onClick={showOrHideImage}
                    >
                      {show ? "Hide " : "Show "} Image
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
                {filterProducts.map((product: IProduct) => (
                  <tr key={product.productId}>
                    <td>
                      <img
                        src={product.imageUrl}
                        title={product.productName}
                        className="avatar"
                        style={{
                          width: 75,
                          margin: 2,
                          display: show ? "block" : "none",
                        }}
                      />
                    </td>
                    <td>
                      <a>{product.productName}</a>
                    </td>
                    <td>{product.productCode}</td>
                    <td>{product.productAvailable}</td>
                    <td>{product.price}</td>
                    {/* <td>{product.starRating}</td> */}

                    {/* State is been passed as props from parent to child , top to bottom */}
                    <td>
                      <Rating rating={product.starRating} />
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </>
  );
};

export default ProductsListSearch;
