//
//  NetworkResponse.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

struct NetworkResponse<T: Codable>: Codable {
    
    var data: T?
    var errors: NetworkError?
    
    enum CodingKeys: String, CodingKey {
        
        case data
        case errors
    }
}
