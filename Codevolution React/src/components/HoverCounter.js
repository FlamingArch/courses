import React, { Component } from "react";
import withCounter from "./withCounter";

class HoverCounter extends Component {
  render() {
    const { count, incrementCount } = this.props;
    return <div onMouseOver={incrementCount}>Hovered {count} Times</div>;
  }
}

export default withCounter(HoverCounter, 10);
