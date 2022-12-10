//
//  NSObject+Extension.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation

extension NSObject {
    
    // return Class Name
    public static var className: String {
        return String(describing: self)
    }
}
