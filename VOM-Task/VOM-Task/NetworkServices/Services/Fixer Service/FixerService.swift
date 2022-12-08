//
//  FixerService.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation
import Moya

//https://api.fastforex.io/fetch-all?api_key=YOUR_API_KEY
enum CurrencyService {
    case getCurrencyRates(currency: String)
}

extension CurrencyService: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManager.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getCurrencyRates:
            return "/fetch-all"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCurrencyRates:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
            
        case .getCurrencyRates(let currency):
            return .requestParameters(parameters: ["from": currency,
                                                   "api_key": NetworkManager.networkConfig.apiKey], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
