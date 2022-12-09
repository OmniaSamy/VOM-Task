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
        let defaults = NetworkDefaults(baseUrl: "https://api.apilayer.com", apiKey: "H5HkOdR9nLog0zgJr9gPhlp8qQhggX41")
        NetworkManager.shared = NetworkManager(config: defaults)
    }
    
    func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarTintColor = .green
    }
}
