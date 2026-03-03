// Navigation.swift

import SwiftUI

protocol AppRoute: Hashable, Identifiable {
    var id: String { get }
}

@MainActor
protocol Coordinator: AnyObject, ObservableObject {
    associatedtype RouteType: AppRoute
    
    var navigationPath: [RouteType] { get set }
    var parent: AppCoordinator? { get set }
    
    func push(_ route: RouteType)
    func pop()
    func popToRoot()
    func replace(with route: RouteType)
}

extension Coordinator {
    func push(_ route: RouteType) {
        navigationPath.append(route)
    }
    
    func pop() {
        guard !navigationPath.isEmpty else { return }
        navigationPath.removeLast()
    }
    
    func popToRoot() {
        navigationPath.removeAll()
    }
    
    func replace(with route: RouteType) {
        navigationPath = [route]
    }
}
