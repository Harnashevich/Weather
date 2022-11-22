//
//  PerDayCell.swift
//  WeatherTest
//
//  Created by Harnashevich on 22.11.22.
//

import UIKit

final class PerDayCell: UICollectionViewCell {
    // Идентификатор ячейки
    static let reuseIdentifier = "perDayCell"
    
    //MARK: - UI
    
    // Лейбл с временем
    private lazy var timeLabel = createLabel(fontSize: 14, color: .white)
    // Имейдж промокода
    private lazy var weatherImageView = createWeatherImageView()
    // Лейбл с температурой
    private lazy var temperatureLabel = createLabel(fontSize: 16, color: .white)
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PerDayCell {
    
    private func createLabel(fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = AppTheme.Fonts.Inter(fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createWeatherImageView() -> UIImageView {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    private func configureUI() {
        contentView.backgroundColor = .clear
        contentView.addSubviews(timeLabel, weatherImageView, temperatureLabel)
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    func setData() {
        timeLabel.text = "16"
        weatherImageView.image = UIImage(systemName: "cloud.fill")
        weatherImageView.tintColor = .white
        temperatureLabel.text = "-4" + "°"
    }
}
