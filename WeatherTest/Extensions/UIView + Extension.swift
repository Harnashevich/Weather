//
//  UIView + Extension.swift
//  WeatherTest
//
//  Created by Harnashevich on 20.11.22.
//

import UIKit.UIView

extension UIView {
    
    static var reuseId: String {
        String(describing: self)
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
