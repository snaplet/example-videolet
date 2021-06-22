// In this file, all Page components from 'src/pages` are auto-imported. Nested
// directories are supported, and should be uppercase. Each subdirectory will be
// prepended onto the component name.
//
// Examples:
//
// 'src/pages/HomePage/HomePage.js'         -> HomePage
// 'src/pages/Admin/BooksPage/BooksPage.js' -> AdminBooksPage

import { Router, Route, routes, Link, Set } from '@redwoodjs/router'

const envName = process.env.NODE_ENV;

const MainLayout = ({ children }) => {
  return (
    <div className={'env-' + envName}>
      <h2 className="envName">{envName}</h2>
      <h1>VideoLet</h1>
      <Link to={routes.films()}>Films</Link> | <Link to={routes.customers()}>Customers</Link>
      <br />
      <div>{children}</div>
    </div>
  )
}

const Routes = () => {
  return (
    <Router>
      <Set wrap={MainLayout}>
        <Route page={FilmsPage} name="films" path="/" />
        <Route page={CustomersPage} name="customers" path="/customers" />
        <Route page={CustomerPage} name="customer" path="/customer/{id:Int}" />
        <Route notfound page={NotFoundPage} />
      </Set>
    </Router>
  )
}

export default Routes
