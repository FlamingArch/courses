import { Route, Routes } from "react-router-dom"
import PageHome from "./routes/home"

function AppRouter() {
  return (
    <Routes>
      <Route path="/" element={<PageHome />} />
    </Routes>
  )
}

export default AppRouter
