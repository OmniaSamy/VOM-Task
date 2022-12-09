//
//  HomeViewModel.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

typealias BlockWithMessageAndBool = (String? , Bool)->Void

protocol HomeViewModelProtocol {
    func getCurrencyRates(currency: String, completion: @escaping BlockWithMessageAndBool)
    var currancyData: CurrencyDataModel? { set get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var currancyData: CurrencyDataModel?
    
    func getCurrencyRates(currency: String, completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared
            .getCurrencyRates(currency: "USD",
                              completion: {[weak self] (result: Result<CurrencyDataModel, NetworkError>, _) in
                
                switch result {
                case .success(let data):
                    print("data \(data)")
                    self?.currancyData = data
                    completion("sucess", true)
                case .failure(let error):
                    print("error \(error)")
                    completion(error.errorMessage(), false)
                }
            })
    }
}
