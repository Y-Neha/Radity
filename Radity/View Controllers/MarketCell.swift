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
    let vStack = ViewBuilder.stackview()
    let hStack = ViewBuilder.stackview()
    
    lazy var animatedViews: [UIView] = {
        let views = [symbol, name, rank, dollarAmount, dollarChange, vStack, hStack]
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
        contentView.backgroundColor = UIColor(rgb: 0x0f1847)
        contentView.addSubview(hStack)
        setupCellView()
    }
    
    func animated(flag: Bool) {
        animatedViews.forEach { flag ? $0.showAnimatedSkeleton() : $0.hideSkeleton() }
    }
    
    func show(marketCoin: MarketCoin?) {
        guard let marketCoin = marketCoin else {
            animated(flag: true)
            return
        }
        symbol.text = marketCoin.symbol
        name.text = marketCoin.name
        rank.text = "\(marketCoin.rank)"
        if let dollar = Float(marketCoin.price_usd) {
            dollarAmount.text = "$\(dollar.addCommas())"
        }
        if let change = Float(marketCoin.percent_change_24h) {
            dollarChange.text = "$\(change.addCommas())"
        }
        animated(flag: false)
    }
    
    func setupCellView() {
        hStack.axis = .horizontal
        hStack.spacing = 10
//        hStack.backgroundColor = UIColor(rgb: 0x0f1847)
        
        hStack.fillVertically(parent: contentView, margin: 8)
        hStack.fillHorizontally(parent: contentView, margin: 20)

        vStack.axis = .vertical
        vStack.spacing = 4
        vStack.addArrangedSubview(symbol)
        vStack.addArrangedSubview(name)
        vStack.backgroundColor = .red
        vStack.alignment = .leading
        hStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        symbol.font = UIFont(name: "Avenir-Black", size: 16)
        symbol.textColor = .white
        name.numberOfLines = 2
        name.font = UIFont(name: "Avenir", size: 14)
        name.textColor = .white
        rank.font = UIFont(name: "Avenir", size: 12)
        rank.textColor = .white
        rank.widthAnchor.constraint(equalToConstant: 24).isActive = true
        dollarAmount.textAlignment = .right
        dollarChange.textAlignment = .right
        dollarAmount.font = UIFont(name: "Avenir-Black", size: 16)
        dollarChange.font = UIFont(name: "Avenir-Black", size: 16)
        dollarAmount.textColor = .white
        dollarChange.textColor = .white
        hStack.addArrangedSubview(rank)
        hStack.addArrangedSubview(vStack)
        hStack.addArrangedSubview(dollarAmount)
        hStack.addArrangedSubview(dollarChange)
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

