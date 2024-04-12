import { create } from "zustand";

type StateObject = {
  isSidebarOpen: boolean
  toggleSidebar: () => void
  isSearchVisible: boolean
}

const useAppStore = create<StateObject>((set) => ({
  isSidebarOpen: true,
  toggleSidebar: () => set(state => ({ isSidebarOpen: !(state.isSidebarOpen) })),
  isSearchVisible: false
}))

export default useAppStore
