//
//  Buttons.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 2/12/25.
//

import SwiftUI

// MARK: - Button Type
enum ButtonType {
    case primary
    case secondary
    case outline
    case transparent
    case danger
    case disabled
}

// MARK: - Button Size
enum ButtonSize {
    case small
    case medium
    case large
}

// MARK: - Custom Button Style
struct CustomButtonStyle: ButtonStyle {
    var type: ButtonType
    var size: ButtonSize = .medium
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(FontFamily.Poppins.bold.swiftUIFont(size: fontSize(.medium)))
            .padding(paddingFor(size))
            .frame(maxWidth: .infinity)
            .background(backgroundColorFor(type))
            .foregroundColor(foregroundColorFor(type))
            .cornerRadius(12)
            .overlay(
                outlineOverlay(type)   // ⭐️ Thêm dòng này
            )
            .shadow(color: shadowColorFor(type),
                    radius: shadowRadiusFor(type),
                    x: 0,
                    y: shadowYOffsetFor(type))
            .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
    }

}

// MARK: - Helpers

extension CustomButtonStyle {
    
    // Padding theo size
    func paddingFor(_ size: ButtonSize) -> EdgeInsets {
        switch size {
        case .small:  return EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
        case .medium: return EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        case .large:  return EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20)
        }
    }
    
    // Font size theo size
    func fontSize(_ size: ButtonSize) -> CGFloat {
        switch size {
        case .small: return 13
        case .medium: return 15
        case .large: return 17
        }
    }
    
    // Background theo type
    func backgroundColorFor(_ type: ButtonType) -> Color {
        switch type {
        case .primary:     return Color.Background.primary.swiftUIColor
        case .secondary:   return Color.Background.secondary.swiftUIColor
        case .outline:     return Color.Background.element_background.swiftUIColor
        case .transparent: return .clear
        case .danger:      return Color.Background.danger.swiftUIColor
        case .disabled:    return Color.Background.disabled.swiftUIColor
        }
    }
    
    // Foreground theo type
    func foregroundColorFor(_ type: ButtonType) -> Color {
        switch type {
        case .primary:     return Color.Typography.white.swiftUIColor
        case .secondary:   return Color.Typography.primary.swiftUIColor
        case .outline:     return Color.Typography.heading.swiftUIColor
        case .transparent: return Color.Typography.primary700.swiftUIColor
        case .danger:      return Color.Typography.white.swiftUIColor
        case .disabled:    return Color.Typography.disable.swiftUIColor
        }
    }
    
    // Shadow color
    func shadowColorFor(_ type: ButtonType) -> Color {
        switch type {
        case .primary:
            return Asset.Colors.light.swiftUIColor
        case .danger:
            return Asset.Colors.red.swiftUIColor
        default:
            return .clear
        }
    }
    
    // Shadow radius
    func shadowRadiusFor(_ type: ButtonType) -> CGFloat {
        switch type {
        case .primary, .danger: return 4
        default: return 0
        }
    }
    
    // Shadow Y offset
    func shadowYOffsetFor(_ type: ButtonType) -> CGFloat {
        switch type {
        case .primary, .danger: return 2
        default: return 0
        }
    }
    
    func outlineOverlay(_ type: ButtonType) -> some View {
        Group {
            if type == .outline {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColorFor(type), lineWidth: 1)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.clear, lineWidth: 0)
            }
        }
    }

    
    func borderColorFor(_ type: ButtonType) -> Color {
        switch type {
        case .outline:
            return Color.Border.defaultColor.swiftUIColor
        default:
            return .clear
        }
    }

}


// MARK: - Preview
struct CustomButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                
                Group {
                    Text("PRIMARY")
                    previewRow(type: .primary)
                }
                
                Group {
                    Text("SECONDARY")
                    previewRow(type: .secondary)
                }
                
                Group {
                    Text("OUTLINE")
                    previewRow(type: .outline)
                }
                
                Group {
                    Text("TRANSPARENT")
                    previewRow(type: .transparent)
                }
                
                Group {
                    Text("DANGER")
                    previewRow(type: .danger)
                }
                
                Group {
                    Text("DISABLED")
                    previewRow(type: .disabled)
                }
                
            }
            .padding()
        }
        .previewLayout(.sizeThatFits)
    }
    
    // Row preview helper
    @ViewBuilder
    static func previewRow(type: ButtonType) -> some View {
        VStack(spacing: 12) {
            Button("Small") {}
                .buttonStyle(CustomButtonStyle(type: type, size: .small))
            
            Button("Medium") {}
                .buttonStyle(CustomButtonStyle(type: type, size: .medium))
            
            Button("Large") {}
                .buttonStyle(CustomButtonStyle(type: type, size: .large))
        }
    }
}
