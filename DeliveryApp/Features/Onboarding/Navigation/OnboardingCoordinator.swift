//
//  OnboardingCoordinator.swift
//  Features/Onboarding/Navigation/
//

import SwiftUI

enum OnboardingRoute: Route {
    case intro
    case main
    
    var id: String {
        switch self {
        case .intro:
            return "onboardingIntro"
        case .main:
            return "onboardingMain"
        }
    }
}

@MainActor
class OnboardingCoordinator: Coordinator {
    @Published var navigationStack: [OnboardingRoute] = []
    
    typealias RouteType = OnboardingRoute
    
    var parent: AppCoordinator?
    
    func compleOnboarding(){
        parent?.flow = .login
    }
}

struct OnboardingNavigationView: View {
    @ObservedObject var coordinator: OnboardingCoordinator
    
    var body: some View {
        BaseNavigationView(coordinator: coordinator) {
            OnboardingIntro(coordinator: coordinator)
        } destinationBuilder: { route in
            AnyView(
                Group {
                    switch route {
                    case .intro:
                        OnboardingIntro(coordinator: coordinator)
                    case .main:
                        OnboardingMain(coordinator: coordinator)
                    }
                }
            )
        }
    }
}
