//
//  DetailsViewController.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import UIKit

class DetailsViewController: BaseViewController {

    var viewModel: DetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DetailsViewController {
    
}
