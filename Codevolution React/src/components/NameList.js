import React from "react";
import Person from "./Person";

function NameList() {
  const names = ["Bruce", "Clark", "Diana", "Bruce"];
  // const persons = [
  //   { id: 1, name: "Bruce", age: 30, skill: "React" },
  //   { id: 2, name: "Clark", age: 25, skill: "Angular" },
  //   { id: 3, name: "Diana", age: 28, skill: "Vue" },
  // ];

  const nameList = names.map((name, index) => (
    <h1 key={index}>
      {index} {name}
    </h1>
  ));

  //   const personList = persons.map((person) => (
  //     <h1>
  //       I am {person.name}. I am {person.age} years old. I know {person.skill}
  //     </h1>
  //   ));
  // const personList = persons.map((person) => (
  //   <Person person={person} key={person.id} />
  // ));

  return (
    <div>
      {/* <h1>{names[0]}</h1>
      <h1>{names[1]}</h1>
      <h1>{names[2]}</h1> */}

      {/* {names.map((name) => (
        <h1>{name}</h1>
      ))} */}

      {nameList}
      {/* {personList} */}
    </div>
  );
}

export default NameList;
