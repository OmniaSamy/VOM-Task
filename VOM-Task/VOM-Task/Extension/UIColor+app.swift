//
//  UIColor+app.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import UIKit

extension UIColor {
    
    class var loaderBackgroundColor: UIColor {
        guard let color = UIColor(named: "Loader Background Color") else {
            return UIColor()
        }
        return color
    }
}
