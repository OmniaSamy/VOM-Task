//
//  BaseViewController.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation
import UIKit
import SwiftMessages

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

extension BaseViewController {
    
    func showErrorMessage(errorMessage: String) {
        
        let view = MessageView.viewFromNib(layout: .cardView)
        view.button?.isHidden = true
        view.configureTheme(.error)
        view.configureDropShadow()
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        view.configureContent(title: "Error", body: errorMessage)
        view.layoutMarginAdditions = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 8
        SwiftMessages.show(config: config, view: view)
    }
}
