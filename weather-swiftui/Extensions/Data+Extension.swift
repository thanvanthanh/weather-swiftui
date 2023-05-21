//
//  Data+Extension.swift
//  weather-swiftui
//
//  Created by Thân Văn Thanh on 05/05/2023.
//

import Foundation

extension Date {
    func weekDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        let weekDay = dateFormatter.string(from: self )
        return weekDay
    }
}
