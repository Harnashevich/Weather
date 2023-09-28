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
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func getWeather(jsonData: Data) {
        do {
            let weather = try JSONDecoder().decode(WeatherModel.self, from: jsonData)
            self.delegate?.presentWeather(weather: weather)
        } catch {
            print("decode error")
        }
    }
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
