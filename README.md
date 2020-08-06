# HUD

This package contains a HUD based on Connapptivity's SwiftUI-Indicators purely written in SwiftUI.


## Getting Started

### Swift Package Manager

Install this package by adding a Package Dependency in Xcode under _Swift Packages> Add Package Dependency_. Choose _SwiftUI-HUD_ from Connapptivity and select the version you want to add and the target and click _Finish_. 

### CocoaPods

Alternatively, you can add `pod 'CAHUD'` to your podfile and run `pod install`.


Now you can use it after adding the `import CAHUD` statement at the top of xour code file.

## Usage

```swift
View()
.hud(HUDType, show: Bool, with: HUDConfiguration)
```


### Customize a HUD

You can customize a hud by passing an instance of HUDConfiguration to the hud modifier in which you declare your custom values. Note that not all values you declare in your HUDConfiguration object are used with ever HUDType. Only the values which can be changed at a specific hud type are used.
