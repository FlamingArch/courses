import { Icon } from "react-feather"
import { NavLink, useLocation } from "react-router-dom"

type NavItemProps = {
  to: string
  Icon: Icon,
  label: string
}

export default function NavItem(props: NavItemProps) {
  const location = useLocation();
  console.log(typeof location)


  return (
    <NavLink to={props.to} className={({ isActive }) => {
      return "flex px-2 py-1 items-center gap-2 icon-accent " + (isActive ? "text-black bg-black bg-opacity-10 rounded-lg" : "")
    }}><props.Icon size={16} />{props.label}</NavLink >
  )
}
