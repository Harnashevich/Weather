//
//  AppTheme.swift
//  WeatherTest
//
//  Created by Harnashevich on 20.11.22.
//

import UIKit

enum AppTheme {
    
    enum Fonts {
        static func Inter(_ size: CGFloat) -> UIFont {
            return UIFont(name: "Inter-Medium", size: size) ?? UIFont()
        }
    }
}
