//
//  EarthAR.swift
//  SpaceStudyApp
//
//  Created by Mac on 30.10.2021.
//

import UIKit
import SceneKit
import ARKit

class EarthAR: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var EarthAR: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        EarthAR.delegate = self
        
        // Show statistics such as fps and timing information
        EarthAR.showsStatistics = false
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        EarthAR.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        EarthAR.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        EarthAR.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let result = EarthAR.hitTest(touch.location(in: EarthAR), types: [.featurePoint])
        guard let hitResult = result.last else { return }
        let hitMatrix = hitResult.worldTransform
        let matrix = SCNMatrix4(hitMatrix)
        let hitVector = SCNVector3.init(matrix.m41, matrix.m42, matrix.m43)
        createEarth(position: hitVector)
    }
    
    func createEarth(position: SCNVector3) {
        let earthShape = SCNSphere(radius: 0.13)
        let earthNode = SCNNode.init(geometry: earthShape)
        earthNode.position = position
        earthNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "8k_earth_daymap")
        earthNode.geometry?.firstMaterial?.specular.contents = UIImage(named: "8k_earth_specular_map")
        earthNode.geometry?.firstMaterial?.emission.contents = UIImage(named: "8k_earth_clouds")
        earthNode.geometry?.firstMaterial?.normal.contents = UIImage(named: "8k_earth_normal_map")
        EarthAR.scene.rootNode.addChildNode(earthNode)
    }
    
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
