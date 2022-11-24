//
//  WeatherPresenter.swift
//  WeatherTest
//
//  Created by Harnashevich on 24.11.22.
//

import UIKit

protocol WeatherPresenterDelegate: AnyObject {
    func presentWeather(weather: WeatherModel)
}

typealias PresenterDelegate = WeatherPresenterDelegate & UIViewController

final class WeatherPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getWeather(jsonData: Data) {
        do {
            let weather = try JSONDecoder().decode(WeatherModel.self, from: jsonData)
            self.delegate?.presentWeather(weather: weather)
        } catch {
            print("decode error")
        }
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
