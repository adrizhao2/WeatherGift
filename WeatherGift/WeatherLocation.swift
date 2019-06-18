//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Adrianna Zhao on 6/17/19.
//  Copyright © 2019 Adrianna Zhao. All rights reserved.
//
// bogus comment

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var currentSummary = ""
    var currentIcon = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return temp.")
                }
                if let summary = json["daily"]["summary"].string {
                    self.currentSummary = summary
                } else {
                    print("Could not return summary.")
                }
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                } else {
                    print("Could not return icon.")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
