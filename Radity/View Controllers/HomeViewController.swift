//
//  HomeViewController.swift
//  Radity
//
//  Created by Neha Yadav on 23/12/19.
//  Copyright © 2019 Neha Yadav. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let containerView = ViewBuilder.view()
    let vStack = ViewBuilder.stackview()
    let hStack = ViewBuilder.stackview()
    let balanceStack = ViewBuilder.stackview()
    let cryptoStack = ViewBuilder.stackview()
    let cashStack = ViewBuilder.stackview()
    let custodyStack = ViewBuilder.stackview()
    
    let balanceLabel = ViewBuilder.label()
    let balanceAmount = ViewBuilder.label()
    let cryptoLabel = ViewBuilder.label()
    let cryptoAmount = ViewBuilder.label()
    let cashLabel = ViewBuilder.label()
    let cashAmount = ViewBuilder.label()
    let custodyLabel = ViewBuilder.label()
    let custodyAmount = ViewBuilder.label()
    
    let tableView = ViewBuilder.tableView
    let tableViewIdentifier = "tableCell"
    

    var wallet = Wallet(coinList: [Coin(id: 90, symbol: "BTC", name: "Bitcoin", price_usd: "7309.76"),
    Coin(id: 80, symbol: "ETH", name: "Ethereum", price_usd: "131.95"),
    Coin(id: 58, symbol: "XRP", name: "XRP", price_usd: "0.192645"),
    Coin(id: 1, symbol: "LTC", name: "Litecoin", price_usd: "41.58"),
    Coin(id: 2321, symbol: "BCH", name: "Bitcoin Cash", price_usd: "212.45")], accounList: [
    BankAccount(name: "HSBC", accountType: "Euro Account", price: "2020", currency: "euro", price_usd: "2240"),
    BankAccount(name: "Credit Suisse", accountType: "USD Custody", price: "1340", currency: "usd", price_usd: "1340"),
    BankAccount(name: "UBS", accountType: "CHF Account", price: "1471", currency: "CHF", price_usd: "1500")]) {
        didSet {
            tableView.reloadData()
        }
    }
    
    //    let wallet = Wallet(coinList: self.coins, accounList: )
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupHomeView()
        
        let sliderVC = SliderViewController()
        sliderVC.contentView = setupSliderView()
        addChild(sliderVC)
        view.addSubview(sliderVC.view)
        
    }
    
    func setupHomeView() {
        view.addSubview(containerView)
        containerView.addSubview(vStack)
        
        setupContainerView()
        setupVStackView()
        setupHStackView()
        setupBalanceStackView()
        setupCurrencyStackView()
        setupLabels()
    }
    
    func setupContainerView() {
        containerView.fillHorizontally(parent: view)
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.backgroundColor = UIColor(rgb: 0x0f1847)
    }
    
    func setupVStackView() {
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.spacing = 50
        vStack.fillHorizontally(parent: containerView)
        vStack.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 80).isActive = true
        vStack.addArrangedSubview(balanceStack)
        vStack.addArrangedSubview(hStack)
    }
    
    func setupBalanceStackView() {
        balanceStack.axis = .vertical
        balanceStack.spacing = 0
        balanceStack.addArrangedSubview(balanceLabel)
        balanceStack.addArrangedSubview(balanceAmount)
    }
    
    func setupHStackView() {
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.centerXAnchor.constraint(equalTo: vStack.centerXAnchor).isActive = true
        hStack.addArrangedSubview(cryptoStack)
        hStack.addArrangedSubview(cashStack)
        hStack.addArrangedSubview(custodyStack)
    }
    
    func setupCurrencyStackView() {
        cryptoStack.axis = .vertical
        cashStack.axis = .vertical
        custodyStack.axis = .vertical
        
        cryptoStack.spacing = 0
        cashStack.spacing = 0
        custodyStack.spacing = 0
        
        cryptoStack.addArrangedSubview(cryptoLabel)
        cryptoStack.addArrangedSubview(cryptoAmount)
        
        cashStack.addArrangedSubview(cashLabel)
        cashStack.addArrangedSubview(cashAmount)
        
        custodyStack.addArrangedSubview(custodyLabel)
        custodyStack.addArrangedSubview(custodyAmount)
    }
    
    func setupLabels() {
        balanceLabel.text = "BALANCE"
        balanceLabel.textColor = .white
        balanceLabel.font = UIFont(name: "Avenir", size: 12)
        balanceLabel.textAlignment = .center
        
        balanceAmount.text = "$7,459.50"
        balanceAmount.textColor = .white
        balanceAmount.font = UIFont(name: "Avenir-Black", size: 36)
        balanceAmount.textAlignment = .center
        
        cryptoLabel.text = "CRYPTO"
        cryptoLabel.textColor = .white
        cryptoLabel.textAlignment = .center
        cryptoLabel.font = UIFont(name: "Avenir", size: 12)
        
        cryptoAmount.text = "$1,585"
        cryptoAmount.textColor = .white
        cryptoAmount.font = UIFont(name: "Avenir-Black", size: 24)
        cryptoAmount.textAlignment = .center
        
        cashLabel.text = "CASH"
        cashLabel.textColor = .white
        cashLabel.textAlignment = .center
        cashLabel.font = UIFont(name: "Avenir", size: 12)
        
        cashAmount.text = "$792"
        cashAmount.textColor = .white
        cashAmount.font = UIFont(name: "Avenir-Black", size: 24)
        cashAmount.textAlignment = .center
        
        custodyLabel.text = "CUSTODY"
        custodyLabel.textColor = .white
        custodyLabel.textAlignment = .center
        custodyLabel.font = UIFont(name: "Avenir", size: 12)
        
        custodyAmount.text = "$5,081"
        custodyAmount.textColor = .white
        custodyAmount.font = UIFont(name: "Avenir-Black", size: 24)
        custodyAmount.textAlignment = .center
    }
    
    func setupSliderView() -> UIView {
        let tableViewContainer = ViewBuilder.view()
        tableViewContainer.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: tableViewIdentifier)
        tableView.fill(parent: tableViewContainer)
        tableView.topAnchor.constraint(equalTo: tableViewContainer.topAnchor).isActive = true
        tableView.tableFooterView = UIView()
        return tableViewContainer
    }
}


extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(section)
//        print(wallet.coinList.count)
//        print(wallet.accounList.count)
//        let walletMirror = Mirror(reflecting: wallet)
        
         

        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier, for: indexPath) as! CurrencyCell
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var properties = [String?]()
        let walletMirror = Mirror(reflecting: wallet)
        for label in walletMirror.children {
            properties.append(label.label)
        }
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ViewBuilder.view()
        headerView.backgroundColor = UIColor(rgb: 0xEBEBEB)
        let isHidden = section == 0 ? true : false
        headerView.isHidden = isHidden
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct HomeViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return HomeViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        HomeViewRepresentable()
    }
}
#endif
