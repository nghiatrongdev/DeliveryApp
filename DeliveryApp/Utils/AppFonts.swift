//
//  AppFonts.swift
//  BoboFoodDelivery
//
//  Design System - Typography with Custom Fonts
//  Fonts: Poppins (Primary), Roboto (Secondary), Roboto Mono (Monospace)
//

import SwiftUI

struct AppFonts {
    
    // MARK: - Font Family Names
    private static let poppins = "Poppins"
    private static let roboto = "Roboto"
    private static let robotoMono = "RobotoMono"
    
    // MARK: - Font Helper Methods
    /// Poppins font với weights khác nhau
    private static func poppinsFont(weight: PoppinsWeight, size: CGFloat) -> Font {
        return .custom(weight.fontName, size: size)
    }
    
    /// Roboto font với weights khác nhau
    private static func robotoFont(weight: RobotoWeight, size: CGFloat) -> Font {
        return .custom(weight.fontName, size: size)
    }
    
    /// Roboto Mono (monospace) - chỉ có Regular
    private static func robotoMonoFont(size: CGFloat) -> Font {
        return .custom("RobotoMono-Regular", size: size)
    }
    
    // MARK: - Headings (Poppins)
    /// Large title - 34pt Bold (Poppins)
    static let largeTitle = poppinsFont(weight: .bold, size: 34)
    
    /// Title 1 - 28pt Bold (Poppins)
    static let title1 = poppinsFont(weight: .bold, size: 28)
    
    /// Title 2 - 24pt Bold (Poppins)
    static let title2 = poppinsFont(weight: .bold, size: 24)
    
    /// Title 3 - 20pt SemiBold (Poppins)
    static let title3 = poppinsFont(weight: .semiBold, size: 20)
    
    // MARK: - Body Text (Roboto)
    /// Body - 16pt Regular (Roboto)
    static let body = robotoFont(weight: .regular, size: 16)
    
    /// Body Medium - 16pt Medium (Roboto)
    static let bodyMedium = robotoFont(weight: .medium, size: 16)
    
    /// Body Bold - 16pt Bold (Roboto)
    static let bodyBold = robotoFont(weight: .bold, size: 16)
    
    // MARK: - Callout & Subheadline (Roboto)
    /// Callout - 15pt Regular (Roboto)
    static let callout = robotoFont(weight: .regular, size: 15)
    
    /// Subheadline - 14pt Regular (Roboto)
    static let subheadline = robotoFont(weight: .regular, size: 14)
    
    /// Subheadline Medium - 14pt Medium (Roboto)
    static let subheadlineMedium = robotoFont(weight: .medium, size: 14)
    
    // MARK: - Caption (Roboto)
    /// Caption 1 - 12pt Regular (Roboto)
    static let caption1 = robotoFont(weight: .regular, size: 12)
    
    /// Caption 2 - 11pt Regular (Roboto)
    static let caption2 = robotoFont(weight: .regular, size: 11)
    
    /// Caption Bold - 12pt Bold (Roboto)
    static let captionBold = robotoFont(weight: .bold, size: 12)
    
    // MARK: - Special Use Cases
    /// Button Text - 16pt SemiBold (Poppins)
    static let button = poppinsFont(weight: .semiBold, size: 16)
    
    /// Small Button - 14pt SemiBold (Poppins)
    static let buttonSmall = poppinsFont(weight: .semiBold, size: 14)
    
    /// Price - 18pt Bold (Poppins)
    static let price = poppinsFont(weight: .bold, size: 18)
    
    /// Price Small - 16pt Bold (Poppins)
    static let priceSmall = poppinsFont(weight: .bold, size: 16)
    
    /// Tab Bar - 10pt Medium (Poppins)
    static let tabBar = poppinsFont(weight: .medium, size: 10)
    
    /// Badge - 10pt Bold (Poppins)
    static let badge = poppinsFont(weight: .bold, size: 10)
    
