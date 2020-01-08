//
//  ViewBuilder.swift
//  Meals
//
//  Created by Neha Yadav on 03/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

struct ViewBuilder {
    static func tableView() -> UITableView  {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }
    
    static let largeTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name: "Avenir-Black", size: 26)
        title.numberOfLines = 2
        return title
    }()
    
    static let searchBar: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9776470065, green: 0.9480788112, blue: 0.9354968667, alpha: 1)
        view.layer.cornerRadius = 8

        let textfield = UITextField()
        textfield.placeholder = "What do you want to cook?"
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.font : UIFont(name: "Avenir-Medium", size: 14)
        ]
        textfield.attributedPlaceholder = NSAttributedString(string: "What do you want to cook?", attributes: attributes as [NSAttributedString.Key : Any])
        textfield.font = UIFont(name: "Avenir-Medium", size: 16)
        

        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "magnifyingglass")
        imageview.tintColor = .gray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        textfield.translatesAutoresizingMaskIntoConstraints = false
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textfield)
        view.addSubview(imageview)
        
        textfield.fillVertically(parent: view)
        
        textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        imageview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        imageview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        return view
    }()
    
    static func collectionView(frame: CGRect) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .clear
        return collectionView
    }
    
    static func imageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }
    
    static func view() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    static func label() -> UILabel {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func stackview() -> UIStackView {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.spacing = 10        
        return stackview
    }
    
    static func textfield() -> UITextField {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }
    
    static func button() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
}
