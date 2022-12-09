//
//  HomeViewController.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import UIKit
import DropDown

class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var baseCurrencyView: UIView!
    @IBOutlet private weak var baseCurrancyLabel: UILabel!
    @IBOutlet private weak var baseCurrancyFalgImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    
    private let currencyDropDowm = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpScreenDesign()
        getCurrancySymbols()
        getCurrancyRates()
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - IBActions
extension HomeViewController {
    
    @IBAction func baseCurrancyTapped(_ sender: Any) {
        currencyDropDowm.show()
    }
}

// MARK: - Private
extension HomeViewController {
    
    private func setUpScreenDesign() {
        self.title = "Home"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CurrencyTableViewCell.className, bundle: nil),
                           forCellReuseIdentifier: CurrencyTableViewCell.className)
    }
    
    private func setUpCurrencyDropDown() {
        currencyDropDowm.anchorView = baseCurrencyView
        currencyDropDowm.bottomOffset = CGPoint(x: 0, y: baseCurrencyView.bounds.height)
        
        let currencyList = viewModel?.currancySymbolsList ?? []
        var currencyDropDownDataSource = [String]()
        
        for currency in currencyList {
            currencyDropDownDataSource.append(currency.key ?? "")
        }
        
        currencyDropDowm.dataSource = currencyDropDownDataSource
        
        // Action triggered on selection
        currencyDropDowm.selectionAction = { [weak self] (index, item) in
            guard let self = self else { return }
            self.baseCurrancyLabel.text = item
            self.baseCurrancyFalgImageView.image = UIImage(named: currencyList[index].key ?? "")
            self.viewModel?.selectedBaseCurrency = currencyList[index]
            self.getCurrancyRates()
        }
    }
    
    private func getCurrancyRates() {
        
        self.showLoadingIndicator(view: self.view, type: .native)
        viewModel?.getCurrencyRates(completion: {[weak self] (msg, success) in
            guard let self = self else { return }
            self.hideLoadingIndicator()
            if success {
                self.bindData()
            } else {
                self.showErrorMessage(errorMessage: msg ?? "")
            }
        })
    }
    
    private func getCurrancySymbols() {
        
        self.showLoadingIndicator(view: self.view, type: .native)
        viewModel?.getCurrancySymbols(completion: {[weak self] (msg, success) in
            guard let self = self else { return }
            self.hideLoadingIndicator()
            
            if success {
                self.setUpCurrencyDropDown()
            } else {
                self.showErrorMessage(errorMessage: msg ?? "")
            }
        })
    }
    
    private func bindData() {
        tableView.reloadData()
    }
}

// MARK: - TableView DataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currencyRateList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.className,
                                                       for: indexPath) as? CurrencyTableViewCell else {
            return UITableViewCell()
        }
        guard let currency = viewModel?.currencyRateList?[indexPath.row] else { return UITableViewCell() }
        cell.bind(currency: currency)
        return cell
    }
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rateCurrency = viewModel?.currencyRateList?[indexPath.row],
              let baseCurrency = viewModel?.selectedBaseCurrency else { return }
        
        let viewModel = DetailsViewModel(baseCurrency: baseCurrency, selectedCurrencyRate: rateCurrency)
        let viewController = DetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
