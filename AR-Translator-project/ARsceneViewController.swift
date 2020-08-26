//
//  ARsceneViewController.swift
//  AR-Translator-project
//
//  Created by Kantachat Puagkajee on 11/08/2020.
//  Copyright © 2020 Kantachat Puagkajee. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARsceneViewController: UIViewController, ARSCNViewDelegate {

    //MARK: Variables
    var arText: String = "AR"
    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()

      
               // Set the view's delegate
               sceneView.delegate = self
               
               let text = SCNText(string: arText, extrusionDepth: 1)
               
               let material = SCNMaterial()
               
               material.diffuse.contents = UIColor.blue
               
               text.materials = [material]
            
               text.font = UIFont(name: "Times" , size: 0.9)
               
               let node = SCNNode()
               
               node.position = SCNVector3(x: 0, y: -0.03, z: -0.1)
               
               node.scale = SCNVector3(x: 0.01, y: 0.01, z: 0.01)
               
               node.geometry = text
               
               sceneView.scene.rootNode.addChildNode(node)
               sceneView.autoenablesDefaultLighting = true
    }
    
     // MARK: - ARSCNViewDelegate
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
