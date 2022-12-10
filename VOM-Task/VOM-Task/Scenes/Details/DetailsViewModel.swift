//
//  DetailsViewModel.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation

protocol DetailsViewModelProtocol: BaseViewModelProtocol {
    func convertCurrency(amount: String, completion: @escaping BlockWithMessageAndBool)
    var selectedCurrencyRate: CurrencyRateModel? { set get }
    var baseCurrency: CurrencyModel? { set get }
    
    var convertedCurrencyData: ConvertCurrencyModel? { set get }
}

class DetailsViewModel: DetailsViewModelProtocol {
    
    var selectedCurrencyRate: CurrencyRateModel?
    var baseCurrency: CurrencyModel?
    
    var convertedCurrencyData: ConvertCurrencyModel?
    
    init(baseCurrency: CurrencyModel, selectedCurrencyRate: CurrencyRateModel) {
        self.baseCurrency = baseCurrency
        self.selectedCurrencyRate = selectedCurrencyRate
    }
    
    func convertCurrency(amount: String, completion: @escaping BlockWithMessageAndBool) {
        
        NetworkManager.shared
            .convertCurrency(amount: amount,
                             baseCurrency: baseCurrency?.key ?? "",
                             symbols: selectedCurrencyRate?.key ?? "",
                             completion: {[weak self] (result: Result<ConvertCurrencyModel, NetworkError>, _) in
                
                switch result {
                case .success(let data):
                    print("data \(data)")
                    
                    self?.convertedCurrencyData = data
                    completion("sucess", true)
                case .failure(let error):
                    print("error \(error)")
                    completion(error.errorMessage(), false)
                }
            })
    }
}
