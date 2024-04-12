import { Home, Sidebar, Headphones } from "react-feather";
import { AnimatePresence, motion, } from "framer-motion"
import useAppStore from "./store";
import NavItem from "./components/NavItem";

export default function App({ children }: { children: React.ReactNode }) {
  return <>
    <NavigationBar />
    {children}
  </>


}

function NavigationBar() {
  const width = 200;
  const { isSidebarOpen, toggleSidebar } = useAppStore()

  return <AnimatePresence initial={false}>
    {isSidebarOpen && (
      <motion.nav
        transition={{
          damping: 300,
          stiffness: 50
        }}
        animate={{ width: [0, width] }} exit={{ width: [width, 0] }}
        className="bg-gray-100 border-r h-screen flex flex-row-reverse overflow-hidden">
        <div
          className="flex flex-col gap-3"
          style={{
            minWidth: width,
            maxWidth: width,
            width: width
          }}>
          <header>
            <div className="flex-grow" />
            {!isSidebarOpen && (
              <button onClick={toggleSidebar} >
                <Sidebar size={16} color="#0066FF" />
              </button>
            )}
            <button onClick={toggleSidebar} >
              <Sidebar size={20} color="#0066FF" />
            </button>
          </header>
          <ul className="px-3">
            <NavItem to="/" Icon={Home} label="Home" />
            <NavItem to="/products" Icon={Headphones} label="Products" />
          </ul>
        </div>


      </motion.nav>
    )}
  </AnimatePresence>
}
