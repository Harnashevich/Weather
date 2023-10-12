//
//  WeatherPerDayModel.swift
//  WeatherTest
//
//  Created by Andrei Harnashevich on 12.10.23.
//

import Foundation

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
