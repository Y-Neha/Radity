//
//  MarketService.swift
//  Radity
//
//  Created by Neha Yadav on 07/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import Foundation
import Alamofire

struct MarketService {
    
    static func getMarketData(url: String, completionHandler: @escaping (MarketCoinList)-> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let decoder = JSONDecoder()
            decoder.decode(MarketCoinList.self, fromUrl: url) { list in
                DispatchQueue.main.async {
                    completionHandler(list)
                }
            }
        }
    }
}
