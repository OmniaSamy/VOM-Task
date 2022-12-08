//
//  NetworkError.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation
import Moya
import Alamofire

struct NetworkError: Codable, Error, LocalizedError {
    
    var errors: [ErrorModel]?
    var type: Type?
    
    init() { }
    
    init(error: MoyaError) {
        
        let errors = [ErrorModel(message: error.errorDescription ?? "NA", type: "MoyaError")]
        self.errors = errors
        
        if case let MoyaError.underlying(underlying, _) = error ,
           case let AFError.sessionTaskFailed(error: urlErrorDomain) = underlying {
            
            let nsError = urlErrorDomain as NSError
            
            if (999...1017) ~= abs(nsError.code) {
                print(error)
                self.type = .network
                let errors = [ErrorModel(message: "No Internet", type: "MoyaError")]
                self.errors = errors
            }
        }
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errors = try values.decodeIfPresent([ErrorModel].self, forKey: .errors)
    }
    
    init(error: Error) {
        print(error)
        print(error.localizedDescription)
        self.type = .mapping
    }
    
    func errorMessage () -> String {
        var errorString = ""
        if let errors = errors {
            for err in errors {
                errorString.append(err.message ?? "")
            }
        }
        return errorString
    }
}

extension NetworkError {
    static let parseError: NetworkError = {
        var error = NetworkError()
        print(error.localizedDescription)
        return error
    }()
    
    static let authorizeError: NetworkError = {
        var error = NetworkError()
        error.errors = [ErrorModel(message: "Session Expire", type: "SessionError")]
        error.type = Type.auth
        return error
    }()
}

struct ErrorModel: Codable {
    
    let type: String?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        
        case type = "type"
        case message = "error"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
    
    init(message: String, type: String) {
        self.message = message
        self.type = type
    }
}

enum `Type`:String, Codable {
    case business
    case system
    case mapping
    case auth
    case network
}
