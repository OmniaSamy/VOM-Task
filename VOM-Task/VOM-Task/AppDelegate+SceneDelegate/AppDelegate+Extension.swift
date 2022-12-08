//
//  AppDelegate+Extension.swift
//  VOM-Task
//
//  Created by Omnia on 08/12/2022.
//

import Foundation
import IQKeyboardManagerSwift

extension AppDelegate {
    
    func initNetwork() {
        let defaults = NetworkDefaults(baseUrl: "https://api.fastforex.io", apiKey: "de9f2b96fd-dccb787cb9-rml3h9")
        NetworkManager.shared = NetworkManager(config: defaults)
    }
    
    func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = .green
    }
}
