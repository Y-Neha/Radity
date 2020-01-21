//
//  MoreViewController.swift
//  Radity
//
//  Created by Neha Yadav on 23/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit
import SkeletonView

class MarketViewController: UIViewController {
    
    let tableView = ViewBuilder.tableView()
    let identifier = "marketCell"
    let headerIdentifier = "header"
    let upIcon = UIImage(systemName: "arrowtriangle.up")
    let downIcon = UIImage(systemName: "arrowtriangle.down")
    var isAscending = true
    var isDataLoaded = false
    
    var marketCoins:[MarketCoin] = [] {
        didSet{
            let dollarflatmap = marketCoins.compactMap {getWidth($0.price_usd)}
            MarketCell.dollarWidth = dollarflatmap.max() ?? 0
            let dollarChangeflatmap = marketCoins.compactMap {getWidth($0.percent_change_24h)}
            MarketCell.dollarChangeWidth = dollarChangeflatmap.max() ?? 0
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func getWidth(_ string: String) -> CGFloat {
        return NSString(string: string).size(withAttributes: [.font : UIFont.systemFont(ofSize: 20)]).width
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(rgb: 0x0f1847)
        tableView.isSkeletonable = true
        setupTableview()
        marketCoins = MarketCoin.mockDataList
        MarketService.getMarketData(url: "https://api.coinlore.com/api/tickers/") { [weak self] list in
            self?.isDataLoaded = true
            self?.marketCoins = list.data
        }
    }
    
    func setupTableview() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.fillHorizontally(parent: view)
        tableView.separatorColor = .white
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.register(MarketCell.self, forCellReuseIdentifier: identifier)
    }
    
    func setupHeaderView(frame: CGRect) -> UIView {
        
        let headerView = UIView(frame: frame)
        headerView.backgroundColor = .green
        let hStack = ViewBuilder.stackview()
        hStack.axis = .horizontal
        hStack.distribution = .fillProportionally
        
        headerView.addSubview(hStack)
        hStack.fillHorizontally(parent: headerView, margin: 20)
        hStack.fillVertically(parent: headerView)
        let rankButton = ViewBuilder.button()
        let dollarPriceLabel = ViewBuilder.label()
        let priceChangeLabel = ViewBuilder.label()
        rankButton.setTitle("Rank", for: .normal)
        rankButton.setTitleColor(.white, for: .normal)
        rankButton.titleLabel?.font = UIFont(name: "Avenir", size: 16)
        rankButton.setImage(upIcon, for: .normal)
        rankButton.imageView?.contentMode = .scaleAspectFit
        rankButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        rankButton.semanticContentAttribute = .forceRightToLeft
        rankButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        dollarPriceLabel.text = "Price"
        dollarPriceLabel.textColor = .white
        dollarPriceLabel.textAlignment = .right
        dollarPriceLabel.font = UIFont(name: "Avenir", size: 16)
        
        priceChangeLabel.text = "Change"
        priceChangeLabel.textColor = .white
        priceChangeLabel.textAlignment = .right
        priceChangeLabel.font = UIFont(name: "Avenir", size: 16)
        hStack.addArrangedSubview(rankButton)
        hStack.addArrangedSubview(dollarPriceLabel)
        hStack.addArrangedSubview(priceChangeLabel)
        rankButton.addTarget(self, action: #selector(rankPressed(sender:)), for: .touchUpInside)
        return headerView
    }
    
    @objc func rankPressed(sender: UIButton) {
        //TODO: change image of a rank button when toggled, not working
        isAscending = !isAscending
        marketCoins = isAscending ? sortMarketInDescOrderByRank().reversed() : sortMarketInDescOrderByRank()
        let icon = isAscending ? upIcon : downIcon
        sender.setImage(icon, for: .normal)
    }
    
    func sortMarketInDescOrderByRank() -> [MarketCoin] {
        //TODO: add more generics to a sort function
        let sortedArray = marketCoins.propertySorted({$0.rank})
        return sortedArray
    }
}

extension MarketViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MarketCell(style: .default, reuseIdentifier: "Header")
        header.rank.text = "Rank"
        header.rank.font = .systemFont(ofSize: 16)
        header.dollarAmount.text = "Price"
        header.dollarAmount.font = .systemFont(ofSize: 16)
        header.dollarChange.text = "Change"
        header.dollarChange.font = .systemFont(ofSize: 16)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension MarketViewController: SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketCoins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MarketCell
        let coin = marketCoins[indexPath.row]
        cell.show(marketCoin: coin, animate: !isDataLoaded)
        return cell
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return identifier
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
