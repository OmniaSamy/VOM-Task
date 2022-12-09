//
//  DetailsViewController.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import UIKit

class DetailsViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var baseCurrencyLabel: UILabel!
    @IBOutlet private weak var basecurrencyTextField: UITextField!
    
    @IBOutlet private weak var selectedCurrancyLabel: UILabel!
    @IBOutlet private weak var selectedCurrencyAmountLabel: UILabel!
    
    var viewModel: DetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        bindData()
    }
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - IBActions
extension DetailsViewController {
    
    @IBAction func convertTapped(_ sender: Any) {
        
    }
}

// MARK: - Private
extension DetailsViewController {
    
    private func bindData() {
        
        baseCurrencyLabel.text = viewModel?.baseCurrency?.key
        basecurrencyTextField.text = "1.00" //viewModel?.baseCurrency?.value
        selectedCurrancyLabel.text = viewModel?.selectedCurrencyRate?.key
        selectedCurrencyAmountLabel.text = String(viewModel?.selectedCurrencyRate?.value ?? 0)
    }
    
    private func convert() {
        
    }
}
