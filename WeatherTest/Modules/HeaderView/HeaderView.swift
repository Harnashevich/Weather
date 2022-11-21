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
    // Вью с подробной информацией на сегодня
    private lazy var detailtDescriptionView = createView()
    
    private lazy var bottomView = createView()
    
    private lazy var separatorView = createView()
    
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
    
    private func createView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.235, green: 0.306, blue: 0.396, alpha: 0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func confirureUI() {
        addSubviews(cityLabel, shortDescriptionLabel, detailtDescriptionView, bottomView, separatorView)
        detailtDescriptionView.layer.cornerRadius = 14
        bottomView.layer.cornerRadius = 14
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        separatorView.backgroundColor = UIColor(red: 0.43, green: 0.472, blue: 0.529, alpha: 1)
    
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            shortDescriptionLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7),
            shortDescriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            detailtDescriptionView.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 55),
            detailtDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailtDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailtDescriptionView.heightAnchor.constraint(equalToConstant: 180),
            
            bottomView.topAnchor.constraint(equalTo: detailtDescriptionView.bottomAnchor, constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 45),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: - Public Methods
    
    func setData() {
        cityLabel.text = "Минск"
        shortDescriptionLabel.text = "-4" + " | " + "Облачно"
    }
}
