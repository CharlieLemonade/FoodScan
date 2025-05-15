//
//  Double+Format.swift
//  appFoodScan
//
//  Created by Carlos López on 15/05/25.
//

import Foundation

extension Double {
    func formatted(decimals: Int = 2) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = decimals
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
