import { Link } from 'react-router-dom';
import ProductsList from './components/productsList';
import { ChangeEvent, FC, useState } from 'react';
import { useDispatch } from 'react-redux';
import { AppDispatch } from './redux/store';

const App: FC<any> = ({ children }) => {
  const dispatch = useDispatch<AppDispatch>()

  const searchByName = (e: React.FormEvent) => {
    e.preventDefault()
  }

  const [searchKey, setSearchKey] = useState<string>('')
  //const {products,filteredProducts,setFilteredProducts} = useContext(ProductContext)

  const handleChange: any = (event: ChangeEvent) => {
    setSearchKey((event.target as HTMLInputElement).value.toLocaleLowerCase())
  }

  const handleSearch: any = (event: Event) => {
    event.preventDefault()
    // setFilteredProducts(products.filter(p=>p.productName.toLocaleLowerCase().includes(searchKey)))
  }

  return (<>
    <nav className="navbar navbar-expand-lg bg-body-tertiary">
      <div className="container-fluid">
        <a className="navbar-brand" href="#">Navbar</a>
        <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav me-auto mb-2 mb-lg-0">
            <li className="nav-item">
              <Link className="nav-link active" aria-current="page" to="/">Home</Link>
            </li>
            <li className="nav-item">
              <Link className="nav-link" to="/products">ProductsList</Link>
            </li>
          </ul>
          <form className="d-flex" role="search" onSubmit={handleSearch}>
            <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search" value={searchKey} onChange={handleChange} />
            <button className="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>
    <div className='container'>
      {children} {/*to render the routed components*/}
    </div>



    <footer className="mt-5 p-3 text-center bg-light">
      Products @copy;
    </footer>
  </>
  );
}

export default App;
