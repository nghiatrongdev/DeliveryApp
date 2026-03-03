//
//  LoadingView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/3/26.
//

import SwiftUI

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.4)
                
                Text("Loading...")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 24)
            .background(Color.black.opacity(0.85))
            .cornerRadius(16)
        }
    }
}

#Preview {
    LoadingView()
}

