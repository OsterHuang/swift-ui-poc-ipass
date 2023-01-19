//
//  UIColorExt.swift
//  ipass
//
//  Created by Oster Huang on 11/01/2023.
//

import SwiftUI

extension Color {
    static var green500 = Color(hex: "#58a500")
    static var red500 = Color(hex: "#fc3d39")
    
    static var white200 = Color(hex: "f3f3f3")
    
    static var gray300 = Color(hex: "#d1d1d6")
    static var gray500 = Color(hex: "#aeaeb2")
    static var gray600 = Color(hex: "#8e8e93")
    static var gray800 = Color(hex: "#2b2b2b")
    
    
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
