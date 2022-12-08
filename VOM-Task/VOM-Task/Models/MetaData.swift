//
//  MetaData.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

struct Meta: Codable {
    
    var hasPrevious: Bool?
    var hasNext: Bool?
    var totalPages: Int?
    var total: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case hasPrevious
        case hasNext
        case totalPages
        case total
    }
}
