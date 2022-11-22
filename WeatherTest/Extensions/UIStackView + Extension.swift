//
//  UIStackView + Extension.swift
//  WeatherTest
//
//  Created by Harnashevich on 22.11.22.
//

import UIKit.UIStackView

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        addArrangedSubviews(views)
    }
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach(addArrangedSubview(_:))
    }
}
