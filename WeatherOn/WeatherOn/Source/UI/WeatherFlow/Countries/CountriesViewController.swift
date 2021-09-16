//
//  CountriesViewController.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 14.09.2021.
//

import UIKit

enum  CountriesViewControllerEvents {
    case one
}

class CountriesViewController: BaseViewController<CountriesView, CountriesViewEvents, CountriesViewControllerEvents> {
    
    // MARK: -
    // MARK: Properties
    
//    private let countryService = CountriesService(baseUr)
    
    // MARK: -
    // MARK: Overrided

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
