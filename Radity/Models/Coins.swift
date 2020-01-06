//
//  Coin.swift
//  Radity
//
//  Created by Neha Yadav on 03/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import Foundation

struct Coin {
    let id: Int
    let symbol: String
    let name: String
    let price_usd: String
}

//struct Coins {
//    let coins: [Coin]
//}

struct BankAccount {
    let name: String
    let accountType: String
    let price: String
    let currency: String
    let price_usd: String
}
//struct BankAccounts {
//    let accounts: [BankAccount]
//}

struct Wallet {
    let coinList: [Coin]
    let accounList: [BankAccount]
}

//API: https://api.coinlore.com/api/tickers/

// TODO: sections in tableview
//Change Notification tab to news
