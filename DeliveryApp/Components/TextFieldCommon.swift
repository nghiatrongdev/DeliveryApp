//
//  TextFieldCommon.swift
//  DeliveryApp
//
//  Created by Nguyen Trong Nghia on 18/2/26.
//

import SwiftUI

enum FieldState {
    case normal
    case valid
    case invalid
    
    var borderColor: Color {
        switch self {
        case .normal:
            return Asset.Colors.grey200.swiftUIColor
        case .valid:
            return Asset.Colors.primary600.swiftUIColor
        case .invalid:
            return .clear
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .invalid:
            return Asset.Colors.red.swiftUIColor.opacity(0.08)
        default:
            return Color.clear
        }
    }
}
struct TextFieldCommon: View {
    
    var title: String?
    var placeholder: String
    @Binding var text: String
    var state: FieldState = .normal
    var errorMessage: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            if let title = title {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            TextField(placeholder, text: $text)
                .padding()
                .autocapitalization(.none)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(state.backgroundColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(state.borderColor, lineWidth: 1.5)
                )
                .animation(.easeInOut(duration: 0.2), value: state)
                .font(FontFamily.Poppins.regular.swiftUIFont(size: 14))
            
            if state == .invalid,
               let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                    .foregroundColor(Asset.Colors.red.swiftUIColor)
                    .transition(.opacity)
            }
        }
    }
}

struct SecureTextFieldCommon: View {
    var title: String?
    var placeholder: String
    @Binding var text: String
    var state: FieldState = .normal
    var errorMessage: String? = nil
    
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            if let title = title {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack {
                Group {
                    if isSecure {
                        SecureField(placeholder, text: $text)
                            .autocapitalization(.none)
                            .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                    } else {
                        TextField(placeholder, text: $text)
                            .autocapitalization(.none)
                            .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                    }
                }
                
                Button {
                    isSecure.toggle()
                } label: {
                    if isSecure{
                        Asset.Assets.visible.swiftUIImage
                    } else {
                        Asset.Assets.notVisible.swiftUIImage
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(state.backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(state.borderColor, lineWidth: 1.5)
            )
            .animation(.easeInOut(duration: 0.2), value: state)
            
            if state == .invalid,
               let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
                    .transition(.opacity)
            }
        }
    }
}


