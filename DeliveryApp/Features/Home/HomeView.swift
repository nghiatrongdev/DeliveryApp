//
//  HomeView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/3/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Hi, Welcome to bamboo")
                .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                .foregroundStyle(Asset.Colors.typography500.swiftUIColor)
                .frame(maxWidth: .infinity,alignment: .leading)
            Text("What are you looking for?")
                .font(FontFamily.Poppins.medium.swiftUIFont(size: 17))
                .foregroundStyle(Asset.Colors.typography500.swiftUIColor)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            HStack {
                Asset.Assets.search.swiftUIImage
                    .frame(width: 24,height: 24)
                
//                TextField(text: searchText, label: placeholder)
            }
            Spacer()
                
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    HomeView()
}
