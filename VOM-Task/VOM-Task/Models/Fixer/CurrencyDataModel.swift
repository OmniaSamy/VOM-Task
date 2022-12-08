//
//  CurrencyDataModel.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

struct CurrencyDataModel: Codable {
    
    var baseCurrency: String?
    var results: ResultsModel?
    
    enum CodingKeys: String, CodingKey {

        case baseCurrency = "base"
        case results = "results"
    }
}
