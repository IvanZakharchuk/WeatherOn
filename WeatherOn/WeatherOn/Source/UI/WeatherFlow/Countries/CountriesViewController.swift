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
//    private var countries: [Country]
    
    // MARK: -
    // MARK: Initialization
    
    public init(networking: Networking) {
        self.networking = networking
        
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
    // MARK: Private
    
    private func getCountries() {
        self.networking.getData()
    }
    
    // MARK: -
    // MARK: Overrided

    override func viewDidLoad() {
        super.viewDidLoad()
        self.networking.getData()
    }
}

extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        self.countries.count
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: CountriesTableViewCell.self, for: indexPath)
//        let user = self.countries[indexPath.row]
//        cell.setupLeaderboardCell(userName: user.name, score: user.score.description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
//            let user = self.users[indexPath.row]
//
//            self.context.delete(player: user)
//            self.users.removeAll { $0 == user }
//
//            user.score = user.emptyPosition
//            self.eventHandler?(.refreshModelToGame(user))
            
            tableView.reloadData()
            completionHandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
}
