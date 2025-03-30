//
//  Colors.swift
//  appFoodScan
//
//  Created by Carlos López on 28/03/25.
//
import SwiftUI


struct AppColors {
    static let primary = Color(hex: "#A1CE50")
    static let secondary = Color(hex: "#181A1F")
    static let background = Color(hex: "#FAFAFA")
    static let text = Color(hex: "#212121")
    static let secondaryGreen = Color(hex: "F7FBF1")
    static let backgroundBar = Color(hex: "EEEEEE")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#") // Omitir el símbolo #
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
