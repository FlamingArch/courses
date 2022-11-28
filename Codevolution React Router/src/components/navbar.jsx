import React from "react";
import { Link, NavLink, useNavigate } from "react-router-dom";
import { useAuth } from "./auth";

export default function Navbar() {
  const navLinkStyles = ({ isActive }) => {
    return {
      opacity: isActive ? 1 : 0.4,
    };
  };

  const auth = useAuth();
  const navigate = useNavigate();

  return (
    <nav className="primary-nav">
      {/* <Link to="/">Home</Link>
      <Link to="/about">About</Link> */}
      <NavLink style={navLinkStyles} to="/">
        Home
      </NavLink>
      <NavLink style={navLinkStyles} to="/about">
        About
      </NavLink>
      <NavLink style={navLinkStyles} to="/products">
        Products
      </NavLink>
      <NavLink style={navLinkStyles} to="/users">
        Users
      </NavLink>
      <NavLink style={navLinkStyles} to="/profile">
        Profile
      </NavLink>
      <div className="spacer"></div>
      {!auth.user && <button onClick={() => navigate("/login")}>Login</button>}
    </nav>
  );
}
