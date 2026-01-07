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
class OnboardingCoordinator: Coordinator, ObservableObject {
    var navigationStack: [OnboardingRoute] = []
    
    typealias RouteType = OnboardingRoute
    
    var parent: AppCoordinator?
    
    
}