    /// Code/Monospace - 14pt Regular (Roboto Mono)
    static let code = robotoMonoFont(size: 14)
    
    /// Order Number/Tracking ID - 16pt Regular (Roboto Mono)
    static let orderNumber = robotoMonoFont(size: 16)
}

// MARK: - Font Weight Enums
enum PoppinsWeight {
    case regular
    case medium
    case semiBold
    case bold
    
    var fontName: String {
        switch self {
        case .regular:
            return "Poppins-Regular"
        case .medium:
            return "Poppins-Medium"
        case .semiBold:
            return "Poppins-SemiBold"
        case .bold:
            return "Poppins-Bold"
        }
    }
}

enum RobotoWeight {
    case regular
    case medium
    case bold
    
    var fontName: String {
        switch self {
        case .regular:
            return "Roboto-Regular"
        case .medium:
            return "Roboto-Medium"
        case .bold:
            return "Roboto-Bold"
        }
    }
}

// MARK: - Text Style Extensions (Easy to use)
extension Text {
    func h1() -> Text {
        self.font(AppFonts.largeTitle)
            .foregroundColor(AppColors.textPrimary)
    }
    
    func h2() -> Text {
        self.font(AppFonts.title1)
            .foregroundColor(AppColors.textPrimary)
    }
    
    func h3() -> Text {
        self.font(AppFonts.title2)
            .foregroundColor(AppColors.textPrimary)
    }
    
    func h4() -> Text {
        self.font(AppFonts.title3)
            .foregroundColor(AppColors.textPrimary)
    }
    
    func bodyText() -> Text {
        self.font(AppFonts.body)
            .foregroundColor(AppColors.textPrimary)
    }
    
    func bodySecondary() -> Text {
        self.font(AppFonts.body)
            .foregroundColor(AppColors.textSecondary)
    }
    
    func caption() -> Text {
        self.font(AppFonts.caption1)
            .foregroundColor(AppColors.textSecondary)
    }
    
    func priceText() -> Text {
        self.font(AppFonts.price)
            .foregroundColor(AppColors.primary)
    }
    
    func orderNumberText() -> Text {
        self.font(AppFonts.orderNumber)
            .foregroundColor(AppColors.textSecondary)
    }
}

// MARK: - Custom Font Modifier
struct CustomFontModifier: ViewModifier {
    let font: Font
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
    }
}

extension View {
    /// Apply custom font with color
    func customFont(_ font: Font, color: Color = AppColors.textPrimary) -> some View {
        self.modifier(CustomFontModifier(font: font, color: color))
    }
}

// MARK: - Debug Helper (để check font names)
#if DEBUG
struct FontDebugger {
    static func printAllFonts() {
        print("\n=== ALL AVAILABLE FONTS ===")
        for family in UIFont.familyNames.sorted() {
            print("\nFamily: \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("  ✓ \(name)")
            }
        }
        print("\n=========================\n")
    }
    
    static func checkCustomFonts() {
        let fontsToCheck = [
            "Poppins-Regular",
            "Poppins-Medium",
            "Poppins-SemiBold",
            "Poppins-Bold",
            "Roboto-Regular",
            "Roboto-Medium",
            "Roboto-Bold",
            "RobotoMono-Regular"
        ]
        
        print("\n=== CUSTOM FONTS CHECK ===")
        for fontName in fontsToCheck {
            if UIFont(name: fontName, size: 16) != nil {
                print("✅ \(fontName) - OK")
            } else {
                print("❌ \(fontName) - NOT FOUND")
            }
        }
        print("=========================\n")
    }
}
#endif

