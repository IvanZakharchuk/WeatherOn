//
//  Functions.swift
//  WeatherOn
//
//  Created by Іван Захарчук on 13.09.2021.
//

import Foundation
public typealias EventHandler<Event> = (Event) -> ()

func toString(_ cls: AnyClass) -> String {
    return String(describing: cls)
}
