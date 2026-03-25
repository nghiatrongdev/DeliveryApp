# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development

- Open `DeliveryApp.xcodeproj` in Xcode to build and run
- Dependencies managed via CocoaPods: run `pod install` from the project root (next to `Podfile`)
- Always open `DeliveryApp.xcworkspace` (not `.xcodeproj`) after running `pod install`
- Asset/font code generation uses SwiftGen: run `swiftgen config run` from `DeliveryApp/Resources/`
- Generated files (`Resources/Generated/Assets.swift`, `Resources/Generated/Fonts.swift`) should not be manually edited

## Architecture

The app uses a **Coordinator pattern** layered over SwiftUI with MVVM views.

**Navigation / Coordinator layer:**
- `App/DeliveryApp.swift` — `@main` entry point, hosts `AppCoordinator` which manages top-level flow: onboarding → auth → main
- `App/RootView.swift` — switches the root view based on `AppCoordinator.appFlow`
- `App/Navigation/BaseNavigation.swift` — defines `Coordinator` protocol and `AppRoute` enum
- Each feature has its own coordinator (e.g., `LoginCoordinator`, `OnboardingCoordinator`) that owns a `NavigationPath` and pushes/pops routes

**Feature modules** live under `Features/`, each with `Navigation/` and `View/` subdirectories:
- `Auth/` — Login, Register, ForgotPassword screens backed by `AuthService`
- `Onboarding/` — Splash → 3-step carousel → social/email login entry
- `Tabbar/` — `MainTabView` with 5 tabs (Home, Explore, Cart, Favorite, Notification)
- `Home/` — implemented; all other tab screens are scaffolded placeholders

**Shared infrastructure:**
- `AuthService.swift` — singleton (`AuthService.shared`) wrapping Firebase Auth + Google/Facebook sign-in
- `Data/Model.swift` — `Restaurant` and `Food` structs plus `MockData`
- `Components/` — reusable UI: `CustomButtonStyle`, `TextFieldCommon`/`SecureTextFieldCommon`, `LoadingView`, `AlertView`
- `Utils/AppColors.swift` — design-system color tokens via `Color` extensions (e.g., `Color.Background.primary`)
- `Utils/LoadingViewModifier.swift` — `.loading(_ isLoading: Bool)` view modifier
- `Utils/TopAlertModifier.swift` — `.topAlert(showAlert:type:message:)` view modifier

## Key Conventions

**Colors:** Use design-system tokens from `AppColors.swift` (`Color.Background.*`, `Color.Typography.*`, `Color.Icon.*`, `Color.Border.*`). Hex colors are supported via `Color(hex: "RRGGBB", alpha: 0.8)`.

**Fonts:** Access via SwiftGen-generated `FontFamily` enum — e.g., `FontFamily.Poppins.semiBold.swiftUIFont(size: 16)`. Available families: Poppins, Roboto, RobotoMono.

**Buttons:** Use `CustomButtonStyle(type:size:)` — types: `primary`, `secondary`, `outline`, `transparent`, `danger`, `disabled`.

**Text fields:** Use `TextFieldCommon` / `SecureTextFieldCommon` with `FieldState` (`.normal`, `.valid`, `.invalid`) for validation-aware styling.

**Loading & alerts:** Apply `.loading(isLoading)` and `.topAlert(...)` modifiers at the view level rather than building custom overlays.

## Dependencies (Podfile)

| Pod | Purpose |
|-----|---------|
| SwiftGen ~> 6.0 | Type-safe asset/font code generation |
| FirebaseAuth | Email + social authentication |
| FirebaseFirestore | Cloud database |
| GoogleSignIn | Google OAuth |
| FBSDKLoginKit | Facebook OAuth |