// MARK: - Preview
#Preview {
    ScrollView {
        VStack(alignment: .leading, spacing: 32) {
            // Headings (Poppins)
            FontSection(title: "Headings - Poppins") {
                Text("Large Title 34pt Bold")
                    .font(AppFonts.largeTitle)
                
                Text("Title 1 - 28pt Bold")
                    .font(AppFonts.title1)
                
                Text("Title 2 - 24pt Bold")
                    .font(AppFonts.title2)
                
                Text("Title 3 - 20pt SemiBold")
                    .font(AppFonts.title3)
            }
            
            // Body Text (Roboto)
            FontSection(title: "Body Text - Roboto") {
                Text("Body - 16pt Regular - Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .font(AppFonts.body)
                
                Text("Body Medium - 16pt Medium - Lorem ipsum dolor sit amet.")
                    .font(AppFonts.bodyMedium)
                
                Text("Body Bold - 16pt Bold - Lorem ipsum dolor.")
                    .font(AppFonts.bodyBold)
            }
            
            // Callout & Subheadline (Roboto)
            FontSection(title: "Callout & Subheadline - Roboto") {
                Text("Callout - 15pt Regular")
                    .font(AppFonts.callout)
                
                Text("Subheadline - 14pt Regular")
                    .font(AppFonts.subheadline)
                
                Text("Subheadline Medium - 14pt Medium")
                    .font(AppFonts.subheadlineMedium)
            }
            
            // Caption (Roboto)
            FontSection(title: "Caption - Roboto") {
                Text("Caption 1 - 12pt Regular")
                    .font(AppFonts.caption1)
                
                Text("Caption 2 - 11pt Regular")
                    .font(AppFonts.caption2)
                
                Text("Caption Bold - 12pt Bold")
                    .font(AppFonts.captionBold)
            }
            
            // Special Cases
            FontSection(title: "Special Use Cases") {
                // Button
                Text("Button Text - Poppins SemiBold")
                    .font(AppFonts.button)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(AppColors.primary)
                    .cornerRadius(12)
                
                // Price
                HStack {
                    Text("$19.99")
                        .font(AppFonts.price)
                        .foregroundColor(AppColors.primary)
                    
                    Text("$29.99")
                        .font(AppFonts.priceSmall)
                        .foregroundColor(AppColors.textSecondary)
                        .strikethrough()
                }
                
                // Order Number (Roboto Mono)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Order Number:")
                        .font(AppFonts.caption1)
                        .foregroundColor(AppColors.textSecondary)
                    
                    Text("#ORD-2024-0001")
                        .font(AppFonts.orderNumber)
                        .foregroundColor(AppColors.textPrimary)
                }
                
                // Badge
                Text("New")
                    .font(AppFonts.badge)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(AppColors.error)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            }
            
            // Using Extensions
            FontSection(title: "Using Extensions") {
                Text("H1 Style - Poppins Bold").h1()
                Text("H3 Style - Poppins Bold").h3()
                Text("Body Text Style - Roboto Regular").bodyText()
                Text("Body Secondary Style - Roboto Regular").bodySecondary()
                Text("Caption Style - Roboto Regular").caption()
                Text("$29.99").priceText()
                Text("#ORD-2024-0123").orderNumberText()
            }
            
            // Font Comparison
            FontSection(title: "Font Family Comparison") {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Poppins Bold - Clean & Modern")
                        .font(.custom("Poppins-Bold", size: 18))
                    
                    Text("Roboto Regular - Readable & Neutral")
                        .font(.custom("Roboto-Regular", size: 16))
                    
                    Text("RobotoMono-Regular - #CODE123")
                        .font(.custom("RobotoMono-Regular", size: 14))
                }
            }
            
            // Debug Button
            #if DEBUG
            Button(action: {
                FontDebugger.printAllFonts()
                FontDebugger.checkCustomFonts()
            }) {
                Text("🐛 Print All Fonts (Check Console)")
                    .font(AppFonts.button)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(AppColors.info)
                    .cornerRadius(12)
            }
            #endif
        }
        .padding()
    }
    .background(AppColors.background)
}

struct FontSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(AppColors.primary)
                .textCase(.uppercase)
//                .tracking(0.5)
            
            VStack(alignment: .leading, spacing: 8) {
                content
            }
            .foregroundColor(AppColors.textPrimary)
            
            Divider()
        }
    }
}
