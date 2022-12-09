//
//  LoaderProtocol.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import Foundation
import  UIKit

protocol LoaderProtocol {
    func showLoadingIndicator(view: UIView, type: LoaderType)
    func hideLoadingIndicator()
}

enum LoaderType {
    case custom, native
}
