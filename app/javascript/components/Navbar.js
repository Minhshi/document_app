import React from "react";
import PropTypes from "prop-types";
import Logo from "./Logo";
import LogoName from "./LogoName";

class Navbar extends React.Component {
  render() {
    return (
      <nav className="navbar navbar-default">
        <div className="container-fluid">
          <div className="navbar-header">
            <a className="navbar-brand" href="#">
              <Logo />
            </a>
             <a className="navbar-brand-name" href="#">
              <LogoName />
            </a>
          </div>
        </div>
      </nav>
    );
  }
}

export default Navbar;
