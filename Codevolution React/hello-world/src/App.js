import "./App.css";
import { Greet } from "./components/Greet";
import Welcome from "./components/Welcome";
import Hello from "./components/Hello";
import Message from "./components/Message";
import Counter from "./components/Counter";
import FunctionClick from "./components/FunctionClick";
import ClassClick from "./components/ClassClick";

function App() {
  return (
    <div className="App">
      {/* <Greet name="Bruce" heroName="Batman">
        This is children props
      </Greet>
      <Greet name="Clark" heroName="Superman">
        <button>Action</button>
      </Greet>
      <Greet name="Diana" heroName="Wonder Woman" />
      <Welcome name="Bruce" heroName="Batman"></Welcome>
      <Welcome name="Clark" heroName="Superman"></Welcome>
    <Welcome name="Diana" heroName="Wonder Woman"></Welcome> */}
      {/* <Message /> */}
      {/* <Counter /> */}
      {/* <Greet name="Bruce" heroName="Batman">
        This is children props
      </Greet>
      <Welcome name="Diana" heroName="Wonder Woman"></Welcome> */}
      <FunctionClick />
      <ClassClick />
    </div>
  );
}

export default App;
