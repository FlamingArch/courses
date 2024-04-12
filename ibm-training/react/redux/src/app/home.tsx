import { Info, Sidebar } from "react-feather";
import useAppStore from "../store";

export default function PageHome() {
  const { isSidebarOpen, toggleSidebar } = useAppStore()
  return <main>
    <header>
      {!isSidebarOpen && (
        <button onClick={toggleSidebar} >
          <Sidebar size={20} color="#0066FF" />
        </button>
      )}
      <div className="flex-grow"></div>
      <button><Info size={20} color="#0066FF" /></button>
    </header>
    <article>
      Hello, World!
    </article>
  </main>
}
