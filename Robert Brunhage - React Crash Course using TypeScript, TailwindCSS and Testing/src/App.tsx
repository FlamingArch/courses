import React, { useState, useRef, useEffect } from "react";
export const TODO_KEY = "TODOS";

function App() {
  const [todos, setTodos] = useState<string[]>([]);
  const nameRef = useRef<HTMLInputElement>(null);

  useEffect(() => {
    const jsonCount = localStorage.getItem(TODO_KEY);
    if (jsonCount) setTodos(JSON.parse(jsonCount));
  }, []);

  useEffect(() => {
    localStorage.setItem(TODO_KEY, JSON.stringify(todos));
  }, [todos]);

  const addTodo = () => {
    const name = nameRef.current?.value ?? "";
    if (name === "") return;
    setTodos([...todos, name]);
    if (nameRef.current) {
      nameRef.current.value = "";
    }
  };

  const removeTodo = (index: number) => {
    const updatedTodos = [...todos];
    updatedTodos.splice(index, 1);
    setTodos(updatedTodos);
  };
  return (
    <div className="w-screen h-screen flex flex-col items-center pt-40">
      <h1 className="text-4xl font-medium p-4">Todo List</h1>
      <div className="flex space-x-2">
        <input
          type="text"
          data-testid="todo-input"
          className="border rounded py-2 px-4"
          ref={nameRef}
        />
        <button
          className="bg-indigo-500 py-2 px-4 rounded text-white hover:bg-indigo-700"
          onClick={() => addTodo()}
        >
          Add Todo
        </button>
      </div>
      {todos.map((value, index) => {
        return (
          <div key="index" className="flex justify-between w-80 p-4">
            <p>{value}</p>
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="h-6 w-6 text-gray-400 cursor-pointer hover:text-gray-700"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              data-testid={`delete-${value}`}
              onClick={() => removeTodo(index)}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
              />
            </svg>
          </div>
        );
      })}
    </div>
  );
}

export default App;
