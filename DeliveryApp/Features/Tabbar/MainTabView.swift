//
//  MainTabView.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/3/26.
//
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Content
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: CartView()
                case 2: MenuView()
                case 3: TrackOrderView()
                case 4: OthersView()
                default: HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Custom TabBar
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct TabBarItem: View {
    let iconNormal: Image
    let iconSelected: Image
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                (isSelected ? iconSelected : iconNormal)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(isSelected ? Asset.Colors.primary600.swiftUIColor : Asset.Colors.grey400.swiftUIColor)
     
                // Triangle indicator
                Image(systemName: "triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 6)
                    .foregroundColor(isSelected ? Asset.Colors.primary600.swiftUIColor : .clear)
            }
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            // Home
            TabBarItem(
                iconNormal: Asset.Assets.home.swiftUIImage,
                iconSelected: Asset.Assets.homeTilted.swiftUIImage,
                isSelected: selectedTab == 0
            ) { selectedTab = 0 }
            
            Spacer()
            
            // Explore
            TabBarItem(
                iconNormal: Asset.Assets.explore.swiftUIImage,
                iconSelected: Asset.Assets.exploreTilted.swiftUIImage,
                isSelected: selectedTab == 1
            ) { selectedTab = 1 }
            
            Spacer()
            
            // Cart
            TabBarItem(
                iconNormal: Asset.Assets.cart.swiftUIImage,
                iconSelected: Asset.Assets.cartTilted.swiftUIImage,
                isSelected: selectedTab == 2
            ) { selectedTab = 2 }
            
            Spacer()
            
            // Favorite
            TabBarItem(
                iconNormal: Asset.Assets.like.swiftUIImage,
                iconSelected: Asset.Assets.likeTilted.swiftUIImage,
                isSelected: selectedTab == 3
            ) { selectedTab = 3 }
            
            Spacer()
            
            // Notification
            TabBarItem(
                iconNormal: Asset.Assets.notification.swiftUIImage,
                iconSelected: Asset.Assets.notificationTilted.swiftUIImage,
                isSelected: selectedTab == 4
            ) { selectedTab = 4 }
            
            Spacer()
        }
        .padding(.top, 12)
        .padding(.bottom, 32)
        .background(Color.clear)
    }
}
