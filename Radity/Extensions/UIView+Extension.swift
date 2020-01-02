//
//  TableView.swift
//  Meals
//
//  Created by Neha Yadav on 03/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

extension UIView {
    func fill(parent: UIView, margin: CGFloat = 0) {
        fillHorizontally(parent: parent, margin: margin)
        fillVertically(parent: parent, margin: margin)
    }
    func fillHorizontally(parent: UIView, margin: CGFloat = 0) {
        leadingAnchor.align(with: parent.leadingAnchor, margin: margin)
        trailingAnchor.align(with: parent.trailingAnchor, margin: -margin)
    }
    func fillVertically(parent: UIView, margin: CGFloat = 0) {
        topAnchor.align(with: parent.topAnchor, margin: margin)
        bottomAnchor.align(with: parent.bottomAnchor, margin: -margin)
    }
}

extension NSLayoutXAxisAnchor {
    func align(with: NSLayoutXAxisAnchor, margin: CGFloat = 0) {
        constraint(equalTo: with, constant: margin).isActive = true
    }
    
    func centerHorizontally(with: NSLayoutXAxisAnchor) {
        
    }
}

extension NSLayoutYAxisAnchor {
    func align(with: NSLayoutYAxisAnchor, margin: CGFloat = 0) {
        constraint(equalTo: with, constant: margin).isActive = true
    }
}
