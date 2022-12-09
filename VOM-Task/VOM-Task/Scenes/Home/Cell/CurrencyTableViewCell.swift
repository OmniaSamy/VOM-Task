//
//  CurrencyTableViewCell.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet private weak var currencyImageView: UIImageView!
    @IBOutlet private weak var currencyNameLabel: UILabel!
    @IBOutlet private weak var currencyValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bind(currency: CurrencyModel) {
//    currencyImageView
        //placeholder_Icon
        currencyNameLabel.text = currency.key
        currencyValueLabel.text = String(currency.value ?? 0)
    }
}
