//
//  CountriesViewController.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 14.09.2021.
//

import UIKit

enum CountriesViewControllerEvents {
    
    case needDisplayWeather(Networking)
}

class CountriesViewController: BaseViewController<CountriesView, CountriesViewEvents, CountriesViewControllerEvents> {
    
    // MARK: -
    // MARK: Properties
    
    private let networking: Networking
    private var countries: [Country]
    
    // MARK: -
    // MARK: Initialization
    
    public init(networking: Networking) {
        self.networking = networking
        self.countries = self.networking.share()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Public
    
    public func presentWeather() {
        self.eventHandler?(.needDisplayWeather(self.networking))
    }
    
    // MARK: -
    // MARK: Overrided

    override func viewDidLoad() {
        super.viewDidLoad()
        print(countries.count)
        self.networking.getData()
    }
}

extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: CountriesTableViewCell.self, for: indexPath)
        let country = self.countries[indexPath.row]
        cell.setupCountriesCell(countryName: country.name ?? "", flagImage: country.countryFlag ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
//            self.eventHandler?(.refreshModelToGame(user))
            
            tableView.reloadData()
            completionHandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
}
