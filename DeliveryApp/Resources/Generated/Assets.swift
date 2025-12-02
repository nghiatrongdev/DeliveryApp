// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let add = ImageAsset(name: "Add")
    internal static let apple = ImageAsset(name: "Apple")
    internal static let arrowDown = ImageAsset(name: "Arrow down")
    internal static let arrowLeft = ImageAsset(name: "Arrow left")
    internal static let arrowRight = ImageAsset(name: "Arrow right")
    internal static let arrowUp = ImageAsset(name: "Arrow up")
    internal static let callFilled = ImageAsset(name: "Call filled")
    internal static let cameraFilled = ImageAsset(name: "Camera filled")
    internal static let cartTilted = ImageAsset(name: "Cart tilted")
    internal static let cart = ImageAsset(name: "Cart")
    internal static let change = ImageAsset(name: "Change")
    internal static let checkFilled = ImageAsset(name: "Check filled")
    internal static let check = ImageAsset(name: "Check")
    internal static let clockFilled = ImageAsset(name: "Clock filled")
    internal static let clock = ImageAsset(name: "Clock")
    internal static let closeFilled = ImageAsset(name: "Close filled")
    internal static let close = ImageAsset(name: "Close")
    internal static let creditCard = ImageAsset(name: "Credit Card")
    internal static let darkMode = ImageAsset(name: "Dark mode")
    internal static let delete = ImageAsset(name: "Delete")
    internal static let delivery = ImageAsset(name: "Delivery")
    internal static let document = ImageAsset(name: "Document")
    internal static let dropdownArrowDown = ImageAsset(name: "Dropdown arrow down")
    internal static let dropdownArrowUp = ImageAsset(name: "Dropdown arrow up")
    internal static let emailFilled = ImageAsset(name: "Email filled")
    internal static let email = ImageAsset(name: "Email")
    internal static let exploreTilted = ImageAsset(name: "Explore  tilted")
    internal static let explore = ImageAsset(name: "Explore")
    internal static let facebook = ImageAsset(name: "Facebook")
    internal static let filter = ImageAsset(name: "Filter")
    internal static let fireFilled = ImageAsset(name: "Fire filled")
    internal static let google = ImageAsset(name: "Google")
    internal static let history = ImageAsset(name: "History")
    internal static let homeTilted = ImageAsset(name: "Home tilted")
    internal static let home = ImageAsset(name: "Home")
    internal static let importance = ImageAsset(name: "Importance")
    internal static let information = ImageAsset(name: "Information")
    internal static let language = ImageAsset(name: "Language")
    internal static let lightMode = ImageAsset(name: "Light mode")
    internal static let likeFilled = ImageAsset(name: "Like filled")
    internal static let likeTilted = ImageAsset(name: "Like tilted")
    internal static let like = ImageAsset(name: "Like")
    internal static let locationFilled = ImageAsset(name: "Location filled")
    internal static let location = ImageAsset(name: "Location")
    internal static let logOut = ImageAsset(name: "Log out")
    internal static let messageFilled = ImageAsset(name: "Message filled")
    internal static let message = ImageAsset(name: "Message")
    internal static let more = ImageAsset(name: "More")
    internal static let notVisible = ImageAsset(name: "Not visible")
    internal static let notification = ImageAsset(name: "Notification")
    internal static let notificationAngle = ImageAsset(name: "NotificationAngle")
    internal static let offer = ImageAsset(name: "Offer")
    internal static let orders = ImageAsset(name: "Orders")
    internal static let privacy = ImageAsset(name: "Privacy")
    internal static let profile = ImageAsset(name: "Profile")
    internal static let remove = ImageAsset(name: "Remove")
    internal static let search = ImageAsset(name: "Search")
    internal static let send = ImageAsset(name: "Send")
    internal static let settings = ImageAsset(name: "Settings")
    internal static let share = ImageAsset(name: "Share")
    internal static let starFilled = ImageAsset(name: "Star filled")
    internal static let star = ImageAsset(name: "Star")
    internal static let subscription = ImageAsset(name: "Subscription")
    internal static let trending = ImageAsset(name: "Trending")
    internal static let visible = ImageAsset(name: "Visible")
    internal static let birthdayGirlDarkMode = ImageAsset(name: "Birthday girl - dark mode")
    internal static let birthdayGirlLightMode = ImageAsset(name: "Birthday girl - light mode")
    internal static let burgerDarkMode = ImageAsset(name: "Burger - dark mode")
    internal static let burgerLightMode = ImageAsset(name: "Burger - light mode")
    internal static let chefCookingDarkMode = ImageAsset(name: "Chef cooking - dark mode")
    internal static let chefCookingLightMode = ImageAsset(name: "Chef cooking - light mode")
    internal static let deliveryGuyDarkMode = ImageAsset(name: "Delivery guy - dark mode")
    internal static let deliveryGuyLightMode = ImageAsset(name: "Delivery guy - light mode")
    internal static let emptyStateDarkMode = ImageAsset(name: "Empty state - dark mode")
    internal static let emptyStateLightMode = ImageAsset(name: "Empty state - light mode")
  }
  internal enum Colors {
    internal static let black = ColorAsset(name: "Black")
    internal static let white = ColorAsset(name: "White")
    internal static let dark = ColorAsset(name: "Dark")
    internal static let light = ColorAsset(name: "Light")
    internal static let grey0 = ColorAsset(name: "Grey0")
    internal static let grey100 = ColorAsset(name: "Grey100")
    internal static let grey200 = ColorAsset(name: "Grey200")
    internal static let grey300 = ColorAsset(name: "Grey300")
    internal static let grey400 = ColorAsset(name: "Grey400")
    internal static let grey50 = ColorAsset(name: "Grey50")
    internal static let grey500 = ColorAsset(name: "Grey500")
    internal static let blue = ColorAsset(name: "Blue")
    internal static let green = ColorAsset(name: "Green")
    internal static let orange = ColorAsset(name: "Orange")
    internal static let red = ColorAsset(name: "Red")
    internal static let yellow = ColorAsset(name: "Yellow")
    internal static let primary100 = ColorAsset(name: "Primary100")
    internal static let primary200 = ColorAsset(name: "Primary200")
    internal static let primary300 = ColorAsset(name: "Primary300")
    internal static let primary400 = ColorAsset(name: "Primary400")
    internal static let primary500 = ColorAsset(name: "Primary500")
    internal static let primary600 = ColorAsset(name: "Primary600")
    internal static let primary700 = ColorAsset(name: "Primary700")
    internal static let grey092 = ColorAsset(name: "Grey0-92%")
    internal static let grey5006 = ColorAsset(name: "Grey500-6%")
    internal static let primary60024 = ColorAsset(name: "Primary600-24%")
    internal static let backgroundblur = ColorAsset(name: "backgroundblur")
    internal static let typography100 = ColorAsset(name: "Typography100")
    internal static let typography200 = ColorAsset(name: "Typography200")
    internal static let typography300 = ColorAsset(name: "Typography300")
    internal static let typography400 = ColorAsset(name: "Typography400")
    internal static let typography500 = ColorAsset(name: "Typography500")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
