//
//  CurrencyDataModel.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

struct CurrencyDataModel: Codable {
    
    var baseCurrency: String?
    var rates: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        
        case baseCurrency = "base"
        case rates = "rates"
    }
}

struct CurrencyModel: Codable {
    
    var key: String?
    var value: Double?
}
