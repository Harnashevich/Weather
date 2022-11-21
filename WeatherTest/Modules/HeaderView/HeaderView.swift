//
//  HeaderView.swift
//  WeatherTest
//
//  Created by Harnashevich on 21.11.22.
//

import UIKit

final class HeaderView: UIView {
    
    //MARK: - UI
    
    // Лейбл с названием города
    private lazy var cityLabel = createLabel(fontSize: 30, color: .white)
    // Лейбл с температурой и типом погоды
    private lazy var shortDescriptionLabel = createLabel(fontSize: 16, color: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6))
    
    //MARK: - Callbacks
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confirureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {

    private func createLabel(fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = AppTheme.Fonts.Inter(fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func confirureUI() {
        addSubviews(cityLabel, shortDescriptionLabel)
    
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            shortDescriptionLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7),
            shortDescriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            shortDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
    }
    
    //MARK: - Public Methods
    
    func setData() {
        cityLabel.text = "Минск"
        shortDescriptionLabel.text = "-4" + " | " + "Облачно"
    }
}
