//
//  RootView.swift
//  DeliveryApp
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        Group {
            switch coordinator.flow {
            case .onboarding:
                OnboardingNavigationView(
                    coordinator: coordinator.onboardingCoordinator
                )
            case .login:
                LoginNavigationView(
                    coordinator: coordinator.loginCoordinator
                )
            case .main:
               MainTabView()
            }
        }
    }
}

