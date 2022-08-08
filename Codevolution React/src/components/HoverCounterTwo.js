import React, { Component } from "react";

class HoverCounterTwo extends Component {
  render() {
    const { count } = this.props;
    return (
      <div onMouseEnter={this.props.incrementCount}>Hovered {count} times</div>
    );
  }
}

export default HoverCounterTwo;
