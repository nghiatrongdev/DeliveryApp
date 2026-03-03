//
//  AlertView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 2/3/26.
//

import Foundation
import SwiftUI

enum AlertType {
    case success
    case error
    
    var icon: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.circle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .success: return Asset.Colors.green.swiftUIColor
        case .error: return Asset.Colors.red.swiftUIColor
        }
    }
}

struct TopAlertView: View {
    let type: AlertType
    let message: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: type.icon)
                .foregroundColor(type.color)
                .font(.system(size: 20))
            
            Text(message)
                .foregroundColor(type.color)
                .font(.system(size: 14, weight: .medium))
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(UIColor.systemGray6).opacity(0.95))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal, 16)
    }
}
