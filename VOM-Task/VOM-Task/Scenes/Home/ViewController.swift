//
//  ViewController.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getCurrencyList(currency: "USD")
    }

    func getCurrencyList(currency: String) {
        
        NetworkManager.shared
            .getCurrencyRates(currency: currency,
                    completion: {[weak self] (result: Result<CurrencyDataModel, NetworkError>, _) in
                
                switch result {
                case .success(let data):
                    print("data \(data)")
//                    self?.presenter?.serachSucess(data: data)
                    
                case .failure(let error):
                    print("error \(error)")
//                    self?.presenter?.serachFail(error: error)
                }
            })
    }
}

