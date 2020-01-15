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
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
        
        let portfoliosVC = PortfoliosViewController()
        let walletVC = WalletViewController()
        let homeVC = HomeViewController()
        let moreVC = MoreViewController()
        let marketVC = MarketViewController()
        

        portfoliosVC.tabBarItem = UITabBarItem(title: "Portfolio", image: UIImage(systemName: "bitcoinsign.circle.fill"), selectedImage: nil)
        walletVC.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(systemName: "bag.fill"), selectedImage: nil)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: nil)
        moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle"), selectedImage: nil)
        marketVC.tabBarItem = UITabBarItem(title: "Market", image: UIImage(systemName: "dollarsign.circle.fill"), selectedImage: nil)
        viewControllers = [portfoliosVC, walletVC, homeVC, marketVC, moreVC]
        tabBar.addShape()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        selectedIndex = 2
    }
}





