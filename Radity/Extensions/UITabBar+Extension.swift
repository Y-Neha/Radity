//
//  UITabBar+Extension.swift
//  Radity
//
//  Created by Neha Yadav on 30/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

extension UITabBar {
    
    override open func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = ShapeBuilder.addCurve(frame: self.frame)
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        self.layer.insertSublayer(shapeLayer, at: 0)
    }
}




