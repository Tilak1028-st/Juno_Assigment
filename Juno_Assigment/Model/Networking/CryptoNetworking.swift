//
//  CryptoNetworking.swift
//  Juno_Assigment
//
//  Created by PCS213 on 12/11/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

//Networking class from Api

class CryptoNetworking: NSObject {
    
    func getCryptoData(apiUrl: String, completion: @escaping (Crypto) -> Void) {
         let apiUrl = "http://demo9414936.mockable.io/home"
        
        AF.request(apiUrl, method: .get).response { response in
            if let data = response.data {
                do {
                    let cryptoData = try JSONDecoder().decode(Crypto.self, from: data)
                    completion(cryptoData)
                    
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
