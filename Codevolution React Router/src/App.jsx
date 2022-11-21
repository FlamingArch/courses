import { Routes, Route } from "react-router-dom";
import Home from "./components/home";
import About from "./components/about";
import Navbar from "./components/navbar";
import OrderSummary from "./components/orderSummary";

function App() {
  return (
    <>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />}></Route>
        <Route path="/about" element={<About />}></Route>
        <Route path="order-summary" element={<OrderSummary />}></Route>
      </Routes>
    </>
  );
}

export default App;
