//
//  WeatherModel.swift
//  Clima
//
//  Created by Avaneesh Pathak on 14/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let temperature: Double
    let cityName: String
    
    var tempString: String {  // computed property
        return String(format: "%.1f", temperature)
    }
    
    func getConditionName(weatherID: Int) -> String {
        switch weatherID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
