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
    
    private lazy var separatorView = createView()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubviews(dayLabel, separatorView)
        backgroundColor = UIColor(red: 0.236, green: 0.304, blue: 0.396, alpha: 0.6)
        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            dayLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
            dayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
    
    private func createView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.43, green: 0.472, blue: 0.529, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func setData() {
        dayLabel.text = "Сб"
    }

}
