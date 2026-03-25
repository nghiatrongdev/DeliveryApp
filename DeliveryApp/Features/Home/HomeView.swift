//
//  HomeView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/3/26.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    @State private var currentBannerIndex = 0
    @State private var selectedCategoryIndex = 0
    private let banners = MockData.banners
    private let categories = MockData.categories
    private let bannerTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                // Header
                VStack(spacing: 2) {
                    Text("Hi, Welcome to bamboo")
                        .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                        .foregroundStyle(Asset.Colors.typography500.swiftUIColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("What are you looking for?")
                        .font(FontFamily.Poppins.medium.swiftUIFont(size: 17))
                        .foregroundStyle(Asset.Colors.typography500.swiftUIColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                // Search bar
                HStack {
                    Asset.Assets.search.swiftUIImage
                        .frame(width: 24, height: 24)
                        .padding(.leading, 16)
                    TextField("Search ...", text: $searchText)
                        .padding()
                        .autocapitalization(.none)
                }
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.clear))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Asset.Colors.grey200.swiftUIColor, lineWidth: 1.5))

                // Banner
                VStack(spacing: 8) {
                    TabView(selection: $currentBannerIndex) {
                        ForEach(Array(banners.enumerated()), id: \.element.id) { index, banner in
                            BannerCard(banner: banner)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(height: 150)

                    // Dots indicator
                    HStack(spacing: 6) {
                        ForEach(0..<banners.count, id: \.self) { index in
                            Capsule()
                                .fill(index == currentBannerIndex
                                      ? Asset.Colors.primary500.swiftUIColor
                                      : Asset.Colors.grey200.swiftUIColor)
                                .frame(width: index == currentBannerIndex ? 20 : 6, height: 6)
                                .animation(.easeInOut(duration: 0.3), value: currentBannerIndex)
                        }
                    }
                }
                .onReceive(bannerTimer) { _ in
                    withAnimation {
                        currentBannerIndex = (currentBannerIndex + 1) % banners.count
                    }
                }

                // Categories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(Array(categories.enumerated()), id: \.offset) { index, category in
                            HomeCategoryItem(text: category, isSelected: selectedCategoryIndex == index)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedCategoryIndex = index
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.horizontal, -20)

                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
        }
    }
}

struct BannerCard: View {
    let banner: Banner

    var body: some View {
        let colors = banner.gradientColors.map { Color(hex: $0) }

        ZStack {
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(banner.title)
                        .font(FontFamily.Poppins.bold.swiftUIFont(size: 20))
                        .foregroundStyle(.white)
                    Text(banner.subtitle)
                        .font(FontFamily.Poppins.regular.swiftUIFont(size: 13))
                        .foregroundStyle(.white.opacity(0.9))
                    Spacer()
                    Text("Xem ngay →")
                        .font(FontFamily.Poppins.semiBold.swiftUIFont(size: 12))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 7)
                        .background(Capsule().fill(.white.opacity(0.25)))
                }
                .padding(.leading, 20)
                .padding(.vertical, 18)

                Spacer()

                Image(banner.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110)
                    .padding(.trailing, 10)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color(hex: banner.gradientColors[0]).opacity(0.35), radius: 10, x: 0, y: 4)
    }
}

struct HomeCategoryItem: View {
    var text: String
    var isSelected: Bool
    var body: some View {
        Text(text)
            .font(isSelected ? FontFamily.Poppins.semiBold.swiftUIFont(size: 14) : FontFamily.Poppins.medium.swiftUIFont(size: 14))
            .foregroundStyle(isSelected ? Asset.Colors.typography500.swiftUIColor : Asset.Colors.typography300.swiftUIColor)
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 8).fill(isSelected ? Asset.Colors.primary100.swiftUIColor : Color.clear))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(isSelected ? Color.clear : Asset.Colors.grey200.swiftUIColor))
    }
}

struct HomeFoodItem: View {
//    var image: Image
//    var rate: String
//    var name: String
//    var price: String
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .bottomLeading) {
//                image
                
                Asset.Assets.chefCooking.swiftUIImage
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .frame(width: 16, height: 16)
                        .foregroundStyle(Color.yellow)
                    Text("")
                        .font(FontFamily.Poppins.medium.swiftUIFont(size: 12))
                        .foregroundStyle(Asset.Colors.typography400.swiftUIColor)
                }
                .padding(8)
            }
            
            VStack {
                Text("")
                    .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                    .foregroundStyle(Asset.Colors.typography500.swiftUIColor)
                
                HStack {
                    Text("$12.75")
                    
                    Button {
                        // handle add
                    } label: {
                        Asset.Assets.add.swiftUIImage
                            .renderingMode(.template)
                            .foregroundStyle(Asset.Colors.primary600.swiftUIColor)
                    }

                }
            }
            
            
        }
    }
}
#Preview {
//    HomeView()
    HomeFoodItem()
}
