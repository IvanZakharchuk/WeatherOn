//
//  CountriesView.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 14.09.2021.
//

import Foundation
import UIKit

enum CountriesViewEvents {
    case one
}

class CountriesView: BaseView<CountriesViewEvents> {
    
    // MARK: -
    // MARK: IBOutlets
    
    @IBOutlet private var countriesTableView: UITableView?
    
    // MARK: -
    // MARK: Overrided
    
    override func setupView() {
        self.countriesTableView?.register(cell: CountriesTableViewCell.self)
    }
}
