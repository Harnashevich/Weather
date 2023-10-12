//
//  WeatherModel.swift
//  WeatherTest
//
//  Created by Harnashevich on 24.11.22.
//

import Foundation

// MARK: - WeatherModel

struct WeatherModel: Codable {
    let city, temperature, weatherModelDescription: String
    let weatherPerDay: [WeatherPerDay]
    let forecast: [Forecast]

    enum CodingKeys: String, CodingKey {
        case city, temperature
        case weatherModelDescription = "description"
        case weatherPerDay = "weather_per_day"
        case forecast
    }
    
    init(city: String = "",
         temperature: String = "",
         weatherModelDescription: String = "",
         weatherPerDay: [WeatherPerDay] = [],
         forecast: [Forecast] = []) {
        self.city = city
        self.temperature = temperature
        self.weatherModelDescription = weatherModelDescription
        self.weatherPerDay = weatherPerDay
        self.forecast = forecast
    }
}
