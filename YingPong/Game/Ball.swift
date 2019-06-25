//
//  Ball.swift
//  YingPong
//
//  Created by Enzo Maruffa Moreira on 25/06/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import SpriteKit

protocol Ball {
    
    func node() -> SKNode
}



class CircleBall: SKShapeNode, Ball {
    
    var radius: CGFloat!
    
    convenience init(radius: CGFloat) {
        self.init(circleOfRadius: radius)
        self.radius = radius
    }
    
    func node() -> SKNode {
        return self
    }
}

class SpriteBall: SKSpriteNode, Ball {
    
    convenience init(fileNamed: String) {
        let texture = SKTexture(imageNamed: fileNamed)
        self.init(texture: texture)
    }
    
    func node() -> SKNode {
        return self
    }
}
