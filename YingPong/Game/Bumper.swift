//
//  Bumper.swift
//  YingPong
//
//  Created by Enzo Maruffa Moreira on 25/06/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit
import SpriteKit

protocol Bumper {
    
    func node() -> SKNode
}


class CircleBumper: SKShapeNode, Bumper {
    
    var radius: CGFloat!
    
    convenience init(radius: CGFloat) {
        self.init(circleOfRadius: radius)
        self.radius = radius
        self.physicsBody = SKPhysicsBody(circleOfRadius: radius)
    }
    
    func node() -> SKNode {
        return self
    }
}

class SpriteBumper: SKSpriteNode, Bumper {
    
    convenience init(fileNamed: String) {
        let texture = SKTexture(imageNamed: fileNamed)
        self.init(texture: texture)
        self.physicsBody = SKPhysicsBody(texture: texture, size: self.size)
    }
    
    func node() -> SKNode {
        return self
    }
}
