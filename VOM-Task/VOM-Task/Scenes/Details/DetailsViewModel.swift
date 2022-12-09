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
}
