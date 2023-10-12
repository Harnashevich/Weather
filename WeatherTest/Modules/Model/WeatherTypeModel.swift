//
//  WeatherTypeModel.swift
//  WeatherTest
//
//  Created by Andrei Harnashevich on 12.10.23.
//

import Foundation

struct WeatherType: Codable {
    let type: TypeOfWeather
}

enum TypeOfWeather: String, Codable {
    case sunny, cloudy, rainy
}
