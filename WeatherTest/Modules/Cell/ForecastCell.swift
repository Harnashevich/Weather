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
    
    private lazy var dayLabel = createLabel()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.236, green: 0.304, blue: 0.396, alpha: 0.6)
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 14)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubviews(dayLabel)
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = AppTheme.Fonts.Inter(18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    func setData() {
        dayLabel.text = "Сб"
    }

}
