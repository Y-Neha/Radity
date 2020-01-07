//
//  MoreViewController.swift
//  Radity
//
//  Created by Neha Yadav on 23/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {
    
    var marketCoins:[MarketCoin] = [] {
        didSet{
            print("Received Data")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        MarketService.getMarketData(url: "https://api.coinlore.com/api/tickers/") { (list) in
            self.marketCoins = list.data
            print("MarketService", list.data)
        }
    }
}
