//
//  BackButton.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 25/2/26.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0) {
                Asset.Assets.arrowLeft.swiftUIImage
                    .frame(width: 24, height: 24)
                Text("Back")
                    .font(FontFamily.Poppins.bold.swiftUIFont(size: 15))
                    .foregroundStyle(Asset.Colors.typography500.swiftUIColor)
                    .offset(x: -10)
            }
        }
    }
}
