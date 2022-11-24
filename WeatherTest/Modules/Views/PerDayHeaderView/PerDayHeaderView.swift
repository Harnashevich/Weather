//
//  PerDayHeaderView.swift
//  WeatherTest
//
//  Created by Harnashevich on 21.11.22.
//

import UIKit

final class PerDayHeaderView: UIView {
    
    //MARK: - UI
    
    // Лейбл с названием города
    private lazy var cityLabel = createLabel(fontSize: 30,
                                             color: .white)
    // Лейбл с температурой и типом погоды
    private lazy var shortDescriptionLabel = createLabel(fontSize: 16,
                                                         color: UIColor(red: 1,
                                                                        green: 1,
                                                                        blue: 1,
                                                                        alpha: 0.6))
    // Вью с подробной информацией на сегодня
    private lazy var detailtDescriptionView = createView()
    // Лейбл с описанием погоды
    private lazy var detailtDescriptionLabel = createLabel(fontSize: 14,
                                                           color: .white)
    // Сепаратор в detailtDescriptionView
    private lazy var detailSeparator = createView()
    // Колекшн вью с детальной информацие за день
    private lazy var collectionView = createCollectionView()
    // Вью с календарём
    private lazy var bottomView = createView()
    // Картинка с календарём
    private lazy var calendarImageView = createCalendarImage()
    // Лейбл "10-DAY FORECAST"
    private lazy var forecastLabel = createLabel(fontSize: 14,
                                                 color:  UIColor(red: 0.584,
                                                                 green: 0.631,
                                                                 blue: 0.694,
                                                                 alpha: 1))
    // Нижний сепаратор
    private lazy var separatorView = createView()
    
    //MARK: - Variables
    
    // Модель погоды
    var weather = WeatherModel()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confirureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PerDayHeaderView {

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
        view.backgroundColor = UIColor(red: 0.235,
                                       green: 0.306,
                                       blue: 0.396,
                                       alpha: 0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func createCalendarImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calendar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(PerDayCell.self, forCellWithReuseIdentifier: PerDayCell.reuseIdentifier)
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }
    
    private func confirureUI() {
        addSubviews(cityLabel, shortDescriptionLabel, detailtDescriptionView, bottomView, separatorView)
        detailtDescriptionView.addSubviews(detailtDescriptionLabel, detailSeparator, collectionView)
        bottomView.addSubviews(calendarImageView, forecastLabel)
        
        detailtDescriptionView.layer.cornerRadius = 14
        bottomView.layer.cornerRadius = 14
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        separatorView.backgroundColor = UIColor(red: 0.43,
                                                green: 0.472,
                                                blue: 0.529,
                                                alpha: 1)
        detailSeparator.backgroundColor = UIColor(red: 0.43,
                                                  green: 0.472,
                                                  blue: 0.529,
                                                  alpha: 1)
        forecastLabel.text = "10-DAY FORECAST"
        detailtDescriptionLabel.numberOfLines = 2
    
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cityLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            shortDescriptionLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7),
            shortDescriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            detailtDescriptionView.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 55),
            detailtDescriptionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailtDescriptionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailtDescriptionView.heightAnchor.constraint(equalToConstant: 180),
            
            detailtDescriptionLabel.topAnchor.constraint(equalTo: detailtDescriptionView.topAnchor, constant: 14),
            detailtDescriptionLabel.leadingAnchor.constraint(equalTo: detailtDescriptionView.leadingAnchor, constant: 14),
            detailtDescriptionLabel.trailingAnchor.constraint(equalTo: detailtDescriptionView.trailingAnchor, constant: -14),
            
            detailSeparator.topAnchor.constraint(equalTo: detailtDescriptionLabel.bottomAnchor, constant: 14),
            detailSeparator.heightAnchor.constraint(equalToConstant: 1),
            detailSeparator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            detailSeparator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            
            collectionView.topAnchor.constraint(equalTo: detailSeparator.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: detailtDescriptionView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: detailtDescriptionView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: detailtDescriptionView.bottomAnchor),
            
            bottomView.topAnchor.constraint(equalTo: detailtDescriptionView.bottomAnchor, constant: 10),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 45),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            calendarImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 17),
            calendarImageView.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            calendarImageView.heightAnchor.constraint(equalToConstant: 12),
            calendarImageView.widthAnchor.constraint(equalToConstant: 12),

            forecastLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 8),
            forecastLabel.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setData(with model: WeatherModel) {
        cityLabel.text = model.city
        shortDescriptionLabel.text = model.temperature
        detailtDescriptionLabel.text = model.weatherModelDescription
    }
}

//MARK: - UICollectionViewDataSource

extension PerDayHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.weatherPerDay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PerDayCell.reuseIdentifier, for: indexPath) as? PerDayCell else { return UICollectionViewCell() }
        cell.setData(with: weather.weatherPerDay[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PerDayHeaderView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isSunset: Bool = weather.weatherPerDay[indexPath.row].sunset ?? Bool()
        switch isSunset {
        case true:
            return CGSize(width: 140,
                          height: 115)
        case false:
            return CGSize(width: 55,
                          height: 115)
        }
    }
}
