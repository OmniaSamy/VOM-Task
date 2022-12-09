//
//  HomeViewModel.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation

typealias BlockWithMessageAndBool = (String?, Bool) -> Void

protocol HomeViewModelProtocol: BaseViewModelProtocol {
    func getCurrencyRates(completion: @escaping BlockWithMessageAndBool)
    func getCurrancySymbols(completion: @escaping BlockWithMessageAndBool)
    
    var currancyRatesData: CurrencyDataModel? { set get }
    var currencyRateList: [CurrencyRateModel]? { set get }
    
    var currancySymbolsData: CurrencySymbolModel? { set get }
    var currancySymbolsList: [CurrencyModel]? { set get }
    
    var selectedBaseCurrency: CurrencyModel? { set get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var currancyRatesData: CurrencyDataModel?
    var currencyRateList: [CurrencyRateModel]?
    
    var currancySymbolsData: CurrencySymbolModel?
    var currancySymbolsList: [CurrencyModel]?
    
    var selectedBaseCurrency: CurrencyModel?
    
    func getCurrencyRates(completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared
            .getCurrencyRates(currency: selectedBaseCurrency?.key ?? "USD",
                              completion: {[weak self] (result: Result<CurrencyDataModel, NetworkError>, _) in
                
                switch result {
                case .success(let data):
                    print("data \(data)")
                    self?.currancyRatesData = data
                    
                    self?.currencyRateList = self?.currancyRatesData?.rates.compactMap({ element in
                        CurrencyRateModel(key: element.key, value: element.value)
                    })
                    
                    completion("sucess", true)
                case .failure(let error):
                    print("error \(error)")
                    completion(error.errorMessage(), false)
                }
            })
    }
    
    func getCurrancySymbols(completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared
            .getCurrencySymbols(completion: {[weak self] (result: Result<CurrencySymbolModel, NetworkError>, _) in
                
                switch result {
                case .success(let data):
                    print("data \(data)")
                    self?.currancySymbolsData = data
                    
                    self?.currancySymbolsList = self?.currancySymbolsData?.symbols.compactMap({ element in
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
