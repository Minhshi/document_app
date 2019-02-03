import React from "react";
import PropTypes from "prop-types";

const handleClick = event => {
  event.preventDefault()
  alert('click')
}

class Button extends React.Component {
  render() {
    return (
      <button className="button" onClick={handleClick}>
        {this.props.buttonText}
        <a href="users/sign_in"></a>
      </button>
      )
  }
}

export default Button;
