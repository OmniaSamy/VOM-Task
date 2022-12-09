//
//  FixerService.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation
import Moya

//https://api.apilayer.com/fixer/latest
//https://api.apilayer.com/fixer/symbols

enum CurrencyService {
    case getCurrencyRates(currency: String)
    case getCurrencySymbols
}

extension CurrencyService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getCurrencyRates:
            return "/fixer/latest"
        case .getCurrencySymbols:
            return "/fixer/symbols"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCurrencyRates:
            return .get
        case .getCurrencySymbols:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
            
        case .getCurrencyRates(let currency):
            return .requestParameters(parameters: ["base": currency], encoding: URLEncoding.default)
        case .getCurrencySymbols:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
