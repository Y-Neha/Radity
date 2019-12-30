//
//  TabBarController.swift
//  Radity
//
//  Created by Neha Yadav on 23/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let portfoliosVC = PortfoliosViewController()
        let walletVC = PortfoliosViewController()
        let homeVC = HomeViewController()
        let notificationVC = PortfoliosViewController()
        let moreVC = MoreViewController()
        
        portfoliosVC.tabBarItem = UITabBarItem(title: "Portfolio", image: UIImage(systemName: "bitcoinsign.circle.fill"), selectedImage: nil)
        walletVC.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(systemName: "bag.fill"), selectedImage: nil)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        notificationVC.tabBarItem = UITabBarItem(title: "Notification", image: UIImage(systemName: "bell.fill"), selectedImage: nil)
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "text.alignleft"), selectedImage: nil)
        viewControllers = [portfoliosVC, walletVC, homeVC, notificationVC, moreVC]
        tabBar.addShape()
    }

}




