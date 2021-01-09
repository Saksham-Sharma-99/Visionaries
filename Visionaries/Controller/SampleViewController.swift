//
//  SampleViewController.swift
//  Pokemon Detection
//
//  Created by Saksham Sharma on 09/01/21.
//  Copyright © 2021 sharma. All rights reserved.
//

import UIKit
import ARKit

class SampleViewController: UIViewController, ARSCNViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var xTF: UITextField!
    @IBOutlet weak var yTF: UITextField!
    @IBOutlet weak var zTF: UITextField!
    
    var object = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        xTF.delegate = self
        yTF.delegate = self
        zTF.delegate = self
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/\(object).scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
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

    // MARK: - TextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let dist = textField.text!
        print(sceneView.scene.rootNode.childNodes.first)
        switch textField {
        case xTF:
            if let d = Float(dist){
                sceneView.scene.rootNode.childNodes.first?.position.x =
                    sceneView.scene.rootNode.childNodes.first?.position.x ?? 0 + Float(d)
            }
        case yTF:
            if let d = Float(dist){
                sceneView.scene.rootNode.childNodes.first?.position.y =
                    sceneView.scene.rootNode.childNodes.first?.position.y ?? 0 + Float(d)
            }
        case zTF:
            if let d = Float(dist){
                sceneView.scene.rootNode.childNodes.first?.position.z =
                    sceneView.scene.rootNode.childNodes.first?.position.z ?? 0 + Float(d)
            }
        default:
            break;
        }
    }
    
}
