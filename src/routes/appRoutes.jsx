import React from "react";
import {Route, Routes} from "react-router-dom";
import Home from '../pages/home'
import BabylonPlay from '../pages/babylonplay'
import ThreePlay from '../pages/three'
const AppRoutes =  () =>{
    return <>
        <Routes>
            <Route path="/home/*" element={<Home/>} ></Route>
            <Route path="/babylon" element={<BabylonPlay/>} ></Route>
            <Route path="/three" element={<ThreePlay/>} ></Route>
        </Routes>
    </>

}

export default  AppRoutes;