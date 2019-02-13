//
//  ViewController.swift
//  Cube
//
//  Created by Tiego Ouedraogo on 2/13/19.
//  Copyright © 2019 Tiego Ouedraogo. All rights reserved.
import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        //current viewController
        sceneView.delegate = self
        
        //creating a cube object on the sceneKit
        let cube = SCNBox (width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0.01)
        // just tying to add a sphere
        // let sphere = SCNSphere(radius: 0.2)
        //
        //        // creating a material
        let material = SCNMaterial()
        //
        //        //setting the material color
        material.diffuse.contents = UIColor.red
        //
        //        //adding the material to nthe cube
        //        //this array hold the contains of the materials
        cube.materials = [material]
        // sphere.materials = [material]
        //
        //        // creating a scenne node
        let node = SCNNode()
        //        //set the position SCNVector3 whih is 3D translation along the x y z axis
        //        //minus because negative is going away from u
        node.position = SCNVector3 (x: 0, y: 0.1, z: -0.5)
        //
        //        //let give it a geometry
        node.geometry = cube
        //       node.geometry = sphere
        //
        //        //add node to the scenne view
        //        //adding a ChildNode to
        //        //rootNode in the
        //        // 3D scenneView
        sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        
        // Create a new scene
        //        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        //        if let diceNode = diceScene.rootNode.childNode(withName: " Dice", recursively: true){
        //            diceNode.position = SCNVector3(x: 0.1, y: 0.1, z: -0.1)
        //            sceneView.scene.rootNode.addChildNode(diceNode)
        // Set the scene to the view
        //sceneView.scene = scene
        //}
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
