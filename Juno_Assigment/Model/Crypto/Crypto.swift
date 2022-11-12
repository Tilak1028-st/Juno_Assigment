//
//  Crypto.swift
//  Juno_Assigment
//
//  Created by PCS213 on 11/11/22.
//

import Foundation

struct Crypto: Codable {
    let crypto_balance : CryptoBalance?
    let your_crypto_holdings : [YourCryptoHoldings]?
    let crypto_prices : [CryptoPrices]?
    let all_transactions : [AllTransactions]?
}
