//
//  CurrencyTableViewCell.swift
//  VOM-Task
//
//  Created by Omnia on 09/12/2022.
//

import UIKit
import SKCountryPicker

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
        
        guard let country = CountryConverter.codeToCountry[currency.key ?? ""] else {
            currencyImageView.image = UIImage(named: "placeholder_Icon")
            return
        }
        currencyImageView.image = CountryManager.shared.country(withName: country)?.flag
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        currencyImageView.image = UIImage(named: "placeholder_Icon")
    }
}
