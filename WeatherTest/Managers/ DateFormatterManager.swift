//
//   DateFormatterManager.swift
//  WeatherTest
//
//  Created by Harnashevich on 24.11.22.
//

import Foundation

final class DateFormatterManager {
    
    static let shared = DateFormatterManager()
    
    private let formatter = DateFormatter()
    
    private init() {}
    
    private func configureFormatter(formatter: DateFormatter, format: String) {
        formatter.dateFormat = format
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "ru_RU")
    }
    
    // Форматирум дату из "dd.MM.yyyy" в "Пн, Вт и тд"
    func changeDateFormat(date: String?) -> String {
        self.configureFormatter(formatter: self.formatter, format: "dd.MM.yyyy")
        guard let date = date,
              let shortDay = self.formatter.date(from: date) else { return String() }
        self.configureFormatter(formatter: self.formatter, format: "EEEEEE")
        return formatter.string(from: shortDay)
    }
}
