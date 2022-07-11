// CHALLENGE: uncomment the code below and see the car stats rendered
import React from "react";
import ReactDOM from "react-dom";
import data from './practice';

const [honda, tesla] = data
const {topSpeed:hondaTopSpeed,} = honda.speedStats
const {topSpeed:teslaTopSpeed,} = tesla.speedStats
const [hondaTopColour,] = honda.coloursByPopularity
const [teslaTopColour,] = tesla.coloursByPopularity

ReactDOM.render(
  <table>
    <tr>
      <th>Brand</th>
      <th>Top Speed</th>
      <th>Top Color</th>
    </tr>
    <tr>
      <td>{tesla.model}</td>
      <td>{teslaTopSpeed}</td>
      <td>{teslaTopColour}</td>
    </tr>
    <tr>
      <td>{honda.model}</td>
      <td>{hondaTopSpeed}</td>
      <td>{hondaTopColour}</td>
    </tr>
  </table>,
  document.getElementById("root")
);
