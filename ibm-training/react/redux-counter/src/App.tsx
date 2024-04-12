import { useState } from 'react'
import viteLogo from './assets/redux.svg'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className='bg-white p-4 w-fit gap-4 flex flex-col rounded-xl shadow-2xl transition-in'>
      <div className='flex gap-4 items-center'>
        <img src={viteLogo} className="logo" alt="Vite logo" />
        <h1>Redux Counter</h1>
      </div>

      <p>Count is {count}</p>

      <div className="flex gap-4">
        <button className='primary' onClick={() => setCount((count) => count + 1)}>
          Increment
        </button>
        <button onClick={() => setCount((count) => count + 1)}>
          Increment 10
        </button>
        <button onClick={() => setCount((count) => count + 1)}>
          Decrement
        </button>
      </div>
    </div>
  )
}

export default App
