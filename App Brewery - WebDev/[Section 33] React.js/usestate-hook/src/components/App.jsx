import React, { useState } from "react";

function App() {
  // var state = useState(0);

  // console.log(state);
  // console.log(state[0]);

  // const rgb = [52, 152, 219];
  // console.log(rgb[0]);

  // const [red, green, blue] = [52, 152, 219];
  // console.log(red);

  // var [count] = useState(34223);
  var [count, setCount] = useState(0);

  function increase() {
    // count++;
    // setCount(12);
    setCount(count++);
  }
  function decrease() {
    setCount(count--);
  }

  return (
    <div className="container">
      <h1>{count}</h1>
      <button onClick={increase}>+</button>
      <button onClick={decrease}>-</button>
    </div>
  );
}

export default App;
