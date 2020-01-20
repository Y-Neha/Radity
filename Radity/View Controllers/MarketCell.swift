//
//  MarketCell.swift
//  Radity
//
//  Created by Neha Yadav on 09/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import UIKit

class MarketCell: UITableViewCell {
    
    let symbol = ViewBuilder.label()
    let name = ViewBuilder.label()
    let rank = ViewBuilder.label()
    let dollarAmount = ViewBuilder.label()
    let dollarChange = ViewBuilder.label()
    
    let container = ViewBuilder.view()
    let nameContainer = ViewBuilder.view()
    
    lazy var animatedViews: [UIView] = {
        let views = [rank, symbol, name, dollarAmount, dollarChange]
        views.forEach { $0.isSkeletonable = true }
        return views
    }()
    
    var dollarWidth: CGFloat = 0 {
        didSet {
            dollarAmount.widthAnchor.constraint(equalToConstant: dollarWidth).isActive = true
        }
    }
    
    var dollarChangeWidth: CGFloat = 0 {
        didSet {
            dollarChange.widthAnchor.constraint(equalToConstant: dollarChangeWidth).isActive = true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(container)
        container.backgroundColor = UIColor(rgb: 0x0f1847)
        container.fill(parent: contentView)
        container.heightAnchor.constraint(equalToConstant: 66).isActive = true
        
        constructCell()
    }
    
    func hideAnimation() {
        animatedViews.forEach { $0.hideSkeleton() }
    }
    
    func showAnimation() {
        animatedViews.forEach { $0.showAnimatedGradientSkeleton() }
    }
    
    func show(marketCoin: MarketCoin, animate: Bool, dollarWidth: CGFloat, dollarChangeWidth: CGFloat) {
        
        symbol.text = marketCoin.symbol
        name.text = marketCoin.name
        rank.text = "\(marketCoin.rank)"
        if let dollar = Float(marketCoin.price_usd) {
            dollarAmount.text = "$\(dollar.addCommas())"
        }
        if let change = Float(marketCoin.percent_change_24h) {
            dollarChange.text = "$\(change.addCommas())"
        }
        animate ? showAnimation() : hideAnimation()
    }
    
    func constructCell() {

        container.addSubview(rank)
        container.addSubview(nameContainer)
        container.addSubview(dollarAmount)
        container.addSubview(dollarChange)
        
        nameContainer.addSubview(name)
        nameContainer.addSubview(symbol)
    
        rank.font = UIFont(name: "Avenir", size: 12)
        rank.textColor = .white
//        rank.text = "Rank"
        rank.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        rank.fillVertically(parent: container, margin: 20)
        rank.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameContainer.fillVertically(parent: container)
        nameContainer.leadingAnchor.constraint(equalTo: rank.trailingAnchor, constant: 10).isActive = true
        nameContainer.trailingAnchor.constraint(equalTo: dollarAmount.leadingAnchor, constant: -10).isActive = true

        symbol.font = UIFont(name: "Avenir-Black", size: 16)
        symbol.textColor = .white
//        symbol.text = "BTC"
        symbol.topAnchor.constraint(equalTo: nameContainer.topAnchor, constant: 8).isActive = true

//        name.text = "Bitcoin"
        name.textColor = .white
        name.font = UIFont(name: "Avenir-Black", size: 16)
        name.numberOfLines = 2
        name.bottomAnchor.constraint(equalTo: nameContainer.bottomAnchor, constant: -8).isActive = true
        
//        dollarAmount.text = "$1245"
        dollarAmount.font = UIFont(name: "Avenir-Black", size: 16)
        dollarAmount.textColor = .white
        dollarAmount.textAlignment = .right
        dollarAmount.fillVertically(parent: container, margin: 20)

//        dollarChange.text = "$77"
        dollarChange.textColor = .white
        dollarChange.font = UIFont(name: "Avenir-Black", size: 16)
        dollarChange.textAlignment = .right
        dollarChange.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        dollarChange.fillVertically(parent: container, margin: 20)
        dollarChange.leadingAnchor.constraint(equalTo: dollarAmount.trailingAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct MarketCellRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return MarketCell().contentView
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct MarketCell_Preview: PreviewProvider {
    static var previews: some View {
        MarketCellRepresentable()
    }
}
#endif

