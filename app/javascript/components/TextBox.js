import React from "react";
import PropTypes from "prop-types";
import Header  from "./Header";
import Body from "./Body";

class TextBox extends React.Component {
  render() {
    return (
      <div className="text-box-header">
      <Header/>
      <Body/>
      </div>
      )
  }
}

export default TextBox;
