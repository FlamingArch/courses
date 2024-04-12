import { Link } from "react-router-dom";
import AppBar from "./components/appbar";
import { useContext } from "react";
import { ProductContext } from "./providers/Products";

type AppScaffoldProps = {
  children: React.ReactNode
}

export default function AppScaffold(props: AppScaffoldProps) {
  const { searchTerm, setSearchTerm } = useContext(ProductContext)

  return (
    <main>
      <AppBar
        title="Products"
        navLinks={[
          <Link className="nav-link active" aria-current="page" to="/">Home</Link>,
          <Link className="nav-link" to="/products">Products</Link>
        ]}
        trailing={
          <form className="d-flex" role="search">
            <input
              className="form-control me-2"
              type="search"
              placeholder="Search"
              aria-label="Search" value={searchTerm}
              onChange={e => setSearchTerm(e.target.value)}
            />
          </form>
        }
      />
      {props.children}
    </main>
  )
}
