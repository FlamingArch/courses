import React, { Component } from "react";

class ErrorBoundary extends Component {
  static getDerivedStateFromError(error) {
    return {
      hasError: true,
    };
  }

  render() {
    return <div>ErrorBoundary</div>;
  }
}

export default ErrorBoundary;
