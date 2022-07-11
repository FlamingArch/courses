import React, { useState } from "react";

function App() {
  const [HeadingText, setHeadingText] = useState("Hello");
  const [Hovering, setHovering] = useState(false);

  function handleClick() {
    setHeadingText("Submitted");
  }

  function handleMouseOver() {
    setHovering(true);
  }

  function handleMouseLeave() {
    setHovering(false);
  }

  const style = {
    background: "black",
  };

  return (
    <div className="container">
      <h1>{HeadingText}</h1>
      <input type="text" placeholder="What's your name?" />
      <button
        style={Hovering ? style : null}
        onClick={handleClick}
        onMouseOver={handleMouseOver}
        onMouseLeave={handleMouseLeave}
      >
        Submit
      </button>
    </div>
  );
}

export default App;
