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
    var padColors: [UIColor]!
    
    var lightSideColor: UIColor?
    var darkSideColor: UIColor = .black
    
    var bumperRadius: CGFloat!
    
    var pads: [ControllableArc] = []
    var arcs: [Arc] = []
    var bumpers: [Bumper] = []
    var balls: [Ball] = []
    
    var ballCount = 1
    var arcProportion: CGFloat = 0.7
    var padProportion: CGFloat = 0.1
    var padWidth: CGFloat = 6
    
    var p1Clockwise = false
    var p1AntiClockwise = false
    
    var playing = false
    
    override func didMove(to view: SKView) {
        
        backgroundColor = UIColor(red: 0.9529, green: 0.9529, blue: 0.9529, alpha: 1)
        
        arcColors = [.black, .black]
        bumperColors = [.black, .white]
        padColors = [.red, .red]
        
        mapRadius = (min(view.frame.width, view.frame.height) / 1.5)
        bumperRadius = mapRadius/5
        
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        scene?.physicsWorld.gravity = .zero
        
        createMap()
        createController()
        createBalls()
    }
    
    func createMap() {
        let rightArc = Arc(facing: mapCenter, angle: 0, radius: mapRadius, length: CGFloat.pi * arcProportion, width: 3)
        rightArc.fillColor = arcColors[0]
        
        let leftArc = Arc(facing: mapCenter, angle: CGFloat.pi, radius: mapRadius, length: CGFloat.pi * arcProportion, width: 3)
        leftArc.fillColor = arcColors[1]
        
        arcs.append(rightArc)
        arcs.append(leftArc)
        
        let rightBumper = CircleBumper(radius: bumperRadius)
        rightBumper.position = CGPoint(x: -mapRadius/2, y: 0)
        rightBumper.fillColor = bumperColors[0]
        
        let leftBumper = CircleBumper(radius: bumperRadius)
        leftBumper.position = CGPoint(x: mapRadius/2, y: 0)
        leftBumper.fillColor = bumperColors[1]
        
        bumpers.append(rightBumper)
        bumpers.append(leftBumper)
        
        setStaticObjectPhysics(node: rightArc)
        setStaticObjectPhysics(node: leftArc)
        setStaticObjectPhysics(node: rightBumper)
        setStaticObjectPhysics(node: leftBumper)
        
        self.addChildren(nodes: [rightArc, leftArc, rightBumper, leftBumper])
        
        let darkSidePath = CGMutablePath()
        darkSidePath.move(to: .zero)
        darkSidePath.addArc(center: CGPoint(x: mapRadius/2, y: 0), radius: mapRadius/2, startAngle: CGFloat.pi, endAngle: 0, clockwise: false)
        darkSidePath.addArc(center: .zero, radius: mapRadius, startAngle: 0, endAngle: CGFloat.pi, clockwise: false)
        darkSidePath.addArc(center: CGPoint(x: -mapRadius/2, y: 0), radius: mapRadius/2, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
        darkSidePath.closeSubpath()
        
        let darkSideNode = SKShapeNode(path: darkSidePath)
        darkSideNode.fillColor = darkSideColor
        
        darkSideNode.zPosition = -1
        
        
        self.addChild(darkSideNode)
        
    }
    
    func createController() {
        let bottomPad = ControllableArc(withColor: padColors[0], facing: mapCenter, angle: CGFloat.pi / 2, radius: mapRadius, length: CGFloat.pi * padProportion, maxLength: CGFloat.pi * (1 - (padProportion + arcProportion)), width: padWidth)
        
        let topPad = ControllableArc(withColor: padColors[1], facing: mapCenter, angle: 3 * CGFloat.pi / 2, radius: mapRadius, length: CGFloat.pi * padProportion, maxLength: CGFloat.pi * (1 - (padProportion + arcProportion)), width: padWidth)
        
        pads.append(bottomPad)
        pads.append(topPad)
        
        setStaticObjectPhysics(node: bottomPad.arc)
        setStaticObjectPhysics(node: topPad.arc)
        
        self.addChildren(nodes: [bottomPad, topPad])
    }
    
    func createBalls() {
        for _ in 0..<ballCount {
            let ball = CircleBall(radius: 15)
            balls.append(ball)
            ball.fillColor = .black
            setBallPhysics(ball: ball)
        }
        
        self.addChildren(nodes: balls as! [SKNode])
        
    }
    
    func setStaticObjectPhysics(node: SKNode) {
        node.physicsBody?.restitution = 100
        node.physicsBody?.mass = 1000
        node.physicsBody?.pinned = true
    }
    
    func setBallPhysics(ball: Ball) {
        ball.node().physicsBody?.linearDamping = 0
        ball.node().physicsBody?.angularDamping = 0
        ball.node().physicsBody?.mass = 1
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if !playing {
            playing = true
            balls.map( {$0.node().physicsBody?.applyImpulse( CGVector.randomVector(totalLength: 100))} )
        }
        
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
        
        for ball in balls {
            let currentBallVelocity = ball.node().physicsBody?.velocity.normalized()
            
            ball.node().physicsBody?.applyForce(currentBallVelocity! + 1)
        }
        
        
        if (p1Clockwise || p1AntiClockwise) {
            for pad in pads {
                movePad(pad: pad)
            }
        }
    }
    
    func movePad(pad: ControllableArc) {
        let clockwiseMultiplier = p1Clockwise ? 1 : 0
        let antiClockwiseMultiplier = p1AntiClockwise ? -1 : 0
        
        let multiplier = CGFloat(clockwiseMultiplier + antiClockwiseMultiplier)
        
        pad.rotate(amount: 0.015 * multiplier)
    }
}
