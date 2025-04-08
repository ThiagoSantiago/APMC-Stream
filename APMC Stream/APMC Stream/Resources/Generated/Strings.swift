// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum EpisodeDetailsView {
    /// Duration:
    internal static let duration = L10n.tr("Localizable", "EpisodeDetailsView.duration", fallback: "Duration:")
    /// Episode Details
    internal static let title = L10n.tr("Localizable", "EpisodeDetailsView.title", fallback: "Episode Details")
  }
  internal enum EpisodeListItemCardView {
    /// Localizable.strings
    ///   APMC Stream
    /// 
    ///   Created by Thiago Santiago on 03/04/25.
    internal static let duration = L10n.tr("Localizable", "EpisodeListItemCardView.duration", fallback: "Duration:")
    internal enum Indicator {
      /// chevron.right
      internal static let imageName = L10n.tr("Localizable", "EpisodeListItemCardView.indicator.imageName", fallback: "chevron.right")
    }
  }
  internal enum EpisodesListView {
    /// Episodes
    internal static let title = L10n.tr("Localizable", "EpisodesListView.title", fallback: "Episodes")
    internal enum Alert {
      /// OK
      internal static let buttonTitle = L10n.tr("Localizable", "EpisodesListView.alert.buttonTitle", fallback: "OK")
      /// Error
      internal static let title = L10n.tr("Localizable", "EpisodesListView.alert.title", fallback: "Error")
    }
    internal enum EmptyList {
      /// No episodes available.
      internal static let message = L10n.tr("Localizable", "EpisodesListView.emptyList.message", fallback: "No episodes available.")
    }
    internal enum Loading {
      /// Loading Episodes...
      internal static let message = L10n.tr("Localizable", "EpisodesListView.loading.message", fallback: "Loading Episodes...")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
