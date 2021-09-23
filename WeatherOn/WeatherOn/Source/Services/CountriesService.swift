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
    
    typealias countriesCallBack = (
        _ countries: [Country]?,
        _ status: Bool,
        _ message: String) -> Void
    
    // MARK: -
    // MARK: Properties
    
    //https://restcountries.eu/rest/v2/all
    private var baseURL = ""
    private var countries = [Country]()
    var callBack: countriesCallBack?
    
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
                guard let data = responseData.data else {
                    self.callBack?(nil, false, "")
                    return }
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    self.callBack?(countries, true, "")
                    print("countries = \(countries)")
                } catch {
                    self.callBack?(nil, false, error.localizedDescription)
                    print("Error decoding = \(error)")
                }
                print(data)
            }
    }

    public func completionHandler(callBack: @escaping countriesCallBack) {
        self.callBack = callBack
    }
}
