type AppBarProps = {
  children?: React.ReactNode
  title?: string
}

export default function AppBar({
  children,
  title
}: AppBarProps) {
  return <div className="flex justify-center bg-red-800 shadow-2xl text-white">
    <div className="p-4 flex items-center justify-between max-w-4xl flex-grow">
      <p className="text-2xl font-bold">{title}</p>
      {children}
    </div>
  </div>
}
