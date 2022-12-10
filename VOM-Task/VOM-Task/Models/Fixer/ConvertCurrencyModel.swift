//
//  ConvertCurrencyModel.swift
//  VOM-Task
//
//  Created by Omnia on 10/12/2022.
//

import Foundation

struct ConvertCurrencyModel: Codable {
    
    var query: QueryModel?
    var date: String?
    var result: Double?
}

struct QueryModel: Codable {
    var fromCurrency: String?
    var toCurrency: String?
    var amount: Int?

    enum CodingKeys: String, CodingKey {
        
        case fromCurrency = "from"
        case toCurrency = "to"
        case amount = "amount"
    }
}
