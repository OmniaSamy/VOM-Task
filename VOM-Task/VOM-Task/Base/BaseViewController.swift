//
//  BaseViewController.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


extension BaseViewController: LoaderProtocol {
    
    func showLoadingIndicator(view: UIView, type: LoaderType) {
        Loader.show(onView: view, type: type)
    }
    
    func hideLoadingIndicator() {
        Loader.hide()
    }
}
