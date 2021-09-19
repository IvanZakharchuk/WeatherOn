//
//  CountriesService.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 16.09.2021.
//

import Foundation
import Alamofire

protocol Networking {
    
    func getData()
    func share() -> [Country]
}

enum URLs: String {
    case countriesURL = "https://restcountries.eu/rest/v2/all"
    case weatherURL = ""
    case weatherApiKey = " "
}

class CountriesService: Networking {
    
    // MARK: -
    // MARK: Properties
    
    //https://restcountries.eu/rest/v2/all
    private var baseURL = ""
    private var countries = [Country]()
    
    // MARK: -
    // MARK: Initialization
    
    public init() {
        self.baseURL = URLs.countriesURL.rawValue
    }
    
    // MARK: -
    // MARK:
    
    public func share() -> [Country] {
        return self.countries
    }
    
    // MARK: -
    // MARK: Networking
    
    public func getData() {
        AF.request(
            self.baseURL,
            method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: nil,
            interceptor: nil).response {
                (responseData) in
                guard let data = responseData.data else { return }
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    print("countries = \(countries)")
                } catch {
                    print("Error decoding = \(error)")
                }
                print(data)
            }
    }
    
//    public func getData() -> [Country] {
//        self.countries = [Country]()
//
//        AF.request(
//            self.baseURL,
//            method: .get,
//            parameters: nil,
//            encoding: URLEncoding.default,
//            headers: nil,
//            interceptor: nil).response {
//                (responseData) in
//                guard let data = responseData.data else { return }
//                do {
//                    self.countries = try JSONDecoder().decode([Country].self, from: data)
//                    print("countries = \(self.countries)")
//                } catch {
//                    print("Error decoding = \(error)")
//                }
//                print(data)
//        }
//        return countries ?? [Country]()
//    }
}
