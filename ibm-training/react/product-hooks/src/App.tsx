
import ProductsForm from './components/productForm';
import ProductsList from './components/productsList';

function App() {
  return (
<>
<nav className="navbar navbar-dark bg-primary mb-3">
<div className="container">
<a href="#" className="navbar-brand">Products</a>
</div>
</nav>

<div className="container productsContainer">
    <ProductsForm/>
    
    <ProductsList/>
    </div>

    <footer className="mt-5 p-3 text-center bg-light">
Products @copy;
</footer>
</>
  );
}

export default App;
