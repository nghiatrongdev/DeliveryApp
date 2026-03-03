//
//  DeliveryAppApp.swift
//  DeliveryApp
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import UIKit
import FBSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        
        return ApplicationDelegate.shared.application(
            app,
            open: url,
            options: options
        )
    }
}


@main
struct DeliveryAppApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var appDelegate
    
    @StateObject private var coordinator = AppCoordinator()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(coordinator)
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
@MainActor
class AppCoordinator: ObservableObject {
    @Published var flow: AppFlow = .onboarding
    @Published var selectedTab: AppTab = .home
    
    lazy var onboardingCoordinator: OnboardingCoordinator = {
        let c = OnboardingCoordinator()
        c.parent = self
        return c
    }()
    
    lazy var loginCoordinator: LoginCoordinator = {
        let c = LoginCoordinator()
        c.parent = self
        return c
    }()
    
    func navigateTo(tab: AppTab, route: (any AppRoute)? = nil) {  // ← Route -> AppRoute
        selectedTab = tab
    }
    
    func handleDeepLink(_ url: URL) {
        let components = url.pathComponents
        if components.contains("product"), let id = components.last {
            // navigateTo(...)
        }
    }
}

enum AppTab: String, CaseIterable {
    case home
    case search
    case cart
    case profile
    
    var title: String {
        rawValue.capitalized
    }
    
    var icon: String {
        switch self {
        case .home:    return "house"
        case .search:  return "magnifyingglass"
        case .cart:    return "cart"
        case .profile: return "person"
        }
    }
}

enum AppFlow {
    case onboarding
    case login
    case main
}
