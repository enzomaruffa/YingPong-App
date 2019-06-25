//
//  CGPointExtensions.swift
//  SumoAR
//
//  Created by Enzo Maruffa Moreira on 13/06/19.
//  Copyright © 2019 Enzo Maruffa Moreira. All rights reserved.
//

import UIKit

func + (left: CGPoint, right: CGPoint) -> CGPoint
{
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func + (left: CGPoint, scalar: CGFloat) -> CGPoint
{
    return CGPoint(x: left.x + scalar, y: left.y + scalar)
}

func - (left: CGPoint, scalar: CGFloat) -> CGPoint
{
    return CGPoint(x: left.x - scalar, y: left.y - scalar)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint
{
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (left: CGPoint, scalar: CGFloat) -> CGPoint
{
    return CGPoint(x: left.x * scalar, y: left.y * scalar)
}

func / (left: CGPoint, scalar: CGFloat) -> CGPoint
{
    return CGPoint(x: left.x / scalar, y: left.y / scalar)
}


extension CGPoint {
    
    func distanceTo(_ point: CGPoint) -> CGFloat {
        return CGFloat(sqrt(pow(x - point.x, 2) + pow(y - point.y, 2)))
    }
    
    func normalized() -> CGPoint {
        let vectorLength = self.length()
        return CGPoint(x: x / vectorLength, y: y / vectorLength)
    }
    
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
}
