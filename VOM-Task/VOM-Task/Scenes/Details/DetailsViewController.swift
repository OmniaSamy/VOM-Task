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
        guard let amount = basecurrencyTextField.text else { return }
        
        if (amount.isEmpty) {
            self.showErrorMessage(errorMessage: "Amount is required")
        } else {
            convert(amount: (amount))
        }
    }
}

// MARK: - Private
extension DetailsViewController {
    
    private func bindData() {
        
        baseCurrencyLabel.text = viewModel?.baseCurrency?.key
        basecurrencyTextField.text = "1.00"
        selectedCurrancyLabel.text = viewModel?.selectedCurrencyRate?.key
        selectedCurrencyAmountLabel.text = String(viewModel?.selectedCurrencyRate?.value ?? 0)
    }
    
    private func convert(amount: String) {
        
        self.showLoadingIndicator(view: self.view, type: .native)
        viewModel?.convertCurrency(amount: amount, completion: {[weak self] (msg, success) in
            guard let self = self else { return }
            self.hideLoadingIndicator()
            
            if success {
                self.selectedCurrencyAmountLabel.text = String(self.viewModel?.convertedCurrencyData?.result ?? 0)
            } else {
                self.showErrorMessage(errorMessage: msg ?? "")
            }
        })
    }
}
