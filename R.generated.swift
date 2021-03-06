//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `blue`.
    static let blue = Rswift.ColorResource(bundle: R.hostingBundle, name: "blue")
    /// Color `orange`.
    static let orange = Rswift.ColorResource(bundle: R.hostingBundle, name: "orange")
    /// Color `white`.
    static let white = Rswift.ColorResource(bundle: R.hostingBundle, name: "white")
    /// Color `yellow`.
    static let yellow = Rswift.ColorResource(bundle: R.hostingBundle, name: "yellow")
    
    /// `UIColor(named: "blue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func blue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.blue, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "orange", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func orange(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.orange, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "white", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func white(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.white, compatibleWith: traitCollection)
    }
    
    /// `UIColor(named: "yellow", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func yellow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.yellow, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 0 files.
  struct file {
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 9 images.
  struct image {
    /// Image `FilterIcon`.
    static let filterIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "FilterIcon")
    /// Image `check_icon`.
    static let check_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "check_icon")
    /// Image `error_icon`.
    static let error_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "error_icon")
    /// Image `favorite_empty_icon`.
    static let favorite_empty_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_empty_icon")
    /// Image `favorite_full_icon`.
    static let favorite_full_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_full_icon")
    /// Image `favorite_gray_icon`.
    static let favorite_gray_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "favorite_gray_icon")
    /// Image `list_icon`.
    static let list_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "list_icon")
    /// Image `search_icon`.
    static let search_icon = Rswift.ImageResource(bundle: R.hostingBundle, name: "search_icon")
    /// Image `splash`.
    static let splash = Rswift.ImageResource(bundle: R.hostingBundle, name: "splash")
    
    /// `UIImage(named: "FilterIcon", bundle: ..., traitCollection: ...)`
    static func filterIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.filterIcon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "check_icon", bundle: ..., traitCollection: ...)`
    static func check_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.check_icon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "error_icon", bundle: ..., traitCollection: ...)`
    static func error_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.error_icon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "favorite_empty_icon", bundle: ..., traitCollection: ...)`
    static func favorite_empty_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_empty_icon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "favorite_full_icon", bundle: ..., traitCollection: ...)`
    static func favorite_full_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_full_icon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "favorite_gray_icon", bundle: ..., traitCollection: ...)`
    static func favorite_gray_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.favorite_gray_icon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "list_icon", bundle: ..., traitCollection: ...)`
    static func list_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.list_icon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "search_icon", bundle: ..., traitCollection: ...)`
    static func search_icon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.search_icon, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "splash", bundle: ..., traitCollection: ...)`
    static func splash(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.splash, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    /// This `R.string.launchScreen` struct is generated, and contains static references to 0 localization keys.
    struct launchScreen {
      fileprivate init() {}
    }
    
    /// This `R.string.localizable` struct is generated, and contains static references to 8 localization keys.
    struct localizable {
      /// en translation: An error occurred. Please try again
      /// 
      /// Locales: en, pt-BR
      static let errorLabel = Rswift.StringResource(key: "errorLabel", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Failed to update favorites movies
      /// 
      /// Locales: en, pt-BR
      static let cantUpdateFavorited = Rswift.StringResource(key: "cantUpdateFavorited", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Favorites
      /// 
      /// Locales: en, pt-BR
      static let favoritesTitle = Rswift.StringResource(key: "favoritesTitle", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Movies
      /// 
      /// Locales: en, pt-BR
      static let moviesTitle = Rswift.StringResource(key: "moviesTitle", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Movies
      /// 
      /// Locales: en, pt-BR
      static let navigationTitle = Rswift.StringResource(key: "navigationTitle", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: No results found for "%@"
      /// 
      /// Locales: en, pt-BR
      static let emptyView = Rswift.StringResource(key: "emptyView", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Rating
      /// 
      /// Locales: en, pt-BR
      static let ratingLabel = Rswift.StringResource(key: "ratingLabel", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      /// en translation: Unfavorite
      /// 
      /// Locales: en, pt-BR
      static let unfavoriteButtonTitle = Rswift.StringResource(key: "unfavoriteButtonTitle", tableName: "localizable", bundle: R.hostingBundle, locales: ["en", "pt-BR"], comment: nil)
      
      /// en translation: An error occurred. Please try again
      /// 
      /// Locales: en, pt-BR
      static func errorLabel(_: Void = ()) -> String {
        return NSLocalizedString("errorLabel", tableName: "localizable", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Failed to update favorites movies
      /// 
      /// Locales: en, pt-BR
      static func cantUpdateFavorited(_: Void = ()) -> String {
        return NSLocalizedString("cantUpdateFavorited", tableName: "localizable", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Favorites
      /// 
      /// Locales: en, pt-BR
      static func favoritesTitle(_: Void = ()) -> String {
        return NSLocalizedString("favoritesTitle", tableName: "localizable", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Movies
      /// 
      /// Locales: en, pt-BR
      static func moviesTitle(_: Void = ()) -> String {
        return NSLocalizedString("moviesTitle", tableName: "localizable", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Movies
      /// 
      /// Locales: en, pt-BR
      static func navigationTitle(_: Void = ()) -> String {
        return NSLocalizedString("navigationTitle", tableName: "localizable", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: No results found for "%@"
      /// 
      /// Locales: en, pt-BR
      static func emptyView(_ value1: String) -> String {
        return String(format: NSLocalizedString("emptyView", tableName: "localizable", bundle: R.hostingBundle, comment: ""), locale: R.applicationLocale, value1)
      }
      
      /// en translation: Rating
      /// 
      /// Locales: en, pt-BR
      static func ratingLabel(_: Void = ()) -> String {
        return NSLocalizedString("ratingLabel", tableName: "localizable", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Unfavorite
      /// 
      /// Locales: en, pt-BR
      static func unfavoriteButtonTitle(_: Void = ()) -> String {
        return NSLocalizedString("unfavoriteButtonTitle", tableName: "localizable", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "splash") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'splash' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
