import React, { Component } from "react";

export class ClickCounterTwo extends Component {
  render() {
    const { count } = this.props;
    return (
      <button onClick={this.props.incrementCount}>Clicked {count} times</button>
    );
  }
}

export default ClickCounterTwo;
