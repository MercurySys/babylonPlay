import React from "react";
import {Route, Routes} from "react-router-dom";
import About from "../pages/about";
import Contact from "../pages/contact";

export const HomeRouter = () => {
    return <>
        <Routes>
            <Route path="/about" element={<About/>} />
            <Route path='/contact' element={<Contact/>}/>
        </Routes>

    </>
}

