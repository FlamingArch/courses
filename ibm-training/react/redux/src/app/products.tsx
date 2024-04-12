import { Search, Sidebar } from 'react-feather'
import useAppStore from '../store'

export default function PageProducts() {
  const { isSidebarOpen, toggleSidebar } = useAppStore()

  return (
    <main>
      <header>
        {!isSidebarOpen && (
          <button onClick={toggleSidebar} >
            <Sidebar size={20} color="#0066FF" />
          </button>
        )}
        <div className="flex-grow"></div>
        <button onClick={toggleSidebar} >
          <Search size={20} color="#0066FF" />
        </button>
      </header>
    </main>
  )
}
