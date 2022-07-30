import React, { Component } from "react";

class LifecycleB extends Component {
  constructor(props) {
    super(props);

    this.state = {
      name: "Vishwas",
    };

    console.log("LifeCycleB constructor");
  }

  static getDerivedStateFromProps(props, state) {
    console.log("LifeCycleB getDerivedStateFromProps");
    return null;
  }

  componentDidMount() {
    console.log("LifeCycleB componentDidMount");
  }

  render() {
    console.log("LifeCycleB render");
    return <div></div>;
  }
}

export default LifecycleB;
