//
//  ContentView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 1/12/25.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

struct RootView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        switch coordinator.flow {
        case .onboarding:
            OnboardingNavigationView(coordinator: coordinator.onboardingCoordinator)
        case .main:
            OnboardingNavigationView(coordinator: coordinator.onboardingCoordinator)
        case .login:
            OnboardingNavigationView(coordinator: coordinator.onboardingCoordinator)
        }
    }
}
