import * as BABYLON from 'babylonjs';
import {useState,useEffect,useRef} from "react";
/*import { Scene, Engine } from 'babylonjs';*/

const BabylonPlay = ()=>{
    const canvasRef = useRef();

    const importMesh =(scene,engine)=>{
        /*BABYLON.SceneLoader.ImportMeshAsync("mymesh", "./obj/", "first.obj").then((result) => {
            result.meshes[1].position.x = 20;
            const myMesh1 = scene.getMeshByName("myMesh_1");
            //myMesh1.rotation.y = Math.PI / 2;
            myMesh1.position.y =  8;
        });*/
        const loader = new BABYLON.AssetsManager(scene);
        const bunny = loader.addMeshTask("bunny", "", "./obj/", "first.obj");
       // bunny.onSuccess = pos;

        loader.onFinish = function() {
            engine.runRenderLoop(function() {
                scene.render();
            });
        };

        loader.load()
    }

    const renderInit =() =>{
        const  canvas = canvasRef.current
        // Load the 3D engine
        const engine = new BABYLON.Engine(canvas, true, {preserveDrawingBuffer: true, stencil: true});
        // call the createScene function
        const scene = createScene(canvas,engine);
        // run the render loop
        engine.runRenderLoop(function(){
            scene.render();
        });

        importMesh(scene,engine);

        window.addEventListener('resize', function(){
            engine.resize();
        });
    }
    const createScene = (canvas,engine)=>{
        // Create a basic BJS Scene object
        var scene = new BABYLON.Scene(engine);
        // Create a FreeCamera, and set its position to {x: 0, y: 5, z: -10}
        var camera = new BABYLON.FreeCamera('camera1', new BABYLON.Vector3(0, 5, -10), scene);
        // Target the camera to scene origin
        camera.setTarget(BABYLON.Vector3.Zero());
        // Attach the camera to the canvas

 1       camera.attachControl(canvas, false);
        // Create a basic light, aiming 0, 1, 0 - meaning, to the sky
        var light = new BABYLON.HemisphericLight('light1', new BABYLON.Vector3(0, 1, 0), scene);
        // Create a built-in "sphere" shape using the SphereBuilder
        var sphere = BABYLON.MeshBuilder.CreateSphere('sphere1', {segments: 16, diameter: 2, sideOrientation: BABYLON.Mesh.FRONTSIDE}, scene);
        // Move the sphere upward 1/2 of its height
        sphere.position.y = 1;
        // Create a built-in "ground" shape;
        var ground = BABYLON.MeshBuilder.CreateGround("ground1", { width: 6, height: 6, subdivisions: 2, updatable: false }, scene);
        // Return the created scene
        return scene;
    }

    useEffect(()=>{
        renderInit()
    },[])

    return <>
        <canvas ref={canvasRef} style={{ width:'800px',height:'600px'}}></canvas>
        <h1>Babylon Here!</h1>
    </>
}
export default BabylonPlay;