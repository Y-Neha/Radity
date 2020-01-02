//
//  SliderViewController.swift
//  Meals
//
//  Created by Neha Yadav on 16/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import Foundation
import UIKit

class SliderViewController: UIViewController {
    var offset: CGFloat = 60
    var contentView: UIView = UIView()
    
    private var recognizer: UIPanGestureRecognizer!
    private let anchor = UIView()
    private lazy var upperY: CGFloat = { view.frame.height * 1.5 }()
    private lazy var lowerY: CGFloat = { view.frame.height / 2 + offset }()
    private lazy var midY: CGFloat = { lowerY + 240 }()
    
    private func clamp(value: CGFloat) -> CGFloat { [lowerY, midY, upperY].min { abs($0 - value) < abs($1 - value)}! }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFrame()
        setupView()
        setupGesture()
        setupAnchor()
        setupContentView()
        
        
        //        //TODO: FixMe
        //        view.center = CGPoint(x: view.center.x, y: midY)
        //        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
    private func setupFrame() {
        if let frame = parent?.view.frame {
            view.frame = CGRect(x: 0, y: frame.height - offset, width: frame.width, height: frame.height - offset)
        }
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        view.layer.shadowOpacity = 0.2
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 15
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func setupGesture() {
        recognizer = UIPanGestureRecognizer(target: self, action: #selector(onMove(recognizer:)))
        view.addGestureRecognizer(recognizer)
    }
    
    private func setupAnchor() {
        view.addSubview(anchor)
        anchor.backgroundColor = .init(white: 0.8, alpha: 1)
        anchor.layer.cornerRadius = 2
        anchor.translatesAutoresizingMaskIntoConstraints = false
        anchor.heightAnchor.constraint(equalToConstant: 4).isActive = true
        anchor.widthAnchor.constraint(equalToConstant: 40).isActive = true
        anchor.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        anchor.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    }
    
    private func setupContentView() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: anchor.bottomAnchor, constant: 20).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    @objc private func onMove(recognizer: UIPanGestureRecognizer) {
        
        guard let view = recognizer.view else { return }
        
        if recognizer.state == .began || recognizer.state == .changed {
            let translation = recognizer.translation(in: self.view)
            var point = CGPoint(x: view.center.x, y: view.center.y + translation.y)
            point.y = min(max(point.y, lowerY), upperY)
            view.center = point
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            let velocity = recognizer.velocity(in: self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude / 200
            let slideFactor = 0.3 * slideMultiplier
            var point = CGPoint(x: view.center.x, y: view.center.y + (velocity.y * slideFactor))
            point.y = clamp(value: point.y)
            UIView.animate( withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                view.center = point
            }, completion: nil)
        }
    }
}
