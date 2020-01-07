//
//  CurrencyCell.swift
//  Radity
//
//  Created by Neha Yadav on 02/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    let name = ViewBuilder.label()
    let accountType = ViewBuilder.label()
    let icon = ViewBuilder.imageView()
    let eurosAmount = ViewBuilder.label()
    let dollarAmount = ViewBuilder.label()
    let vStack = ViewBuilder.stackview()
    let hStack = ViewBuilder.stackview()
    
    var eurosWidth: CGFloat = 0 {
        didSet {
            eurosAmount.widthAnchor.constraint(equalToConstant: eurosWidth).isActive = true
        }
    }
    
    var dollarWidth: CGFloat = 0 {
        didSet {
            dollarAmount.widthAnchor.constraint(equalToConstant: dollarWidth).isActive = true
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(hStack)
        setupCellView()
    }
    
    func setupCellView() {
        hStack.axis = .horizontal
        hStack.spacing = 10
        
        hStack.fillVertically(parent: contentView, margin: 8)
        hStack.fillHorizontally(parent: contentView, margin: 20)

        vStack.axis = .vertical
        vStack.spacing = 4
        vStack.addArrangedSubview(name)
        vStack.addArrangedSubview(accountType)
        vStack.backgroundColor = .red
        vStack.alignment = .leading
        hStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        name.font = UIFont.systemFont(ofSize: 16)
        accountType.font = UIFont.systemFont(ofSize: 14)
        accountType.numberOfLines = 2
        icon.widthAnchor.constraint(equalToConstant: 44).isActive = true
        icon.contentMode = .scaleAspectFit
        icon.tintColor = .darkGray
        eurosAmount.textAlignment = .right
        dollarAmount.textAlignment = .right
        hStack.addArrangedSubview(icon)
        hStack.addArrangedSubview(vStack)
        hStack.addArrangedSubview(eurosAmount)
        hStack.addArrangedSubview(dollarAmount)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct CurrencyCellRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return CurrencyCell().contentView
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct CurrencyCell_Preview: PreviewProvider {
    static var previews: some View {
        CurrencyCellRepresentable()
    }
}
#endif
