//
//  Float+Extension.swift
//  Radity
//
//  Created by Neha Yadav on 14/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import Foundation

extension Float {
    func addCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
