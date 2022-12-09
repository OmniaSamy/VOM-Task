//
//  DetailsViewModel.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation

protocol DetailsViewModelProtocol: BaseViewModelProtocol {
    func convertCurrency(completion: @escaping BlockWithMessageAndBool)
    var selectedCurrencyRate: CurrencyRateModel? { set get }
    var baseCurrency: CurrencyModel? { set get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    var selectedCurrencyRate: CurrencyRateModel?
    var baseCurrency: CurrencyModel?
    
    init(baseCurrency: CurrencyModel, selectedCurrencyRate: CurrencyRateModel) {
        self.baseCurrency = baseCurrency
        self.selectedCurrencyRate = selectedCurrencyRate
    }
    

    func convertCurrency(completion: @escaping BlockWithMessageAndBool) {
        
        
    }
//    func getCurrencyRates(currency: String, completion: @escaping BlockWithMessageAndBool) {
//
//        NetworkManager.shared
//            .getCurrencyRates(currency: "USD",
//                              completion: {[weak self] (result: Result<CurrencyDataModel, NetworkError>, _) in
//
//                switch result {
//                case .success(let data):
//                    print("data \(data)")
//                    self?.currancyData = data
//                    completion("sucess", true)
//                case .failure(let error):
//                    print("error \(error)")
//                    completion(error.errorMessage(), false)
//                }
//            })
//    }
}
