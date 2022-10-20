import React from "react";

function HookCounterThree() {
  const [name, setName] = React.useState({ firstName: "", lastName: "" });
  return (
    <form>
      <input
        type="text"
        value={name.firstName}
        onChange={(e) => setName({ ...name, firstName: e.target.value })}
      />
      <input
        type="text"
        value={name.lastName}
        onChange={(e) => setName({ ...name, lastName: e.target.value })}
      />
      <h2>Yout first name is - {name.firstName}</h2>
      <h2>Yout last name is - {name.lastName}</h2>
      <h2>{JSON.stringify(name)}</h2>
    </form>
  );
}

export default HookCounterThree;
