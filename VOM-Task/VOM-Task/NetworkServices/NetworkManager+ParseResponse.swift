//
//  NetworkManager+ParseResponse.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation
import Moya

extension NetworkManager {
    
    func parseResponse(moyaResult: MoyaCompletion,
                                   completion: @escaping(NetworkCompletion<CurrencyDataModel>)) {
        
        switch moyaResult {
        case .success(let response):
            
            if (200...299 ~= response.statusCode) {
                do {
                    let result = try JSONDecoder().decode(CurrencyDataModel.self, from: response.data)
                    completion(.success(result), response.statusCode)
                } catch {
                    completion(.failure(NetworkError(error: error)), response.statusCode)
                }
            } else {
                // 300-399 ,400-499
                do {
                    let businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                    print(response.data)
                    completion(.failure(businessError), response.statusCode)
                } catch {
                    completion(.failure(NetworkError.parseError), response.statusCode)
                }
            }
        case .failure(let error):
            let customError = NetworkError(error: error)
            completion(.failure(customError), nil)
        }
    }
}
