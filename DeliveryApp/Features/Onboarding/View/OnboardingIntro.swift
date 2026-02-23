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
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    coordinator.push(.main)
                }
            }
    }
}
//
//#Preview {
//    OnboardingIntro()
//}
