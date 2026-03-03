// BaseNavigationView.swift

import SwiftUI

struct BaseNavigationView<Content: View, C: Coordinator>: View {
    @ObservedObject var coordinator: C
    let rootView: Content
    let destinationBuilder: (C.RouteType) -> AnyView
    
    init(
        coordinator: C,
        @ViewBuilder rootView: () -> Content,
        @ViewBuilder destinationBuilder: @escaping (C.RouteType) -> AnyView
    ) {
        self.coordinator = coordinator
        self.rootView = rootView()
        self.destinationBuilder = destinationBuilder
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            rootView
                .navigationDestination(for: C.RouteType.self) { route in
                    destinationBuilder(route)
                        .navigationBarHidden(true)
                }
        }
    }
}
