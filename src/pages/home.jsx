import React, { useEffect,useRef } from 'react'
import {Link, Outlet, Route, Routes} from "react-router-dom";
import About from "./about";
import Contact from "./contact";
import {HomeRouter} from '../routes/pageRouters'

const page = () =>{
    return <>
        <h1>Home</h1>
        <ul>
            <li> <Link to={'/babylon'}>Babylon Playround</Link></li>
            <li> <Link to={'./about'}>About</Link></li>
            <li><Link to={'./contact'}>Contact</Link></li>
        </ul>
        <Outlet />
        <HomeRouter></HomeRouter>

    </>
}

export default page;