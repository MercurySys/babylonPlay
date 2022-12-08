import * as Three from 'three';
import {useState,useEffect,useRef} from "react";
/*import { Scene, Engine } from 'babylonjs';*/


const ThreePlay = ()=>{
    const canvasRef = useRef();

    const renderInit =() =>{
        const  canvasContainer = canvasRef.current
        // call the createScene function
        const {scene, camera, renderer} = createScene(canvasContainer);

        const geometry = new Three.BoxGeometry( 1, 1, 1 );
        const material = new Three.MeshBasicMaterial( { color: 0x00ff00 } );
        const cube = new Three.Mesh( geometry, material );
        scene.add( cube );

        camera.position.z = 5;

        function animate() {
            requestAnimationFrame( animate );

            cube.rotation.x += 0.01;
            cube.rotation.y += 0.01;

            renderer.render( scene, camera );
        };

        animate();

        window.addEventListener('resize', function(){
            renderer.setSize( window.innerWidth, window.innerHeight );
            //todo： camera.
        });
    }
    const createScene = (canvasContainer)=>{
        // Create a basic BJS Scene object
        const scene = new Three.Scene();
        const camera = new Three.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
        const renderer = new Three.WebGLRenderer();
        renderer.setSize( window.innerWidth, window.innerHeight );
        canvasContainer.appendChild( renderer.domElement );

        return {
            scene, camera, renderer
        }

    }

    useEffect(()=>{
        renderInit()
    },[])

    return <>
        <div ref={canvasRef} style={{ width:'800px',height:'600px'}}></div>
        <h1>Three Here!</h1>
    </>
}
export default ThreePlay;