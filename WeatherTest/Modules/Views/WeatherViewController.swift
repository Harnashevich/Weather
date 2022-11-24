//
//  WeatherViewController.swift
//  WeatherTest
//
//  Created by Harnashevich on 20.11.22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - UI
    
    // Таблица с погодой
    private lazy var tableView = createTableView()
    // Картинка с облаками
    private lazy var cloudImageView = createImageView()
    // Хидер вью в таблице
    private var perDayHeaderView = PerDayHeaderView()
    // Футер вью в таблице
    private var footerView = FooterView()
    
    //MARK: - Variables
    
    // Презентор
    private let presenter = WeatherPresenter()
    // Модель погоды
    private var weather = WeatherModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        presenter.setViewDelegate(delegate: self)
        if let localData = self.readLocalFile(forName: "weatherData") {
            presenter.getWeather(jsonData: localData)
        }
    }
}

//MARK: - WeatherPresenterDelegate

extension WeatherViewController: WeatherPresenterDelegate {
    
    func presentWeather(weather: WeatherModel) {
        self.weather = weather
        perDayHeaderView.weather = weather
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


//MARK: - Methods

extension WeatherViewController {
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func configureUI() {
        view.addSubviews(cloudImageView, tableView)
        
        NSLayoutConstraint.activate([
            cloudImageView.topAnchor.constraint(equalTo: view.topAnchor),
            cloudImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cloudImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cloudImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.separatorColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloudy")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

//MARK: - UITableViewDataSource

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.forecast.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.reuseIdentifier, for: indexPath) as? ForecastCell else { return UITableViewCell() }
        cell.setData(with: weather.forecast[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate

extension WeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        perDayHeaderView.setData(with: weather)
        return perDayHeaderView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
}
