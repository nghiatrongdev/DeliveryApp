//
//  TopAlertModifier.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/3/26.
//

import Foundation
import SwiftUI
struct TopAlertModifier: ViewModifier {
    @Binding var showAlert: Bool
    @Binding var alertType: AlertType
    @Binding var alertMessage: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .top) {
            content
            if showAlert {
                TopAlertView(type: alertType, message: alertMessage)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(1)
                    .padding(.top, 16)
            }
        }
        .animation(.spring(), value: showAlert)
    }
}

extension View {
    func topAlert(showAlert: Binding<Bool>, type: Binding<AlertType>, message: Binding<String>) -> some View {
        modifier(TopAlertModifier(showAlert: showAlert, alertType: type, alertMessage: message))
    }
}
