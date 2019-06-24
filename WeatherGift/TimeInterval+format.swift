//
//  TimeInterval+format.swift
//  WeatherGift
//
//  Created by Adrianna Zhao on 6/23/19.
//  Copyright © 2019 Adrianna Zhao. All rights reserved.
//

import Foundation

extension TimeInterval {
    
    func format(timeZone: String, dateFormatter: DateFormatter) -> String {
        let usableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: usableDate)
        return dateString
    }
    
}
