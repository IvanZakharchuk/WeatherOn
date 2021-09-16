//
//  CountriesService.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 16.09.2021.
//

import Foundation
import Alamofire

class CountriesService {
    
    // MARK: -
    // MARK: Properties
    
    //https://restcountries.eu/rest/v2/all
    fileprivate var baseURL = ""
    
    // MARK: -
    // MARK: Initialization
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    // MARK: -
    // MARK: Networking
    
    private func getCountry(name: String) {
        AF.request(
            self.baseURL + name,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil,
            interceptor: nil).response {
                (responseData) in
                print("We got the response")
        }
    }
}
