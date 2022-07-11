import React, { useState } from "react";

function App() {

  const [name, setName] = useState("")
  const [DisplayName, setDisplayName] = useState("")

  function handleChange(event) {
    console.log(event.target.value);
    // console.log(event.target.placeholder);
    // console.log(event.target.type);
    setName(event.target.value)
  }

  function handleClick(event) {
    setDisplayName(name)
    event.preventDefault()
  }

  // return (
  //   <div className="container">
  //     <h1>Hello {DisplayName}</h1>
  //     <input onChange={handleChange} type="text" placeholder="What's your name?" value={name}/>
  //     <button onClick={handleClick}>Submit</button>
  //   </div>
  // );
  return (
    <div className="container">
      <h1>Hello {DisplayName}</h1>
      <form onSubmit={handleClick}>
        <input onChange={handleChange} type="text" placeholder="What's your name?" value={name} />
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default App;
