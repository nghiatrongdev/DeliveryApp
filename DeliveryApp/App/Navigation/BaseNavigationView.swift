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
        NavigationView {
            rootView
                .background(
                    NavigationStackBuilder(
                        stack: coordinator.navigationStack,
                        destinationBuilder: destinationBuilder
                    )
                )
        }
        .navigationViewStyle(.stack)
    }
}

private struct NavigationStackBuilder<RouteType: Route>: View {
    let stack: [RouteType]
    let destinationBuilder: (RouteType) -> AnyView
    
    var body: some View {
        if let firstRoute = stack.first {
            NavigationLink(
                destination: DestinationWrapper(
                    route: firstRoute,
                    remainingStack: Array(stack.dropFirst()),
                    destinationBuilder: destinationBuilder
                ),
                isActive: .constant(true)
            ) {
                EmptyView()
            }
            .hidden()
        }
    }
}

private struct DestinationWrapper<RouteType: Route>: View {
    let route: RouteType
    let remainingStack: [RouteType]
    let destinationBuilder: (RouteType) -> AnyView
    
    var body: some View {
        destinationBuilder(route)
            .background(
                NavigationStackBuilder(
                    stack: remainingStack,
                    destinationBuilder: destinationBuilder
                )
            )
    }
}
