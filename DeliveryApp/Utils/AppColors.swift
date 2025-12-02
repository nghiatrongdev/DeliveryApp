//
//  AppColors.swift
//  BoboFoodDelivery
//
//  Design System - Colors với Dark Mode support
//

import SwiftUI

struct AppColors {
    
    // MARK: - Primary Colors
    /// Main brand color - Orange
    static let primary = Color("Primary")
    static let primaryDark = Color("PrimaryDark")
    static let primaryLight = Color("PrimaryLight")
    
    // MARK: - Secondary Colors
    static let secondary = Color("Secondary")
    static let accent = Color("Accent")
    
    // MARK: - Background Colors
    /// Main background - White (Light) / Dark (Dark Mode)
    static let background = Color("Background")
    /// Secondary background - Light Gray (Light) / Dark Gray (Dark Mode)
    static let backgroundSecondary = Color("BackgroundSecondary")
    /// Card background
    static let cardBackground = Color("CardBackground")
    
    // MARK: - Text Colors
    /// Primary text - Black (Light) / White (Dark Mode)
    static let textPrimary = Color("TextPrimary")
    /// Secondary text - Gray
    static let textSecondary = Color("TextSecondary")
    /// Tertiary text - Light Gray
    static let textTertiary = Color("TextTertiary")
    /// Text on primary color (always white)
    static let textOnPrimary = Color.white
    
    // MARK: - Semantic Colors
    static let success = Color("Success")
    static let error = Color("Error")
    static let warning = Color("Warning")
    static let info = Color("Info")
    
    // MARK: - Border & Divider
    static let border = Color("Border")
    static let divider = Color("Divider")
    
    // MARK: - Special Colors
    static let shadow = Color.black.opacity(0.1)
    static let overlay = Color.black.opacity(0.4)
    static let shimmer = Color.white.opacity(0.3)
    
    // MARK: - Rating Star
    static let ratingStar = Color("RatingStar")
    
    // MARK: - Tab Bar
    static let tabBarBackground = Color("TabBarBackground")
    static let tabBarSelected = Color("Primary")
    static let tabBarUnselected = Color("TextSecondary")
}

// MARK: - Hardcoded Colors (Fallback nếu chưa setup Assets)
extension AppColors {
    struct Fallback {
        // Light Mode Colors
        static let primaryLight = Color(hex: "#FF6B35")      // Orange
        static let primaryDarkLight = Color(hex: "#E85A2A")  // Darker Orange
        static let primaryLightLight = Color(hex: "#FF8C5F") // Lighter Orange
        static let secondaryLight = Color(hex: "#FFC107")    // Yellow/Gold
        static let accentLight = Color(hex: "#4CAF50")       // Green
        
        static let backgroundLight = Color.white
        static let backgroundSecondaryLight = Color(hex: "#F5F5F5")
        static let cardBackgroundLight = Color.white
        
        static let textPrimaryLight = Color(hex: "#212121")
        static let textSecondaryLight = Color(hex: "#757575")
        static let textTertiaryLight = Color(hex: "#BDBDBD")
        
        static let successLight = Color(hex: "#4CAF50")
        static let errorLight = Color(hex: "#F44336")
        static let warningLight = Color(hex: "#FF9800")
        static let infoLight = Color(hex: "#2196F3")
        
        static let borderLight = Color(hex: "#E0E0E0")
        static let dividerLight = Color(hex: "#EEEEEE")
        
        static let ratingStarLight = Color(hex: "#FFC107")
        static let tabBarBackgroundLight = Color.white
        
        // Dark Mode Colors
        static let primaryDark = Color(hex: "#FF6B35")       // Same orange
        static let primaryDarkDark = Color(hex: "#E85A2A")
        static let primaryLightDark = Color(hex: "#FF8C5F")
        static let secondaryDark = Color(hex: "#FFD54F")     // Lighter Yellow
        static let accentDark = Color(hex: "#66BB6A")        // Lighter Green
        
        static let backgroundDark = Color(hex: "#121212")
        static let backgroundSecondaryDark = Color(hex: "#1E1E1E")
        static let cardBackgroundDark = Color(hex: "#2C2C2C")
        
        static let textPrimaryDark = Color(hex: "#FFFFFF")
        static let textSecondaryDark = Color(hex: "#B0B0B0")
        static let textTertiaryDark = Color(hex: "#808080")
        
        static let successDark = Color(hex: "#66BB6A")
        static let errorDark = Color(hex: "#EF5350")
        static let warningDark = Color(hex: "#FFA726")
        static let infoDark = Color(hex: "#42A5F5")
        
        static let borderDark = Color(hex: "#3C3C3C")
        static let dividerDark = Color(hex: "#2C2C2C")
        
        static let ratingStarDark = Color(hex: "#FFD54F")
        static let tabBarBackgroundDark = Color(hex: "#1E1E1E")
    }
}

// MARK: - Color Extension for Hex Support
extension Color {
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

// MARK: - Preview
#Preview {
    ScrollView {
        VStack(spacing: 24) {
            // Primary Colors
            ColorSection(title: "Primary Colors") {
                ColorBox(color: AppColors.primary, name: "Primary")
                ColorBox(color: AppColors.primaryDark, name: "Primary Dark")
                ColorBox(color: AppColors.primaryLight, name: "Primary Light")
            }
            
            // Background Colors
            ColorSection(title: "Background Colors") {
                ColorBox(color: AppColors.background, name: "Background")
                ColorBox(color: AppColors.backgroundSecondary, name: "Background Secondary")
                ColorBox(color: AppColors.cardBackground, name: "Card Background")
            }
            
            // Text Colors
            ColorSection(title: "Text Colors") {
                ColorBox(color: AppColors.textPrimary, name: "Text Primary")
                ColorBox(color: AppColors.textSecondary, name: "Text Secondary")
                ColorBox(color: AppColors.textTertiary, name: "Text Tertiary")
            }
            
            // Semantic Colors
            ColorSection(title: "Semantic Colors") {
                ColorBox(color: AppColors.success, name: "Success")
                ColorBox(color: AppColors.error, name: "Error")
                ColorBox(color: AppColors.warning, name: "Warning")
                ColorBox(color: AppColors.info, name: "Info")
            }
        }
        .padding()
    }
    .background(AppColors.background)
}

struct ColorSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(AppColors.textPrimary)
            
            HStack(spacing: 12) {
                content
            }
        }
    }
}

struct ColorBox: View {
    let color: Color
    let name: String
    
    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width: 80, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(AppColors.border, lineWidth: 1)
                )
            
            Text(name)
                .font(.caption)
                .foregroundColor(AppColors.textSecondary)
                .multilineTextAlignment(.center)
        }
    }
}
