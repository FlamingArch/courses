import { Route, Routes } from 'react-router-dom'
import AppScaffold from './app'
import PageHome from './routes/home'
import PageProducts from './routes/products'

function AppRoutes() {
  return (
    <AppScaffold>
      <Routes>
        <Route path="/" element={<PageHome />} />
        <Route path="/products" element={<PageProducts />} />
        <Route path="/products/:id" element={<></>} />
        <Route path="/products/:id/edit" element={<></>} />
      </Routes>
    </AppScaffold>
  )
}

export default AppRoutes
