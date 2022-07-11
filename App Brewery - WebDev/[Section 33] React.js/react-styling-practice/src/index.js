// Create a React App from scratch.
// Show a single h1 that says "Good Morning" if between midnight and 12PM.
// or "Good Afternoon if between 12PM and 6PM".
// or "Good Evening" if between 6PM and midnight.
// Apply the heading style in styles.css
// Dynamically change the color of the h1 using inline css styles.
// Morning = red, Afternoon = green, Night = blue

import React from "react";
import ReactDOM from "react-dom";

import "./styles.css";

let currentTime = new Date().getHours();
let message = "";
let style = {
  color: "red",
};
if (currentTime < 12) {
  message = "Good Morning";
  style.color = "red";
} else if (currentTime < 18) {
  message = "Good Afternoon";
  style.color = "green";
} else if (currentTime < 24) {
  message = "Good Evening";
  style.color = "blue";
}

ReactDOM.render(
  <h1 className="heading" style={style}>
    {message}
  </h1>,
  document.getElementById("root")
);
