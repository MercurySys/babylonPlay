import React from "react";
import {Route, Routes} from "react-router-dom";
import Home from '../pages/home'
import BabylonPlay from '../pages/babylonplay'
const AppRoutes =  () =>{
    return <>
        <Routes>
            <Route path="/home/*" element={<Home/>} ></Route>
            <Route path="/babylon" element={<BabylonPlay/>} ></Route>
        </Routes>
    </>

}

export default  AppRoutes;