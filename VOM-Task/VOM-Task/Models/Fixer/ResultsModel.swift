//
//  ResultsModel.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

struct ResultsModel: Codable {
    
    var AED: Double?
    var AFN: Double?
    var ALL: Double?
    var AMD: Double?
    var ANG: Double?
    var AOA: Double?
    var ARS: Double?
    
    enum CodingKeys: String, CodingKey {

        case AED = "AED"
        case AFN = "AFN"
        case ALL = "ALL"
        case AMD = "AMD"
        case ANG = "ANG"
        case AOA = "AOA"
        case ARS = "ARS"
    }
}
