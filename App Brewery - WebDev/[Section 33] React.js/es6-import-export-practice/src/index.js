import React from "react";
import ReactDOM from "react-dom";
import { add, subtract, multiply, divide } from "./calculator.js";
// import * as Calculator from "./calculator.js";

ReactDOM.render(
  <ul>
    <li>{add(1, 2)}</li>
    <li>{multiply(2, 3)}</li>
    <li>{subtract(7, 2)}</li>
    <li>{divide(5, 2)}</li>
  </ul>,
  document.getElementById("root")
);

// ReactDOM.render(
//   <ul>
//     <li>{Calculator.add(1, 2)}</li>
//     <li>{Calculator.multiply(2, 3)}</li>
//     <li>{Calculator.subtract(7, 2)}</li>
//     <li>{Calculator.divide(5, 2)}</li>
//   </ul>,
//   document.getElementById("root")
// );
