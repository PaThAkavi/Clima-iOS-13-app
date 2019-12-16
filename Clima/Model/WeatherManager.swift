//
//  WeatherManager.swift
//  Clima
//
//  Created by Avaneesh Pathak on 14/12/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=16dea12a39b789ce631dfd60de7f1d61&units=metric" //city name removed so that added later on programatically
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)" //adding the city name now to weatherURL
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        // 1. create a URL
        
        if let url = URL(string: urlString) {  //to check if url is not empty
            
            // 2. create a URLSession
            
            let session = URLSession(configuration: .default) //performs the networking
            
            // 3. give session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in //closure
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseURL(weatherData: safeData)
                }
            }
            
            // 4. start the task
            
            task.resume()
        }
    }
    
    func parseURL(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            
            let weather = WeatherModel(conditionId: id, temperature: temp, cityName: name)
            print(weather.getConditionName(weatherID: id))
            print(weather.tempString)
        } catch {
            print(error)
        }
        
    }

}
