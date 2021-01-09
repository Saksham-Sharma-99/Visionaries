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
        sceneView.autoenablesDefaultLighting = true
        
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
        let pos = sceneView.scene.rootNode.childNodes.first?.position
        switch textField {
        case xTF:
            if let d = Float(dist){
                sceneView.scene.rootNode.childNodes.first?.position = SCNVector3Make( pos?.x ?? 0 + Float(d), pos?.y ?? 0, pos?.z ?? 0)
                   
            }
        case yTF:
            if let d = Float(dist){
                sceneView.scene.rootNode.childNodes.first?.position = SCNVector3Make( pos?.x ?? 0, pos?.y ?? 0 + Float(d), pos?.z ?? 0)
            }
        case zTF:
            if let d = Float(dist){
                sceneView.scene.rootNode.childNodes.first?.position = SCNVector3Make( pos?.x ?? 0 , pos?.y ?? 0, pos?.z ?? 0 + Float(d))
            }
        default:
            break;
        }
    }
    
}
