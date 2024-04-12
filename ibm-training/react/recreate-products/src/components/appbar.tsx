import React from 'react'

type AppBarProps = {
  title: string,
  navLinks?: React.ReactNode[],
  trailing?: React.ReactNode
}

export default function AppBar(props: AppBarProps) {
  return (
    <nav className="navbar navbar-expand-lg bg-body-tertiary">
      <div className="container-fluid">
        <a className="navbar-brand" href="/">{props.title}</a>
        <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse" id="navbarSupportedContent">
          <ul className="navbar-nav me-auto mb-2 mb-lg-0">
            {props.navLinks && props.navLinks.map(link => <li className="nav-item"> {link} </li>)}
          </ul>
          {props.trailing}
        </div>
      </div>
    </nav >
  )
}
