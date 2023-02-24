import React, { useReducer } from "react";

type CounterState = {
  count: number;
};

type CounterAction = UpdateAction | ResetAction;

type UpdateAction = {
  type: "increment" | "decrement" | "reset";
  payload: number;
};

type ResetAction = {
  type: "reset";
};

const initState = { count: 0 };

function reducer(state: CounterState, action: CounterAction) {
  switch (action.type) {
    case "increment":
      return { count: state.count + action.payload };
    case "decrement":
      return { count: state.count - action.payload };
    case "reset":
      return initState;
    default:
      return state;
  }
}

export const Counter = () => {
  const [state, dispatch] = useReducer(reducer, initState);
  return (
    <>
      Count: {state.count}
      <button onClick={() => dispatch({ type: "increment", payload: 10 })}>
        Increment 10
      </button>
      <button onClick={() => dispatch({ type: "decrement", payload: 10 })}>
        Decrement 10
      </button>
      <button onClick={() => dispatch({ type: "reset" })}>Reset</button>
    </>
  );
};
