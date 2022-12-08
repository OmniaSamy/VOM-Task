//
//  NetworkManager+Fixer.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getCurrencyRates(currency: String,
                          completion: @escaping(_ result: Swift.Result<CurrencyDataModel, NetworkError>,
                                                _ statusCode: Int?) -> Void) {
        
        provider.request(MultiTarget(CurrencyService.getCurrencyRates(currency: currency))) { result in
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
