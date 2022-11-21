//
//  ViewController.swift
//  WeatherTest
//
//  Created by Harnashevich on 20.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    // Таблица с погодой
    private lazy var tableView = makeTableView()
    // Картинка с облаками
    private lazy var cloudImageView = makeImageView()
    // Хидер вью в таблице
    private var perDayView = HeaderView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
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
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ForecastCell.self, forCellReuseIdentifier: ForecastCell.reuseIdentifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .lightGray
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cloudy")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}

//MARK: - UITableViewDataSource


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCell.reuseIdentifier, for: indexPath) as? ForecastCell else { return UITableViewCell() }
        cell.setData()
        return cell
    }
}

//MARK: - UITableViewDelegate


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        perDayView.setData()
        return perDayView
    }
    
}


