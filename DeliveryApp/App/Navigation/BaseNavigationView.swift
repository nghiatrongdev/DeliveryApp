//
//  BaseNavigationView.swift
//  DeliveryApp
//
//  Created by Nguyen Trong Nghia on 23/12/25.
//

import Foundation
import SwiftUI

struct BaseNavigationView<Content: View, RouteType: Route>: View {
    @ObservedObject var coordinator: AnyObject
    let rootView: Content
    let navigationStack: [RouteType]
    let destinationBuilder: (RouteType) -> AnyView
    
    init<C: Coordinator>(
        coordinator: C,
        rootView: Content,
        @ViewBuilder destinationBuilder: @escaping (RouteType) -> AnyView
    ) where C.RouteType == RouteType {
        self.coordinator = coordinator as AnyObject
        self.rootView = rootView
        self.navigationStack = coordinator.navigationStack
        self.destinationBuilder = destinationBuilder
    }
    
    var body: some View {
        NavigationView {
            rootView
                .background(
                    navigationLinks
                )
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder
    private var navigationLinks: some View {
        ForEach(navigationStack) { route in
            NavigationLink(
                destination: destinationBuilder(route),
                tag: route,
                selection: Binding(
                    get: { navigationStack.last },
                    set: { _ in }
                )
            ) {
                EmptyView()
            }
            .hidden()
        }
    }
}
