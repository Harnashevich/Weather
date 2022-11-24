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

// MARK: - Forecast

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

// MARK: - WeatherPerDay

struct WeatherPerDay: Codable {
    let timestamp, temperature: String
    let weatherType: TypeOfWeather
    let sunset: Bool?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case weatherType = "weather_type"
        case temperature, sunset
    }
    
    init(timestamp: String = "",
         weatherType: String = "",
         temperature: String = "",
         sunset: Bool = false) {
        self.timestamp = timestamp
        self.weatherType = TypeOfWeather.cloudy
        self.temperature = temperature
        self.sunset = sunset
    }
}

// MARK: - WeatherType

struct WeatherType: Codable {
    let type: TypeOfWeather
}

enum TypeOfWeather: String, Codable {
    case sunny, cloudy, rainy
}
