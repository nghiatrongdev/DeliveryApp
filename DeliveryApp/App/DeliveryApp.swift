//
//  DeliveryAppApp.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 1/12/25.
//

import SwiftUI

@main
struct DeliveryAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

@MainActor
class AppCoordinator: ObservableObject {
    @Published var selectedTab: AppTab = .home
    
    // Feature coordinators
    let onboardingCoordinator = OnboardingCoordinator()
//    let homeCoordinator = HomeCoordinator()
//    let searchCoordinator = SearchCoordinator()
//    let cartCoordinator = CartCoordinator()
//    let profileCoordinator = ProfileCoordinator()
    
    init() {
        // Inject parent reference cho cross-feature navigation
//        homeCoordinator.parent = self
//        searchCoordinator.parent = self
//        cartCoordinator.parent = self
//        profileCoordinator.parent = self
        onboardingCoordinator.parent = self
    }
    
    // MARK: - Cross-feature Navigation
    
    /// Navigate to specific tab and optionally push route
    func navigateTo(tab: AppTab, route: (any Route)? = nil) {
        selectedTab = tab
//        
//        // Push route if provided
//        if let route = route {
//            switch tab {
//            case .home:
//                if let homeRoute = route as? HomeRoute {
//                    homeCoordinator.push(homeRoute)
//                }
//            case .search:
//                if let searchRoute = route as? SearchRoute {
//                    searchCoordinator.push(searchRoute)
//                }
//            case .cart:
//                if let cartRoute = route as? CartRoute {
//                    cartCoordinator.push(cartRoute)
//                }
//            case .profile:
//                if let profileRoute = route as? ProfileRoute {
//                    profileCoordinator.push(profileRoute)
//                }
//            }
//        }
    }
    
    /// Deep link handler
    func handleDeepLink(_ url: URL) {
        // Parse URL và navigate
        // Example: myapp://product/123
        let components = url.pathComponents
        
        if components.contains("product"), let id = components.last {
//            navigateTo(tab: .search, route: SearchRoute.productDetail(id: id))
        }
    }
    
    /// Reset specific tab to root
 
}

enum AppTab: String, CaseIterable {
    case home
    case search
    case cart
    case profile
    case onboarding
    
    var title: String {
        rawValue.capitalized
    }
    
    var icon: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .cart: return "cart"
        case .profile: return "person"
        case .onboarding:return "onboarding"
        }
    }
}
