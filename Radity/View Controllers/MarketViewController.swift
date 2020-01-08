//
//  MoreViewController.swift
//  Radity
//
//  Created by Neha Yadav on 23/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {
    
    let tableView = ViewBuilder.tableView()
    let identifier = "marketCell"
    
    var marketCoins:[MarketCoin] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        MarketService.getMarketData(url: "https://api.coinlore.com/api/tickers/") { (list) in
            self.marketCoins = list.data
        }
    }
    
    func setupTableview() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.fill(parent: view)
        //TODO: safe area constraints
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: identifier)
    }
}

extension MarketViewController: UITableViewDelegate {
    
}

extension MarketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketCoins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CurrencyCell
        let marketCoin = marketCoins[indexPath.row]
        cell.name.text = marketCoin.symbol
        cell.accountType.text = marketCoin.name
        cell.eurosAmount.text = "$\(marketCoin.percent_change_24h)"
        cell.dollarAmount.text = "$\(marketCoin.price_usd)"
        cell.icon.image = UIImage(systemName: "bitcoinsign.circle")
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
