//
//  Array+Extension.swift
//  Radity
//
//  Created by Neha Yadav on 13/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import Foundation

extension Array {
    func propertySorted<T: Comparable>(_ property: (Element) -> T) -> [Element] {
        return sorted(by: {property($0) > property($1)})
    }
}
