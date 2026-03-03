//
//  OnboardingIntro.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/12/25.
//

import SwiftUI

struct OnboardingIntro: View {
    @ObservedObject var coordinator: OnboardingCoordinator
    
    var body: some View {
        Asset.Assets.splash.swiftUIImage
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .onAppear {
                print("OnboardingIntro appeared")
                 DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                     print("Pushing main, path count before: \(coordinator.navigationPath.count)")
                     coordinator.push(.main)
                     print("Path count after: \(coordinator.navigationPath.count)")
                 }
            }
    }
}
//
//#Preview {
//    OnboardingIntro()
//}
