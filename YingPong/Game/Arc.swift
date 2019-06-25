//
//  Arc.swift
//  YingPong
//
//  Created by Enzo Maruffa Moreira on 25/06/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit
import SpriteKit

class Arc: SKShapeNode {
    
    convenience init(facing center: CGPoint, angle: CGFloat, radius: CGFloat, length: CGFloat, width: CGFloat = 1) {
        
        let startAngle = angle - length/2
        let endAngle = angle + length/2
        
        let arcStart = CGPoint(x: radius * cos(startAngle), y: radius * sin(startAngle))
        
        let clockwise = false
        
        let path = CGMutablePath()
        
        print("Creating arc...")
        print("Start...", startAngle)
        print("End...", endAngle)
        
        print(arcStart)
        path.move(to: arcStart)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        path.addArc(center: center, radius: radius + width, startAngle: endAngle, endAngle: startAngle, clockwise: !clockwise)
        
        path.closeSubpath()
        
        self.init(path: path)
    }
    
}
