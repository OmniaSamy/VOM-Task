//
//  CurrencySymbolModel.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation

struct CurrencySymbolModel: Codable {
    
    var symbols: [String: String]
    
    enum CodingKeys: String, CodingKey {
        
        case symbols = "symbols"
    }
}

struct CurrencyModel: Codable {
    var key: String?
    var value: String?
}
