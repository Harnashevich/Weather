//
//  ForecastModel.swift
//  WeatherTest
//
//  Created by Andrei Harnashevich on 12.10.23.
//

import Foundation

struct Forecast: Codable {
    let date: String
    let minTemperature, maxTemperature: Int
    let weatherType: TypeOfWeather

    enum CodingKeys: String, CodingKey {
        case date
        case minTemperature = "min_temperature"
        case maxTemperature = "max_temperature"
        case weatherType = "weather_type"
    }
    
    init(date: String = "",
         minTemperature: Int = 0,
         maxTemperature: Int = 0) {
        self.date = date
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.weatherType = TypeOfWeather.cloudy
    }
}
