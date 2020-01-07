//
//  Coin.swift
//  Radity
//
//  Created by Neha Yadav on 03/01/20.
//  Copyright © 2020 Neha Yadav. All rights reserved.
//

import Foundation

let images = ["dollarsign.circle", "centsign.circle", "francsign.circle"]

struct Currency {
    let name: String
    let accountType: String
    let price: String
    let currency: String
    let price_usd: String
    let image: String
    static func getBankData() -> [Currency] {
        return [
            Currency(name: "HSBC", accountType: "Euro Account", price: "2020", currency: "€", price_usd: "$2240", image: images[0]),
            Currency(name: "Credit Suisse", accountType: "USD Custody", price: "1340", currency: "$", price_usd: "$1340", image: images[1]),
            Currency(name: "UBS", accountType: "CHF Account", price: "1471", currency: "CHF", price_usd: "$1500", image: images[2])
        ]
    }
    
    static func getBitCoinData() -> [Currency] {
        return [
            Currency(name: "BTC", accountType: "Bitcoin Wallet", price: "0093", currency: "₿", price_usd: "$945", image: "BTC"),
            Currency(name: "LTC", accountType: "Litecoin Wallet", price: "0.01400", currency: "Ł", price_usd: "$240", image: "LTC"),
            Currency(name: "BCH", accountType: "Bitcoin Cash", price: "131", currency: "₿", price_usd: "$400", image: "BCH")
        ]
    }
}

struct MyWallet {
    let currencyList: [Currency]
    static func getData() -> [MyWallet] {
        return [
            MyWallet(currencyList: Currency.getBitCoinData()),
            MyWallet(currencyList: Currency.getBankData()),
            MyWallet(currencyList: Currency.getBitCoinData()),
            MyWallet(currencyList: Currency.getBankData())
        ]
    }
}

//API: https://api.coinlore.com/api/tickers/

//Change Notification tab to news

