import React from "react";
import { Routes, Route } from "react-router-dom";
import Home from "./components/home";
// import About from "./components/about";
const LazyAbout = React.lazy(() => import("./components/about"));
import Navbar from "./components/navbar";
import Products from "./components/products";
import Featured from "./components/featuredProducts";
import New from "./components/new";
import OrderSummary from "./components/orderSummary";
import NoMatch from "./components/noMatch";
import Users from "./components/users";
import UserDetails from "./components/userDetails";
import Admin from "./components/admin";
import Login from "./components/login";
import ProfilePage from "./components/profile";
import RequireLogin from "./components/requireAuth";
import { AuthProvider } from "./components/auth";

function App() {
  return (
    <AuthProvider>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />}></Route>
        {/* <Route path="/about" element={<About />}></Route> */}
        <Route
          path="/about"
          element={
            <React.Suspense fallback="Loading">
              <LazyAbout />
            </React.Suspense>
          }
        ></Route>
        <Route path="order-summary" element={<OrderSummary />}></Route>
        <Route path="products" element={<Products />}>
          <Route index element={<Featured />} />
          <Route path="featured" element={<Featured />} />
          <Route path="new" element={<New />} />
        </Route>
        <Route path="users" element={<Users />}>
          <Route path=":userId" element={<UserDetails />} />
          <Route path="admin" element={<Admin />} />
        </Route>
        <Route path="login" element={<Login />}></Route>
        <Route
          path="profile"
          element={
            <RequireLogin>
              <ProfilePage />
            </RequireLogin>
          }
        ></Route>
        <Route path="*" element={<NoMatch />}></Route>
      </Routes>
    </AuthProvider>
  );
}

export default App;
