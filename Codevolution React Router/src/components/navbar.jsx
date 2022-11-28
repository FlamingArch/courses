import React from "react";
import { Link, NavLink } from "react-router-dom";

export default function Navbar() {
  const navLinkStyles = ({ isActive }) => {
    return {
      opacity: isActive ? 1 : 0.4,
    };
  };

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
    </nav>
  );
}
