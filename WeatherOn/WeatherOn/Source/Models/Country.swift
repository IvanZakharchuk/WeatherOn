//
//  Country.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 16.09.2021.
//

import Foundation

struct Country: Decodable {
    var name: String?
    var capital: String?
    var countryFlag: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case capital = "capital"
        case countryFlag = "flag"
        
    }
}
