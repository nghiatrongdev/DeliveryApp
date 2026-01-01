//
//  OnboardingMain.swift
//  DeliveryApp
//
//  Created by Trọng Nghĩa Nguyễn on 3/12/25.
//

import SwiftUI
import SwiftUI

struct OnboardingMain: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var id: Int = 0
    
    // Các models
    private var models: [OnboardingMainBottom.ContentBottom] = [
        .init(title: "Welcome to the most tastiest app",
              des: "You know, this app is edible meaning you can eat it!"),
        .init(title: "We use nitro on bicycles for delivery!",
              des: "For very fast delivery we use nitro on bicycles, kidding, but we’re very fast."),
        .init(title: "We’re the besties of birthday peoples",
              des: "We send cakes to our plus members, (only one cake per person)")
    ]
    
    var body: some View {
        VStack{
            // Logo
            Asset.Assets.typeSizeSmall.swiftUIImage
                .renderingMode(.template)
                .resizable()
                .frame(width: 70, height: 24)
                .foregroundStyle(colorScheme == .dark ? Asset.Colors.white.swiftUIColor : Asset.Colors.black.swiftUIColor)
                
            // Image main
            getImageMain()
                .resizable()
                .scaledToFit()
            
            if id < models.count {
                OnboardingMainBottom(id: $id, models: models)
                    .frame(height: 280)
            } else {
                OnboardingMainBottomCaseLast()
                    .frame(height: 280)
            }
        }
        .padding(.horizontal, 20)
        .animation(.easeInOut, value: id)
    }
    
    func getImageMain() -> Image {
        switch id {
        case 0: return Asset.Assets.chefCooking.swiftUIImage
        case 1: return Asset.Assets.deliveryGuy.swiftUIImage
        case 2: return Asset.Assets.birthdayGirl.swiftUIImage
        default: return Asset.Assets.burger.swiftUIImage
        }
    }
}

// MARK: - Bottom Content
struct OnboardingMainBottom: View {
    @Binding var id: Int
    var models: [ContentBottom]
    
    struct ContentBottom {
        let title: String
        let des: String
    }
    
    var body: some View {
        if id < models.count {
            VStack {
                Text(models[id].title)
                    .font(FontFamily.Poppins.bold.swiftUIFont(size: 32))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundStyle(Color.Typography.heading.swiftUIColor)
                
                Text(models[id].des)
                    .font(FontFamily.Poppins.regular.swiftUIFont(size: 15))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundStyle(Color.Typography.paragraph.swiftUIColor)
                    .padding(.bottom,40)
                
                // Page Control
                HStack(spacing: 4) {
                    ForEach(0..<models.count, id: \.self) { index in
                        Circle()
                            .fill(index == id ? Color.Background.primary.swiftUIColor : Color.Background.secondary.swiftUIColor)
                            .frame(width: 12, height: 12)
                    }
                }
                .padding(.bottom,24)
                
                // Buttons
                HStack(spacing: 8) {
                    Button("Skip") {
                        id = models.count
                    }
                    .buttonStyle(CustomButtonStyle(type: .secondary, size: .medium))
                    .frame(width: 100)
                    
                    Button("Next") {
                        if id < models.count - 1 {
                            id += 1
                        } else {
                            id = models.count
                        }
                    }
                    .buttonStyle(CustomButtonStyle(type: .primary, size: .medium))
                }
            }
        }
        
    }
}

struct OnboardingMainBottomCaseLast: View {
    var body: some View {
        VStack(spacing:8) {
            Text("Join to get the delicious quizines!")
                .font(FontFamily.Poppins.bold.swiftUIFont(size: 32))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.Typography.heading.swiftUIColor)
                
            Button {
                
            } label: {
                HStack(spacing:8) {
                    Asset.Assets.apple.swiftUIImage
                        .renderingMode(.template)
                        .foregroundStyle(Color.Icon.white.swiftUIColor)
                        .frame(width: 24,height: 24)
                        
                    Text("Continue with Apple")
                }
            }
            .buttonStyle(CustomButtonStyle(type: .primary, size: .medium))
            
            Text("or")
                .font(FontFamily.Poppins.semiBold.swiftUIFont(size: 15))
                .foregroundStyle(Color.Typography.light_grey.swiftUIColor)
            HStack(spacing:8) {
                Button {
                    
                } label: {
                    Asset.Assets.google.swiftUIImage
                        .resizable()
                        .frame(width: 24,height: 24)
                        
                }
                .buttonStyle(CustomButtonStyle(type: .secondary, size: .medium))
                
                Button {
                    
                } label: {
                    Asset.Assets.facebook.swiftUIImage
                        .resizable()
                        .frame(width: 24,height: 24)
                        
                }
                .buttonStyle(CustomButtonStyle(type: .secondary, size: .medium))
                
                Button {
                    
                } label: {
                    Asset.Assets.email.swiftUIImage
                        .resizable()
                        .frame(width: 24,height: 24)
                        
                }
                .buttonStyle(CustomButtonStyle(type: .secondary, size: .medium))

            }
            .frame(height: 52)
            
        }
    }
}

#Preview {
//    OnboardingMain()
    OnboardingMain()
}
