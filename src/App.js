import React from 'react'
import { BrowserRouter,Route,Link,Routes,Outlet } from 'react-router-dom'
import './App.css';
import AppRoutes from "./routes/appRoutes"

function App() {
  return (
      <BrowserRouter>
          <header>
              <ul>
                  <li> <Link to={'/home'}>HOME</Link></li>
                  <li> <Link to={'/three'}>Three</Link></li>
                  <li><Link to={'/babylon'}>Babylon</Link></li>
              </ul>
          </header>
          <div className="App">
              <AppRoutes></AppRoutes>
          </div>
      </BrowserRouter>

  );
}

export default App;
