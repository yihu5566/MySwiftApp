//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 5 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `home_phone`.
    var home_phone: RswiftResources.ImageResource { .init(name: "home_phone", path: [], bundle: bundle, locale: LocaleReference.none, onDemandResourceTags: nil) }

    /// Image `main_tab`.
    var main_tab: RswiftResources.ImageResource { .init(name: "main_tab", path: [], bundle: bundle, locale: LocaleReference.none, onDemandResourceTags: nil) }

    /// Image `password`.
    var password: RswiftResources.ImageResource { .init(name: "password", path: [], bundle: bundle, locale: LocaleReference.none, onDemandResourceTags: nil) }

    /// Image `phone`.
    var phone: RswiftResources.ImageResource { .init(name: "phone", path: [], bundle: bundle, locale: LocaleReference.none, onDemandResourceTags: nil) }

    /// Image `test.jpeg`.
    var testJpeg: RswiftResources.ImageResource { .init(name: "test.jpeg", path: [], bundle: bundle, locale: LocaleReference.none, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
            var uiSceneStoryboardFile: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneStoryboardFile") ?? "Main" }
          }
        }
      }
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 5 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `home_phone.png`.
    var home_phonePng: RswiftResources.FileResource { .init(name: "home_phone", pathExtension: "png", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `main_tab.png`.
    var main_tabPng: RswiftResources.FileResource { .init(name: "main_tab", pathExtension: "png", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `password.png`.
    var passwordPng: RswiftResources.FileResource { .init(name: "password", pathExtension: "png", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `phone.png`.
    var phonePng: RswiftResources.FileResource { .init(name: "phone", pathExtension: "png", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `test.jpeg`.
    var testJpeg: RswiftResources.FileResource { .init(name: "test", pathExtension: "jpeg", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }
    var main: main { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func main(bundle: Foundation.Bundle) -> main {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
      try self.main.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }

    /// Storyboard `Main`.
    struct main: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UITabBarController

      let bundle: Foundation.Bundle

      let name = "Main"
      func validate() throws {

      }
    }
  }
}