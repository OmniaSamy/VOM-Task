//
//  Loader.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation
import UIKit
//import MBProgressHUD

class Loader: NSObject {
    
    static var sharedViewSpinner: UIView?
    private static var onView = UIView()
    
    class func show (onView: UIView, type: LoaderType) {
        
        self.onView = onView
        if sharedViewSpinner != nil {
            sharedViewSpinner?.removeFromSuperview()
        }
        
        let spinnerView = UIView(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = .lightGray
        
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        switch type {
        case .custom:
            
//            let hud = MBProgressHUD.showAdded(to: onView, animated: true)
//            hud.backgroundView.style = MBProgressHUDBackgroundStyle.solidColor
//            hud.backgroundView.color = .loaderBackgroundColor
//            //            hud.bezelView.backgroundColor = UIColor.secondaryColor1
//            hud.contentColor = .primaryColor
//            hud.mode = MBProgressHUDMode.indeterminate
//            hud.bezelView.cornurRadius = 15
            print("")
            
        case .native:
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = .green
            activityIndicator.startAnimating()
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
            
            viewBackgroundLoading.center = spinnerView.center
            viewBackgroundLoading.backgroundColor = UIColor.white
            viewBackgroundLoading.alpha = 1
            viewBackgroundLoading.clipsToBounds = true
            viewBackgroundLoading.layer.cornerRadius = 15
            
            spinnerView.addSubview(viewBackgroundLoading)
            onView.addSubview(spinnerView)
            
            sharedViewSpinner = spinnerView
        }
    }
    
    class func hide() {
        // native
        sharedViewSpinner?.removeFromSuperview()
        sharedViewSpinner = nil
    }
    
//    class func hideCustomLoader() {
//        // custom
//        MBProgressHUD.hide(for: onView, animated: true)
//    }
}
