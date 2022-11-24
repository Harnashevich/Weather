//
//  FooterView.swift
//  WeatherTest
//
//  Created by Harnashevich on 22.11.22.
//

import UIKit

final class FooterView: UIView {
    
    private lazy var bottomView = createView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confirureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FooterView {
    
    private func confirureUI() {
        addSubviews(bottomView)
        
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 14
        bottomView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        NSLayoutConstraint.activate([
            bottomView.heightAnchor.constraint(equalToConstant: 30),
            bottomView.topAnchor.constraint(equalTo: topAnchor),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.236,
                                       green: 0.304,
                                       blue: 0.396,
                                       alpha: 0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
