<p align="center">
   <img width="200" src="https://moslienko.github.io/Assets/StatusBarBadgeMaster/sdk.png" alt="StatusBarBadgeMaster Logo">
</p>

<p align="center">
   <a href="https://developer.apple.com/swift/">
      <img src="https://img.shields.io/badge/Swift-5.2-orange.svg?style=flat" alt="Swift 5.2">
   </a>
   <a href="https://github.com/apple/swift-package-manager">
      <img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" alt="SPM">
   </a>
</p>

# StatusBarBadgeMaster

<p align="center">
Library to show badge with application name for iOS apps
</p>

<p align="center">
   <img src="https://moslienko.github.io/Assets/StatusBarBadgeMaster/screenshot.png" alt="Screenshot">
</p>

## Table of Contents

* [Installation](#installation)
* [Example](#example)
* [Usage](#usage)
	* [Basic](#basic)
	* [Config](#config)
* [License](#license)

## Installation

### Swift Package Manager

To integrate using Apple's [Swift Package Manager](https://swift.org/package-manager/), add the following as a dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/moslienko/StatusBarBadgeMaster.git", from: "1.0.0")
]
```

Alternatively navigate to your Xcode project, select `Swift Packages` and click the `+` icon to search for `StatusBarBadgeMaster`.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate StatusBarBadgeMaster into your project manually. Simply drag the `Sources` Folder into your Xcode project.

## Example

The example application is the best way to see `StatusBarBadgeMaster` in action. Simply open the `StatusBarBadgeMasterExample.xcodeproj` and run the `StatusBarBadgeMasterExample` scheme.

## Usage

### Basic

Setting up and displaying the badge. For fine tuning it is necessary add the parameter `config`:

```swift
let config = StatusBarBadgeConfig()

StatusBarBadgeView(
  icon: UIImage(named: "app_logo"),
  title: "App Title",
  config: config
).embedInWindow()
```

### Config

 ```swift
struct StatusBarBadgeConfig {
  var containerConfig: StatusBarBadgeContainerConfig
  var iconConfig: StatusBarBadgeIconConfig
  var titleConfig: StatusBarBadgeTitleConfig
}
```

#### Configuration container

 ```swift
struct StatusBarBadgeContainerConfig {
  /// The height of the badge container.
  var height: CGFloat
  /// The corner radius of the badge container.
  var cornerRadius: CGFloat
  /// The background color of the badge container.
  var backgroundColor: UIColor
  /// The left inset for the content inside the badge container.
  var contentLeftInset: CGFloat
  /// The right inset for the content inside the badge container.
  var contentRightInset: CGFloat
  /// The spacing between the icon and the title within the badge container.
  var iconTitleSpacing: CGFloat
}
```

#### Configuration icon

 ```swift
struct StatusBarBadgeIconConfig {
  /// The width of the badge icon.
  var width: CGFloat
  /// The height of the badge icon.
  var height: CGFloat
  /// The tint color of the badge icon.
  var tintColor: UIColor
}

```

#### Configuration title

 ```swift
struct StatusBarBadgeTitleConfig {
  /// The font used for the badge title.
  var font: UIFont
  /// The color of the badge title text.
  var color: UIColor
}
```

## License

```
StatusBarBadgeMaster
Copyright (c) 2024 Pavel Moslienko 8676976+moslienko@users.noreply.github.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
