//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Adrianna Zhao on 6/24/19.
//  Copyright © 2019 Adrianna Zhao. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name = ""
    var coordinates = ""
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
