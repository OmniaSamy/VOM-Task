//
//  HomeViewController.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        getData()
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController {
    
    private func getData() {
        
        self.showLoadingIndicator(view: self.view, type: .native)
        viewModel?.getCurrencyRates(currency: "USD",
                                    completion: {[weak self] (msg, success) in
            guard let self = self else { return }
            self.hideLoadingIndicator()
            
            if success {
                
            } else {
                
            }
        })
    }
}
