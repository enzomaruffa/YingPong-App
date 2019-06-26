//
//  GameViewController.swift
//  YingPong
//
//  Created by Enzo Maruffa Moreira on 19/06/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var skView: SKView!
    var scene: GameScene!
    
    @IBOutlet weak var p1ClockwiseButton: UIButton!
    @IBOutlet weak var p1AntiClockwiseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p1ClockwiseButton.addTarget(self, action: #selector(setP1Clockwise), for: .touchDown)
        p1ClockwiseButton.addTarget(self, action: #selector(unsetP1Clockwise), for: .touchUpInside)
        p1ClockwiseButton.addTarget(self, action: #selector(unsetP1Clockwise), for: .touchUpOutside)
        
        p1AntiClockwiseButton.addTarget(self, action: #selector(setP1AntiClockwise), for: .touchDown)
        p1AntiClockwiseButton.addTarget(self, action: #selector(unsetP1AntiClockwise), for: .touchUpInside)
        p1AntiClockwiseButton.addTarget(self, action: #selector(unsetP1AntiClockwise), for: .touchUpOutside)
        
        // Load the SKScene from 'GameScene.sks'
        if let scene = GameScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            self.scene = scene
            
            scene.scaleMode = .aspectFill
            
            // Present the scene
            skView.presentScene(scene)
        }
        
        skView.ignoresSiblingOrder = true
        
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsFields = true
        skView.showsPhysics = true
    }
    
    @objc func setP1Clockwise() {
        scene.p1Clockwise = true
        print("clockwise", scene.p1Clockwise)
        print("anticlockwise", scene.p1AntiClockwise)
    }
    
    @objc func setP1AntiClockwise() {
        scene.p1AntiClockwise = true
        print("clockwise", scene.p1Clockwise)
        print("anticlockwise", scene.p1AntiClockwise)
        
    }
    
    @objc func unsetP1Clockwise() {
        scene.p1Clockwise = false
        print("clockwise", scene.p1Clockwise)
        print("anticlockwise", scene.p1AntiClockwise)
        
    }
    
    @objc func unsetP1AntiClockwise() {
        scene.p1AntiClockwise = false
        print("clockwise", scene.p1Clockwise)
        print("anticlockwise", scene.p1AntiClockwise)
        
    }
    
    @objc func setP2Clockwise() {
        
    }
    
    @objc func setP2AntiClockwise() {
        
    }

    @objc func unsetP2Clockwise() {
        
    }

    @objc func unsetP2AntiClockwise() {
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
