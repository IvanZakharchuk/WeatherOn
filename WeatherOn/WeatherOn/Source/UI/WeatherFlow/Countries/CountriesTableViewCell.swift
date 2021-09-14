//
//  CountriesTableViewCell.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 14.09.2021.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var countryName: UILabel?
    @IBOutlet private var flagImage: UIImageView?
    
    // MARK: -
    // MARK: Public
    
    public func setupCountriesCell(countryName: String, flagImage: String) {
        self.countryName?.text = countryName
        self.flagImage?.image = UIImage(named: flagImage)
    }
}
