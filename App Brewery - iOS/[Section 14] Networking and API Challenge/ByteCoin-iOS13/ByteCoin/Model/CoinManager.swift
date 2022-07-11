//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdatePrice(_ coinManager: CoinManager, price: Double)
    func didFailWithError(with error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate!
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "CB89A26F-ED21-4C27-ABF9-B9C297413EE4"
    
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for curreny: String) {
        let urlString = String("\(baseURL)/\(curreny)/?apikey=\(apiKey)")
        print(urlString)
        performRequest(for: urlString)
    }
    
    func performRequest(for urlString: String){

        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate.didFailWithError(with: error!)
                    return
                }
                if let safeData = data {
                    print(safeData)
                    if let price = self.parseJSON(data: safeData) {
                        delegate.didUpdatePrice(self, price: price)
                    }
                    
                }
            }
            task.resume()
            
        }
    }
    
    func parseJSON(data: Data) -> Double? {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let price = decodedData.rate
            print("parseJSON :: Price=", price)
            return price
        } catch {
            print("parseJSON :: Error=", error)
            return nil
        }
        
    }
}
