//
//  UITabBar+Extension.swift
//  Radity
//
//  Created by Neha Yadav on 30/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

extension UITabBar {

     func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circle()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        self.layer.insertSublayer(shapeLayer, at: 0)
    }

    override open func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    func circle() -> CGPath {
        let radius: CGFloat = 20
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - radius * 2), y: 0))
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 0), radius: radius, startAngle: CGFloat(180).degreesToRadians, endAngle: CGFloat(0).degreesToRadians, clockwise: true)
        path.addLine(to: CGPoint(x: (frame.width), y: 0))
        return path.cgPath
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
