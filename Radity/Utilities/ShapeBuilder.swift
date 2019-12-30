//
//  ShapeBuilder.swift
//  Radity
//
//  Created by Neha Yadav on 30/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

struct ShapeBuilder {
    
    static func circle(frame: CGRect) -> CGPath {
        let radius: CGFloat = 20
        let path = UIBezierPath()
        let centerWidth = frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - radius * 2), y: 0))
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 0), radius: radius, startAngle: CGFloat(360).degreesToRadians, endAngle: CGFloat(0).degreesToRadians, clockwise: false)
        path.addLine(to: CGPoint(x: (frame.width), y: 0))
        return path.cgPath
    }
    
    static func addCurve(frame: CGRect) -> CGPath {
        let radius: CGFloat = 30
        let centerWidth = frame.width / 2
        let path = UIBezierPath()
        path.move(to: CGPoint(x:0, y:0))
        path.addLine(to:CGPoint(x: (centerWidth - radius), y: 0))
        path.addQuadCurve(to: CGPoint(x: (centerWidth + radius), y:0), controlPoint: CGPoint(x:centerWidth, y:-30))
        path.addLine(to: CGPoint(x: (frame.width), y: 0))
        return path.cgPath
    }
    
   static func oval(frame: CGRect) -> CGPath {
        let centerWidth = frame.width / 2
        let distance: CGFloat = 30
        let height: CGFloat = 30
        let path = UIBezierPath(ovalIn: CGRect(x: centerWidth - distance , y: -(height / 2), width: distance * 2, height: height))
        return path.cgPath
    }
    
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
