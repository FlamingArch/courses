import React from 'react'
import Button from "./button"
import { FoodItem } from "../types"
import { IconAdd } from "./icons"

type ListViewProps = { children?: React.ReactNode }
type ListItemProps = { item: FoodItem, handleAdd: (item: FoodItem, quantity: number) => void }

function ListView({ children }: ListViewProps) {
  return (
    <section className="flex justify-center p-4">
      <ul className="flex-grow max-w-4xl p-6 flex flex-col bg-white rounded-2xl text-black gap-4">
        {children}
      </ul>
    </section>
  )
}

function ListItem({ item, handleAdd }: ListItemProps) {
  const [count, setCount] = React.useState<number | undefined>(1)

  return <li className={"border-b flex justify-between pb-4 " + (item.available == 0 ? "opacity-50" : "")
  }>
    <div className="flex flex-col">
      <p className="text-xl font-bold">{item.title}</p>
      <p className="italic">{item.description}</p>
      <p className="font-bold text-red-800">${item.price}</p>
    </div>
    <div className="flex flex-col gap-4 items-end">
      <div className="flex gap-2 items-center">
        <p className="text-lg font-semibold">Amount</p>
        <input
          disabled={item.available == 0}
          type='number'
          className="bg-transparent border border-slate-400 rounded-lg w-16 px-2 py-1"
          value={count} onChange={e => {
            if (e.target.value === "") setCount(undefined)
            const newVal = parseInt(e.target.value)
            if (newVal <= item.available && newVal > 0)
              setCount(newVal)
          }} />
      </div>
      <Button disabled={typeof count != "number" || count < 1 || item.available == 0} onClick={() => {
        if (typeof count == "number" && count > 0) {
          handleAdd(item, count)
        }
      }}>
        {
          item.available == 0
            ? <p className='text-black'>Out of Stock</p>
            : <><IconAdd className="fill-white w-4 h-4" /> Add</>
        }
      </Button>
    </div>
  </li >
}

const SectionList = {
  List: ListView,
  Item: ListItem
}

export default SectionList
