//
//  MainScreenViewModel.swift
//  Juno_Assigment
//
//  Created by PCS213 on 12/11/22.
//

import Foundation
import UIKit
import Alamofire

class MainScreenViewModel {
    
    //variables
    var cryptoNetworking = CryptoNetworking()
    var yourCryptoHoldings = [YourCryptoHoldings]()
    var cryptoPrices = [CryptoPrices]()
    var allTransactions = [AllTransactions]()
    
    
    //initialization
    init() {
        self.yourCryptoHoldings = [YourCryptoHoldings]()
        self.cryptoPrices = [CryptoPrices]()
        self.allTransactions = [AllTransactions]()
    }
    
    
//MARK: Getting Data From API
    func fetchCryptoData(completion: @escaping (Bool) -> Void) {
        cryptoNetworking.getCryptoData(apiUrl: "") { (data) in
            self.yourCryptoHoldings = data.your_crypto_holdings ?? [YourCryptoHoldings]()
            self.cryptoPrices = data.crypto_prices ?? [CryptoPrices]()
            self.allTransactions = data.all_transactions ?? [AllTransactions]()
            completion(true)
        }
    }
}
