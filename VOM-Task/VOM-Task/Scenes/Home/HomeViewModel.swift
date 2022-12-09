//
//  HomeViewModel.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

typealias BlockWithMessageAndBool = (String?, Bool) -> Void

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    func getCurrencyRates(currency: String, completion: @escaping BlockWithMessageAndBool)
    var currancyData: CurrencyDataModel? { set get }
    var currencyList: [CurrencyModel]? { set get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var currancyData: CurrencyDataModel?
    var currencyList: [CurrencyModel]?
    
    func getCurrencyRates(currency: String, completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared
            .getCurrencyRates(currency: currency,
                              completion: {[weak self] (result: Result<CurrencyDataModel, NetworkError>, _) in
                
                switch result {
                case .success(let data):
                    print("data \(data)")
                    self?.currancyData = data
                    
                    self?.currencyList = self?.currancyData?.rates.compactMap({ element in
                        CurrencyModel(key: element.key, value: element.value)
                    })
                    
                    completion("sucess", true)
                case .failure(let error):
                    print("error \(error)")
                    completion(error.errorMessage(), false)
                }
            })
    }
}
