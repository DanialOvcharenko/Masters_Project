//
//  SunAR.swift
//  SpaceStudyApp
//
//  Created by Mac on 29.10.2021.
//

import UIKit
import SceneKit
import ARKit

class SunAR: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var SunAR: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        SunAR.delegate = self
        
        // Show statistics such as fps and timing information
        SunAR.showsStatistics = false
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        SunAR.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        SunAR.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        SunAR.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let result = SunAR.hitTest(touch.location(in: SunAR), types: [.featurePoint])
        guard let hitResult = result.last else { return }
        let hitMatrix = hitResult.worldTransform
        let matrix = SCNMatrix4(hitMatrix)
        let hitVector = SCNVector3.init(matrix.m41, matrix.m42, matrix.m43)
        createEarth(position: hitVector)
    }
    
    func createEarth(position: SCNVector3) {
        let sunShape = SCNSphere(radius: 0.13)
        let sunNode = SCNNode.init(geometry: sunShape)
        sunNode.position = position
        sunNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "8k_sun")
        SunAR.scene.rootNode.addChildNode(sunNode)
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
