//
//  Double+Extension.swift
//  weather-swiftui
//
//  Created by Thân Văn Thanh on 05/05/2023.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
