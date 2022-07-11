import React from "react";
import Entry from "./Entry";
import emojipedia from "../emojipedia";

var createElement = (e) => {
  return <Entry key={e.id} emoji={e.emoji} name={e.name} meaning={e.meaning} />;
};

function App() {
  return (
    <div>
      <h1>
        <span>emojipedia</span>
      </h1>

      <dl className="dictionary">{emojipedia.map(createElement)}</dl>
    </div>
  );
}

export default App;
