//
//  LoginCoordinator.swift
//  DeliveryApp
//

import Foundation
import SwiftUI

enum LoginRoute: AppRoute {
    case login
    case register
    case forgot
    
    var id: String {
        switch self {
        case .login: return "login"
        case .register: return "register"
        case .forgot: return "forgot"
            
        }
    }
}

@MainActor
final class LoginCoordinator: Coordinator {
    @Published var navigationPath: [LoginRoute] = []
    
    typealias RouteType = LoginRoute
    
    weak var parent: AppCoordinator?
    
    func completeLogin() {
        parent?.flow = .main
    }
}

struct LoginNavigationView: View {
    @ObservedObject var coordinator: LoginCoordinator
    
    var body: some View {
        BaseNavigationView(coordinator: coordinator) {
            LoginView(coordinator: coordinator)
        } destinationBuilder: { route -> AnyView in
            AnyView(
                Group {
                    switch route {
                    case .login:
                        LoginView(coordinator: coordinator)
                    case .register:
                        RegisterView(coordinator: coordinator)
                    case .forgot:
                        ForgotPasswordView(coordinator: coordinator)
                    }
                })
        }
    }
}
