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
    
    var dollarWidth: CGFloat = 0
    var dollarChangeWidth: CGFloat = 0
    
    var marketCoins:[MarketCoin] = [] {
        didSet{
            let dollarflatmap = marketCoins.compactMap {getWidth($0.price_usd)}
            dollarWidth = dollarflatmap.max() ?? 0
            let dollarChangeflatmap = marketCoins.compactMap {getWidth($0.percent_change_24h)}
            dollarChangeWidth = dollarChangeflatmap.max() ?? 0
            tableView.reloadData()
        }
    }
    
    func getWidth(_ string: String) -> CGFloat {
        return NSString(string: string).size(withAttributes: [.font : UIFont.systemFont(ofSize: 20)]).width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
        MarketService.getMarketData(url: "https://api.coinlore.com/api/tickers/") { (list) in
            self.marketCoins = list.data
        }
        //TODO: Ascending and descending order common function
    }
    
    func setupTableview() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.fillHorizontally(parent: view)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.register(MarketCell.self, forCellReuseIdentifier: identifier)
    }
    
    func setupHeaderView(frame: CGRect) -> UIView {
        
        let headerView = UIView(frame: frame)
        let hStack = ViewBuilder.stackview()
        hStack.axis = .horizontal
        hStack.backgroundColor = .green
        hStack.distribution = .fillProportionally
        
        headerView.addSubview(hStack)
        hStack.fill(parent: headerView)
        hStack.fillHorizontally(parent: headerView, margin: 20)
        
        let width1 = dollarWidth == 0 ? 60 : dollarWidth
        let width2 = dollarChangeWidth == 0 ? 60 : dollarChangeWidth
        
        let rankButton = ViewBuilder.button()
        let dollarPriceLabel = ViewBuilder.label()
        let priceChangeLabel = ViewBuilder.label()
        rankButton.setTitle("Rank", for: .normal)
        rankButton.setTitleColor(.white, for: .normal)
        rankButton.titleLabel?.font = UIFont(name: "Avenir-Black", size: 16)
        rankButton.widthAnchor.constraint(equalToConstant: 60).isActive = true

        dollarPriceLabel.text = "Price"
        dollarPriceLabel.textColor = .white
        dollarPriceLabel.textAlignment = .right
        dollarPriceLabel.font = UIFont(name: "Avenir-Black", size: 16)

        dollarPriceLabel.widthAnchor.constraint(equalToConstant: width1).isActive = true
        priceChangeLabel.text = "Change"
        priceChangeLabel.textColor = .white
        priceChangeLabel.textAlignment = .right
        priceChangeLabel.font = UIFont(name: "Avenir-Black", size: 16)
        //work
        priceChangeLabel.widthAnchor.constraint(equalToConstant: width2).isActive = true
        hStack.addArrangedSubview(rankButton)
        hStack.addArrangedSubview(dollarPriceLabel)
        hStack.addArrangedSubview(priceChangeLabel)
        return headerView
    }
}


extension MarketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketCoins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MarketCell
        let marketCoin = marketCoins[indexPath.row]
        cell.symbol.text = marketCoin.symbol
        cell.name.text = marketCoin.name
        cell.rank.text = "\(marketCoin.rank)"
        cell.dollarAmount.text = "$\(marketCoin.price_usd)"
        cell.dollarChange.text = "$\(marketCoin.percent_change_24h)"
        cell.dollarWidth = dollarWidth
        cell.dollarChangeWidth = dollarChangeWidth
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension MarketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = setupHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
        let isHidden = marketCoins.count == 0 ? true : false
        headerView.isHidden = isHidden
        
        headerView.backgroundColor = UIColor(rgb: 0x0f1847)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MarketViewControllerRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return MarketViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct MarketViewController_Preview: PreviewProvider {
    static var previews: some View {
        MarketViewControllerRepresentable()
    }
}
#endif
