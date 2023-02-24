import React from "react";
import logo from "./logo.svg";
import "./App.css";
import { Greet } from "./Components/Greet";
import { Person } from "./Components/Person";
import { PersonList } from "./Components/PersonList";
import { Status } from "./Components/Status";
import { Oscar } from "./Components/Oscar";
import { Heading } from "./Components/Heading";
import { Button } from "./Components/Button";
import { Input } from "./Components/Input";
import { Container } from "./Components/Container";
import { Counter } from "./Components/state/Counter";
import { ThemeContextProvider } from "./Components/context/ThemeContext";
import { Box } from "./Components/context/Box";
import { UserContextProvider } from "./Components/context/UserContext";
import { User } from "./Components/context/User";

function App() {
  const personName = {
    first: "Bruce",
    last: "Wayne",
  };
  const nameList = [
    {
      first: "Bruce",
      last: "Wayne",
    },
    {
      first: "Clark",
      last: "Kent",
    },
    {
      first: "Princess",
      last: "Diana",
    },
  ];
  return (
    <div className="App">
      <Greet name="Harsh" messageCount={10} isLoggedIn />
      <Person name={personName} />
      <PersonList names={nameList} />
      <Status status="loading" />
      <Oscar>
        <Heading>Oscar goes to Leonardo Dicaprio!</Heading>
      </Oscar>
      <Greet name="Harsh" isLoggedIn />
      <Button
        handleClick={(event) => {
          console.log("Button Clicked", event);
        }}
      />
      <Input value="" handleChange={(event) => console.log(event)} />
      <Container styles={{ border: "1px solid black", padding: "1rem" }} />
      <Counter />
      <ThemeContextProvider>
        <Box />
      </ThemeContextProvider>
      <UserContextProvider>
        <User />
      </UserContextProvider>
    </div>
  );
}

export default App;
