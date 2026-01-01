//
//  Navigation.swift
//  DeliveryApp
//
//  Created by Nguyen Trong Nghia on 23/12/25.
//

import SwiftUI

protocol Route: Hashable, Identifiable {
    var id: String { get }
}

@MainActor
protocol Coordinator: ObservableObject {
    associatedtype RouteType: Route
    
    var navigationStack: [RouteType] { get set }
    
    func push(_ route: RouteType)
    func pop()
    func popToRoot()
    func replace(with route: RouteType)
}

extension Coordinator {
    func push(_ route: RouteType) {
        navigationStack.append(route)
    }
    
    func pop() {
        guard !navigationStack.isEmpty else { return }
        navigationStack.removeLast()
    }
    
    func popToRoot() {
        navigationStack.removeAll()
    }
    
    func replace(with route: RouteType) {
        navigationStack = [route]
    }
    
    func popTo(_ route: RouteType) {
        guard let index = navigationStack.firstIndex(where: { $0.id == route.id }) else {
            return
        }
        navigationStack = Array(navigationStack.prefix(through: index))
    }
}
