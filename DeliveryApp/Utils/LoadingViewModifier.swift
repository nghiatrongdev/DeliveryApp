//
//  LoadingViewModifier.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/3/26.
//

import Foundation
import SwiftUICore

struct LoadingModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isLoading {
                LoadingView()
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.2), value: isLoading)
            }
        }
        .disabled(isLoading)
    }
}

extension View {
    func loading(_ isLoading: Bool) -> some View {
        self.modifier(LoadingModifier(isLoading: isLoading))
    }
}
