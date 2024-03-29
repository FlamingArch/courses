import "./App.css";
import React from "react";
// import ClassCounter from "./components/ClassCounter";
// import HookCounter from "./components/HookCounter";
// import HookCounterTwo from "./components/HookCounterTwo";
// import HookCounterThree from "./components/HookCounterThree";
// import HooksCounterFour from "./components/HooksCounterFour";
// import ClassCounterOne from "./components/ClassCounterOne";
// import ClassMouse from "./components/ClassMouse";
// import HookCounterOne from "./components/HookCounterOne";
// import HookMouse from "./components/HookMouse";
// import MouseContainer from "./components/MouseContainer";
// import CounterOne from "./Components/CounterOne";
// import CounterTwo from "./Components/CounterTwo";
// import CounterThree from "./Components/CounterThree";
// import ComponentA from "./components/ComponentA";
// import ComponentB from "./Components/ComponentB";
// import ComponentC from "./Components/ComponentC";
// import ComponentD from "./components/ComponentD";
// import ComponentF from "./components/ComponentF";
// import DataFetchingTwo from "./components/DataFetchingTwo";
// import ParentComponent from "./components/ParentComponent";
// import Counter from "./components/Counter";
// import FocusInput from "./components/FocusInput";
// import ClassTimer from "./components/ClassTimer";
// import HookTimer from "./components/HookTimer";
import DocTitleOne from "./components/DocTitleOne";
import DocTitleTwo from "./components/DocTitleTwo";

export const CountContext = React.createContext();

const initialState = 0;
const reducer = (state, action) => {
  switch (action) {
    case "increment":
      return state + 1;
    case "decrement":
      return state - 1;
    case "reset":
      return initialState;
    default:
      return state;
  }
  // return newState;
};

function App() {
  const [count, dispatch] = React.useReducer(reducer, initialState);

  return (
    <CountContext.Provider
      value={{ countState: count, countDispatch: dispatch }}
    >
      <div className="App">
        {/* <div className="">Count - {count}</div> */}
        {/* <ClassCounter /> */}
        {/* <HookCounter /> */}
        {/* <HookCounterTwo/> */}
        {/* <HookCounterThree /> */}
        {/* <HooksCounterFour /> */}
        {/* <ClassCounterOne /> */}
        {/* <HookCounterOne /> */}
        {/* <ClassMouse /> */}
        {/* <HookMouse /> */}
        {/* <MouseContainer /> */}
        {/* <CounterThree /> */}
        {/* <ComponentA /> */}
        {/* <ComponentB />
        <ComponentC /> */}
        {/* <ComponentD /> */}
        {/* <ComponentF /> */}
        {/* <DataFetchingTwo /> */}
        {/* <ParentComponent /> */}
        {/* <Counter /> */}
        {/* <FocusInput /> */}
        {/* <ClassTimer />
        <HookTimer /> */}
        <DocTitleOne />
        <DocTitleTwo />
      </div>
    </CountContext.Provider>
  );
}

export default App;
// useState useReducer useEffect useRef useCallback useMemo
