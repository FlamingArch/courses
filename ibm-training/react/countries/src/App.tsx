import { useEffect, useState } from "react";

type Country = {
  id: string
  country: string
  states: string[]
}

export default function App() {
  const [countries, setCountries] = useState<Country[] | undefined>();
  const [selectedCountry, setSelectedCountry] = useState<Country | undefined>(undefined)
  const [selectedState, setSelectedState] = useState<String | undefined>("")

  useEffect(() => { fetch("http://localhost:3000/countries").then(data => data.json().then(data => setCountries(data))) }, [])

  useEffect(() => {
    selectedCountry?.country == "Hong Kong"
      ? setSelectedState("Hong Kong")
      : setSelectedState(undefined)
  }, [selectedCountry])

  return (
    <main className="p-6 flex flex-col gap-4 min-h-screen">
      <h1 className="text-2xl">Countries</h1>

      <p>Select Country</p>
      <select name="" id="" onChange={e => setSelectedCountry(countries?.filter(c => c.id == e.target.value)[0])}>
        <option value={undefined}>None</option>
        {countries && countries.map(country => (
          <option value={country.id}>{country.country}</option>
        ))}
      </select>

      {selectedCountry && <>
        <p>Select State</p>
        {selectedCountry.states.length > 0
          ? <select name="" id="" onChange={e => setSelectedState(e.target.value)}>
            <option value={undefined}>None</option>
            {selectedCountry.states.map(state => <option>{state}</option>)}
          </select>
          : <p className="error">No States preset for the Country</p>
        }
      </>}
      <div className="flex-grow" />
      <button className="rounded-xl bg-blue-600 p-3 text-white disabled:opacity-50" disabled={!selectedState}>
        {selectedState ? `Continue with ${selectedState}` : "Select Country and State"}
      </button>
    </main>
  )
}
