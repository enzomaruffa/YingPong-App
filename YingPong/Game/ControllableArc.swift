//
//  ControllableArc.swift
//  YingPong
//
//  Created by Enzo Maruffa Moreira on 26/06/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit
import SpriteKit

class ControllableArc: SKShapeNode {
    
    var minAngle: CGFloat!
    var startingAngle: CGFloat!
    var maxAngle: CGFloat!
    
    var arc: Arc!
    
    convenience init(withColor color: UIColor, facing center: CGPoint, angle: CGFloat, radius: CGFloat, length: CGFloat, maxLength: CGFloat, width: CGFloat = 1) {
        
        
        self.init(rectOf: CGSize(width: length, height: radius))
        self.lineWidth = 0
        
        print(length)
        print(maxLength)
        
        arc = Arc(facing: center, angle: angle, radius: radius, length: length, width: width)
        arc.fillColor = color
        
        startingAngle = angle
        minAngle = angle - maxLength/2
        maxAngle = angle + maxLength/2
        
        self.addChild(arc)
    }
    
    func rotate(amount: CGFloat) {
        if self.zRotation + amount + startingAngle > minAngle && self.zRotation + amount + startingAngle < maxAngle {
            self.zRotation += amount
        }
    }
    
}
