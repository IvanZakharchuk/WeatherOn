//
//  WeatherCoordinator.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 13.09.2021.
//

import Foundation

class WeatherOnCoordinator: BaseCoordinator {
    
    // MARK: -
    // MARK: Properties
    
    let networking: Networking
    
    // MARK: -
    // MARK: Initialization
    
    init(networking: Networking) {
        self.networking = networking

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Private
    
    private func presentCountries() {
        let controller = CountriesViewController(networking: networking)
        controller.eventHandler = { [weak self] event in
            self?.handle(event: event)
        }
        self.pushViewController(controller, animated: true)
    }
    
    private func handle(event: CountriesViewControllerEvents) {
        switch event {
        case let .needDisplayWeather(networking):
            self.displayWeather(networking: networking)
        }
    }
    
    private func displayWeather(networking: Networking) {
        
    }
    
    // MARK: -
    // MARK: Ovverided
    
    override func prepare() {
        self.presentCountries()
    }
}
