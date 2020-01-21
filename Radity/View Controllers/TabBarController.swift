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
        
        let vc1 = UINavigationController(rootViewController: PortfoliosViewController())
        let vc2 = UINavigationController(rootViewController: WalletViewController())
        let vc3 = UINavigationController(rootViewController: HomeViewController())
        let vc4 = UINavigationController(rootViewController: MarketViewController())
        let vc5 = UINavigationController(rootViewController: MoreViewController())

        vc1.tabBarItem = UITabBarItem(title: "Portfolio", image: UIImage(systemName: "bitcoinsign.circle.fill"), selectedImage: nil)
        vc2.tabBarItem = UITabBarItem(title: "Wallet", image: UIImage(systemName: "bag.fill"), selectedImage: nil)
        vc3.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        vc4.tabBarItem = UITabBarItem(title: "Market", image: UIImage(systemName: "dollarsign.circle.fill"), selectedImage: nil)
        vc5.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle"), selectedImage: nil)
        
        viewControllers = [vc3, vc1, vc4, vc5]
    }
}





