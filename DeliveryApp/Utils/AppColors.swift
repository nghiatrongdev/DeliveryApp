//
//  AppColors.swift
//  BoboFoodDelivery
//
//  Design System - Colors với Dark Mode support
//

import SwiftUI
extension Color {
    struct Background{
        static let primary = Asset.Colors.light
        static let secondary = Asset.Colors.primary100
        static let danger = Asset.Colors.red
        static let light_red = Color(hex: "FEF5F3")
        static let grey = Asset.Colors.grey500
        static let disabled = Asset.Colors.grey200
        static let surface_background = Asset.Colors.grey0
        static let element_background = Asset.Colors.grey0
        static let layer_1_background = Asset.Colors.grey50
        static let layer_2_background = Asset.Colors.grey100
        static let layer_3_background = Asset.Colors.grey200
        static let background_blur = Color(hex: "9FA19E",alpha: 0.8)
        static let transparent_nav = Asset.Colors.grey0
        static let dark_mode_darkest = Asset.Colors.black
    }
    
    struct Typography {
        static let heading = Asset.Colors.typography500
        static let paragraph = Asset.Colors.typography400
        static let light_grey = Asset.Colors.typography300
        static let inactive = Asset.Colors.typography200
        static let disable = Asset.Colors.typography100
        static let primary = Asset.Colors.primary600
        static let primary700 = Asset.Colors.primary700
        static let white = Asset.Colors.white
        static let danger = Asset.Colors.red
    }
    
    struct Icon{
        static let defaultColor = Asset.Colors.grey500
        static let light = Asset.Colors.grey400
        static let disabled = Asset.Colors.grey400
        static let primary = Asset.Colors.primary600
        static let white = Asset.Colors.white
    }
    
    struct Border {
        static let defaultColor = Asset.Colors.grey200
        static let light = Asset.Colors.grey100
        static let primary = Asset.Colors.primary600
        static let dark = Asset.Colors.grey500
        static let link = Asset.Colors.blue
        static let transparent_grey = Color(hex: "91958E", alpha: 0.06)
        static let transparent_primary = Color(hex: "54A312", alpha: 0.24)
    }
    
    struct Illustration{
        static let grey_lightest = Asset.Colors.grey100
        static let grey = Asset.Colors.grey200
        static let grey_dark = Asset.Colors.grey300
    }
}

// MARK: - Color Extension for Hex Support
extension Color {

    init(hex: String, alpha: Double? = nil) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RRGGBB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // AARRGGBB (32-bit)
            (a, r, g, b) = (int >> 24 & 0xFF,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        let alphaValue = alpha ?? Double(a) / 255
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: alphaValue
        )
    }
}


