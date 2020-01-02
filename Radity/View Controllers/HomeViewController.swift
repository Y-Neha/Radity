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
    let balanceLabel = ViewBuilder.label()
    let balanceAmount = ViewBuilder.label()
    
    
    let cryptoStack = ViewBuilder.stackview()
    let cashStack = ViewBuilder.stackview()
    let custodyStack = ViewBuilder.stackview()
    let cryptoLabel = ViewBuilder.label()
    let cryptoAmount = ViewBuilder.label()
    let cashLabel = ViewBuilder.label()
    let cashAmount = ViewBuilder.label()
    let custodyLabel = ViewBuilder.label()
    let custodyAmount = ViewBuilder.label()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupHomeView()
        
        let sliderVC = SliderViewController()
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
        
        //TODO: change font size and check spacing between balance and its amount
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
