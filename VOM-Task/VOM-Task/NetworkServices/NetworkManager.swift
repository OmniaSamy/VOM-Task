//
//  NetworkManager.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation
import Moya

// api key
//de9f2b96fd-dccb787cb9-rml3h9

class NetworkManager {
    
    typealias MoyaCompletion = Result<Moya.Response, MoyaError>
    typealias NetworkCompletion<T: Codable> = (_ result: Swift.Result<CurrencyDataModel, NetworkError>,
                                               _ statusCode: Int?) -> Void
    
    static var networkConfig: NetworkDefaults {
        return NetworkManager.shared._networkConfig!
    }
    
    static var shared: NetworkManager!
    var _networkConfig: NetworkDefaults?
    
    var provider: MoyaProvider<MultiTarget>!
    
    init(config: NetworkDefaults) {
        
        self._networkConfig = config
        NetworkManager.shared = self
        
        provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()])
    }
}
