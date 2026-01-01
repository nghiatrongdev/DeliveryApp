//
//  OnboardingIntro.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/12/25.
//

import SwiftUI

struct OnboardingIntro: View {
    var body: some View {
        Asset.Assets.splash.swiftUIImage
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    OnboardingIntro()
}
