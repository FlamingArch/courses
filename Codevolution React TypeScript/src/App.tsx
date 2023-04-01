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
import { DomRef } from "./Components/ref/DomRef";
import { MutableRef } from "./Components/ref/MutableRef";
import CounterClass from "./Components/class/Counter";
import { Private } from "./Components/auth/private";
import Profile from "./Components/auth/profile";
import { List } from "./Components/generics/List";
import { RandomNumber } from "./Components/restriction/RandomNumber";
import { Toast } from "./Components/templateliterals/Toast";
import { CustomButton } from "./Components/html/Button";
import { Text } from "./Components/polymorphic/Text";

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
      <DomRef />
      <MutableRef />
      <CounterClass message="The current count is: " />
      <Private isLoggedIn component={Profile} />
      {/* <List
        items={["Batman", "Superman", "Wonder Women"]}
        onClick={(item) => console.log(item)}
      />
      <List items={[1, 2, 3]} onClick={(item) => console.log(item)} /> */}
      <List
        items={[
          {
            id: 1,
            first: "Bruce",
            last: "Wayne",
          },
          {
            id: 2,
            first: "Clark",
            last: "Kent",
          },
          {
            id: 3,
            first: "Princess",
            last: "Diana",
          },
        ]}
        onClick={(item) => console.log(item)}
      />
      <RandomNumber value={10} isPositive />
      <Toast position="center" />
      <CustomButton variant="primary" onClick={() => console.log("Clicked")}>
        {/* <div>Primary Button</div> */}
        Primary Button
      </CustomButton>
      <Text as="h1" size="lg">
        Heading
      </Text>
      <Text as="p" size="md">
        Paragraph
      </Text>
      <Text as="label" htmlFor="someId" size="sm" color="secondary">
        Label
      </Text>
    </div>
  );
}

export default App;
