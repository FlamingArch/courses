import React from "react";
import { CountContext } from "../App";

export default function ComponentA() {
  const countContext = React.useContext(CountContext);
  return (
    <div>
      Component A
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
