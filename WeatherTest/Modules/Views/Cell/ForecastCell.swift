//
//  Forecast.swift
//  WeatherTest
//
//  Created by Harnashevich on 21.11.22.
//

import UIKit

final class ForecastCell: UITableViewCell {
    /// Идентификатор ячейки
    static let reuseIdentifier = "forecastCell"
    
    //MARK: - UI
    
    /// Стек вью c элементами
    private lazy var stackView = createStackView()
    // Лейбл с днём недели
    private lazy var dayLabel = createLabel(fontSize: 18,
                                            color: .white,
                                            textAligment: .left)
    // Имейдж вью с типом погоды
    private lazy var weatherImageView = createWeatherImageView()
    // Лейб с минимальной температутрой
    private lazy var minTemperature = createLabel(fontSize: 16,
                                                  color: UIColor(red: 0.584,
                                                                 green: 0.631,
                                                                 blue: 0.694,
                                                                 alpha: 1),
                                                  textAligment: .right)
    // Лейб с максимальной температутрой
    private lazy var maxTemperature = createLabel(fontSize: 16,
                                                  color: .white,
                                                  textAligment: .right)
    // Нижний сепаратор
    private lazy var separatorView = createView()
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func configureUI() {
        contentView.addSubviews(stackView, separatorView)
        stackView.addArrangedSubviews(dayLabel, weatherImageView, minTemperature, maxTemperature)
        backgroundColor = UIColor(red: 0.236, green: 0.304, blue: 0.396, alpha: 0.6)
        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            
            dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            maxTemperature.centerYAnchor.constraint(equalTo: centerYAnchor),
            minTemperature.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            weatherImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 14),
            weatherImageView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -14),
            
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func createLabel(fontSize: CGFloat, color: UIColor, textAligment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.textAlignment = textAligment
        label.widthAnchor.constraint(equalToConstant: 50).isActive = true
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.font = AppTheme.Fonts.Inter(fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.43,
                                       green: 0.472,
                                       blue: 0.529,
                                       alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func createWeatherImageView() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }
    
    func setData(with model: Forecast) {
        dayLabel.text = DateFormatterManager.shared.changeDateFormat(date: model.date)
        minTemperature.text = String(model.minTemperature) + "°"
        maxTemperature.text = String(model.maxTemperature) + "°"
        
        switch model.weatherType {
        case .sunny:
            weatherImageView.image = UIImage(systemName: "sun.max.fill")
            weatherImageView.tintColor = .yellow
        case .cloudy:
            weatherImageView.image = UIImage(systemName: "cloud.fill")
            weatherImageView.tintColor = .white
        case .rainy:
            weatherImageView.image = UIImage(systemName: "cloud.rain.fill")
            weatherImageView.tintColor = .white
        }
    }
}
