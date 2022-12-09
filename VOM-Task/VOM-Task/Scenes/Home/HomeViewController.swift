//
//  HomeViewController.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpScreenDesign()
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
    
    private func setUpScreenDesign() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CurrencyTableViewCell.className, bundle: nil),
                           forCellReuseIdentifier: CurrencyTableViewCell.className)
    }
    
    private func getData() {
        
        self.showLoadingIndicator(view: self.view, type: .native)
        viewModel?.getCurrencyRates(currency: "USD",
                                    completion: {[weak self] (msg, success) in
            guard let self = self else { return }
            self.hideLoadingIndicator()
            
            if success {
                self.bindData()
            } else {
                
            }
        })
    }
    
    private func bindData() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currencyList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.className,
                                                       for: indexPath) as? CurrencyTableViewCell else {
            return UITableViewCell()
        }
        guard let currency = viewModel?.currencyList?[indexPath.row] else { return UITableViewCell() }
        cell.bind(currency: currency)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currency = viewModel?.currencyList?[indexPath.row] else { return }
        
    }
}
