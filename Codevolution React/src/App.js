import "./App.css";
import ClickCounter from "./components/ClickCounter";
import HoverCounter from "./components/HoverCounter";
// import Hero from "./components/Hero";
// import FRInput from "./components/FRInput";
// import RefsDemo from "./components/RefsDemo";
// import ParentComp from "./components/ParentComp";
// import FragmentDemo from "./components/FragmentDemo";
// import LifecycleA from "./components/LifecycleA";
// import Inline from "./components/Inline";
// import Stylesheet from "./components/Stylesheet";
// import NameList from "./components/NameList";
// import { Greet } from "./components/Greet";
// import Welcome from "./components/Welcome";
// import Hello from "./components/Hello";
// import Message from "./components/Message";
// import Counter from "./components/Counter";
// import FunctionClick from "./components/FunctionClick";
// import ClassClick from "./components/ClassClick";
// import EventBind from "./components/EventBind";
// import ParentComponent from "./components/ParentComponent";
// import UserGreeting from "./components/UserGreeting";
// import Form from "./components/Form";
// import Table from "./components/Table";
// import PureComp from "./components/PureComp";
// import PortalDemo from "./components/PortalDemo";

// import "./appStyles.css";
// import styles from "./appStyles.module.css";

function App() {
  return (
    <div className="App">
      {/* <h1 className="error">Error</h1>
      <h1 className={styles.success}>Success</h1> */}
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
      {/* <FunctionClick />
      <ClassClick /> */}
      {/*w <EventBind /> */}
      {/* <ParentComponent /> */}
      {/* <UserGreeting /> */}
      {/* <NameList /> */}
      {/* <Stylesheet primary={true} /> */}
      {/* <Inline /> */}
      {/* <Form /> */}
      {/* <LifecycleA /> */}
      {/* <FragmentDemo /> */}
      {/* <Table /> */}
      {/* <PureComp /> */}
      {/* <ParentComp /> */}
      {/* <RefsDemo /> */}
      {/* <FRInput /> */}
      {/* <PortalDemo /> */}
      {/* <Hero heroName="Batman" />
      <Hero heroName="Superman" />
      <Hero heroName="Joker" /> */}
      <ClickCounter name="Vishwas" />
      <HoverCounter />
    </div>
  );
}

export default App;

/*
1. `constructor(props)`
- A special function that will get called whenever a new component is created.
- Initialize state
- Bind event handlers
- Do not cause side effects. Example: HTTP Requests, API calls, setting global variables, etc.
- super(props)
- Directly overwrite this.state

2. `static getDerivedStateFromProps(props, state)`
- Method is called every time a component is re-rendered.
- When the state of the component depends on changes in props over time.
- Set the state.
- Do not cause side effects. Example: HTTP Requests, API calls, setting global variables, etc.

3. render()
- Only required method.
- Read props & state and return JSX.
- Do not change state or interact with DOM or make ajax calls.
- Children component lifecycle methods are also executed.

4. componentDidMount()
- Invoked immediately after a component and all it's children components have been rendered to the DOM.
- Cause side effects. Ex: Interact with the DOM or perform any ajax calls to load data.
 */

/*
static getDerivedStateFromProps(props, state) 
- Called every time a component is re-rendered.

shouldComponentUpdate(nextProps, nextState)
- Dictates if the component should re-render or not.
- Performance optimization.
- Do not cause side effects. Example: HTTP Requests, API calls, setting global variables, etc.
- Calling the setState method.

render()

getSnapshotBeforeUpdate(prevProps, prevState)
- Called right before the changes from the virtual DOM are applied to the real DOM.
- Capture some information from the DOM.
- Method will either return null or return a value. Returned value will be passed as the third parameter to the next method

componentDidUpdate(prevProps, prevState, snapshot)
- Called after the render is finished.
- Cause side effects.
*/

/*
static getDerivedStateFromError(error)
- Called when there is an error during rendering, in a lifecycle method, or in the constructor of any child component.
- Used to render a fallback UI after an error has been thrown.
- Method will either return an object to update state or return null to update nothing.

componentDidCatch(error, info)
- Called when there is an error during rendering, in a lifecycle method, or in the constructor of any child component.
- Used to log error information.
*/
