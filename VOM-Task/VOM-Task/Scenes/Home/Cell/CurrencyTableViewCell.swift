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

    func bind(currency: CurrencyRateModel) {
        currencyNameLabel.text = currency.key
        currencyValueLabel.text = String(currency.value ?? 0)
        
        currencyImageView.image = UIImage(named: currency.key ?? "placeholder_Icon")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        currencyImageView.image = UIImage(named: "placeholder_Icon")
    }
}
