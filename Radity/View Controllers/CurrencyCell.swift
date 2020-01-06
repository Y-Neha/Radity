//
//  CurrencyCell.swift
//  Radity
//
//  Created by Neha Yadav on 02/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    let bankName = ViewBuilder.label()
    let accountType = ViewBuilder.label()
    let imageview = ViewBuilder.imageView()
    let vStack = ViewBuilder.stackview()
    let hStack = ViewBuilder.stackview()
    let eurosAmount = ViewBuilder.label()
    let dollarAmount = ViewBuilder.label()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(hStack)
        setupCellView()
    }
    
    func setupCellView() {
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 10
        
        hStack.fill(parent: contentView, margin: 4)
        
        vStack.axis = .vertical
        vStack.spacing = 4
        vStack.addArrangedSubview(bankName)
        vStack.addArrangedSubview(accountType)
        
        bankName.text = "HDFC"
        bankName.font = UIFont.systemFont(ofSize: 16)
        accountType.text = "Euro Account"
        accountType.font = UIFont.systemFont(ofSize: 14)
        accountType.numberOfLines = 2

        
        imageview.image = UIImage(systemName: "h.circle")
        imageview.contentMode = .scaleAspectFit
        
        eurosAmount.text = "€2,020"
        dollarAmount.text = "$2,240"
        
        hStack.addArrangedSubview(imageview)
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
