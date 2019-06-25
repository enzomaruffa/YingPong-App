//
//  GameScene.swift
//  YingPong
//
//  Created by Enzo Maruffa Moreira on 19/06/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let mapCenter: CGPoint = .zero
    var mapRadius: CGFloat!
    
    var arcColors: [UIColor]!
    var bumperColors: [UIColor]!
    
    var lightSideColor: UIColor?
    var darkSideColor: UIColor = .black
    
    var bumperRadius: CGFloat!
    
    override func didMove(to view: SKView) {
        
        backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        arcColors = [.purple, .purple]
        bumperColors = [.white, .black]
        
        mapRadius = (min(view.frame.width, view.frame.height) / 1.5)
        bumperRadius = mapRadius/5
        
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        
        createMap()
        
    }
    
    func createMap() {
        let rightArc = Arc(facing: mapCenter, angle: 0, radius: mapRadius, length: CGFloat.pi * 0.7, width: 5)
        rightArc.fillColor = arcColors[0]
        
        let leftArc = Arc(facing: mapCenter, angle: CGFloat.pi, radius: mapRadius, length: CGFloat.pi * 0.7, width: 5)
        leftArc.fillColor = arcColors[1]
        
        let rightBumper = CircleBumper(radius: bumperRadius)
        rightBumper.position = CGPoint(x: -mapRadius/2, y: 0)
        rightBumper.fillColor = bumperColors[0]
        
        let leftBumper = CircleBumper(radius: bumperRadius)
        leftBumper.position = CGPoint(x: mapRadius/2, y: 0)
        leftBumper.fillColor = bumperColors[1]
        
        self.addChildren(nodes: [rightArc, leftArc, rightBumper, leftBumper])
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
