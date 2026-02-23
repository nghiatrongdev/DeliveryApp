//
//  LoginCoordinator.swift
//  DeliveryApp
//
//  Created by Nguyen Trong Nghia on 20/2/26.
//

import Foundation
import SwiftUI

enum LoginRoute: Route {
    case login
    var id: String{
        switch self {
        case .login:
            return "login"
        }
    }
    
   
}

@MainActor
class LoginCoordinator: Coordinator {
    @Published var navigationStack: [LoginRoute] = []
    
    typealias RouteType = LoginRoute
    
    var parent: AppCoordinator?
}

struct LoginNavigationView: View {
    @ObservedObject var coordinator: LoginCoordinator
    
    var body: some View {
        BaseNavigationView(coordinator: coordinator) {
            LoginNavigationView(coordinator: coordinator)
        } destinationBuilder: { route in
            AnyView(
                Group {
                    switch route {
                    case .login:
                        LoginNavigationView(coordinator: coordinator)
                    }
                }
            )
        }
    }
}
