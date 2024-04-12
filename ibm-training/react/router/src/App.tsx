import { Link, useNavigate } from 'react-router-dom';
import './App.css';
import { useState } from 'react';

type AppProps = { children: React.ReactNode }

const App: React.FC<AppProps> = ({ children }) => {
  const [searchTerm, setsearchTerm] = useState("")
  const navigate = useNavigate()

  return (
    <>
      <nav className="navbar navbar-expand-lg bg-body-tertiary" style={{ marginBottom: `2rem` }}>
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
                <Link className="nav-link" to="/products">Products</Link>
              </li>
            </ul>
            <form className="d-flex" role="search">
              <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search" value={searchTerm} onChange={e => setsearchTerm(e.target.value)} />
              <button className="btn btn-outline-success" type="submit" onClick={() => navigate(`/products/search/${searchTerm}`)} >Search</button>
            </form>
          </div>
        </div>
      </nav>

      <div className='container'>
        {children}
      </div>

      <footer className='mt-5 p-3 text-center bg-light'>
        Products @copy;
      </footer>
    </>
  );
}

export default App;
