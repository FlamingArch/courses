import React from "react";
import { CountContext } from "../App";

export default function ComponentD() {
  const countContext = React.useContext(CountContext);
  return (
    <div>
      Component D
      <button onClick={() => countContext.countDispatch("increment")}>
        Increment
      </button>
      <button onClick={() => countContext.countDispatch("decrement")}>
        Decrement
      </button>
      <button onClick={() => countContext.countDispatch("reset")}>Reset</button>
    </div>
  );
}
