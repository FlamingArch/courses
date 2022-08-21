import React from "react";

function HookCounterTwo() {
  const [count, setCount] = React.useState(0);

  const incrementFive = () => {
    for (let i = 0; i < 5; i++) {
      // setCount(count + 1)
      setCount((prevCount) => prevCount + 1);
    }
  };

  return (
    <div>
      Count: {count}
      <button onClick={() => setCount((prevCount) => prevCount + 1)}>
        Increment
      </button>
      <button onClick={() => setCount((prevCount) => prevCount - 1)}>
        Decrement
      </button>
      <button onClick={() => setCount((count = 0))}>Reset</button>
      <button onClick={incrementFive}>Increment 5</button>
    </div>
  );
}

export default HookCounterTwo;
