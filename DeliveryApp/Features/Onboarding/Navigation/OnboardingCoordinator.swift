//
//  OnboardingCoordinator.swift
//  Features/Onboarding/Navigation/
//

import SwiftUI

enum OnboardingRoute: Hashable {
    case intro
    case main
}

@MainActor
class OnboardingCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var showIntro = true
    
    var onComplete: (() -> Void)?
    
    func start() {
        // Show intro for 2 seconds then navigate to main
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.showIntro = false
            }
        }
    }
    
    func completeOnboarding() {
        onComplete?()
    }
}

//
//  OnboardingCoordinatorView.swift
//  Features/Onboarding/Navigation/
//

import SwiftUI

struct OnboardingCoordinatorView: View {
    @StateObject private var coordinator = OnboardingCoordinator()
    let onComplete: () -> Void
    
    init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    
    var body: some View {
        ZStack {
            if coordinator.showIntro {
                OnboardingIntro()
                    .transition(.opacity)
            } else {
                OnboardingMain(
                    onComplete: {
                        coordinator.completeOnboarding()
                    }
                )
                .transition(.opacity)
            }
        }
        .onAppear {
            coordinator.onComplete = onComplete
            coordinator.start()
        }
    }
}
