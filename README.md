# ScalableLayoutKit

[![CI Status](https://img.shields.io/travis/keshavvishwkarma/ScalableLayoutKit.svg?style=flat)](https://travis-ci.org/keshavvishwkarma/ScalableLayoutKit)
[![Version](https://img.shields.io/cocoapods/v/ScalableLayoutKit.svg?style=flat)](https://cocoapods.org/pods/ScalableLayoutKit)
[![License](https://img.shields.io/cocoapods/l/ScalableLayoutKit.svg?style=flat)](https://cocoapods.org/pods/ScalableLayoutKit)
[![Platform](https://img.shields.io/cocoapods/p/ScalableLayoutKit.svg?style=flat)](https://cocoapods.org/pods/ScalableLayoutKit)

`ScalableLayoutKit` is a lightweight SDK that lets you design scalable, consistent user interface (UI) across any screen size of Apple devices.

`ScalableLayoutKit` reduces the lots of the time and efforts of a developer to make consistent UI design of all possible device screen sizes such as `iPhone XS Max`, `iPhone XS`, `iPhone XR`, `iPhone X`, `iPhone 8 Plus`, `iPhone 8`, `iPhone 7 Plus`, `iPhone 7` ,`iPhone 6s Plus` ,`iPhone 6s` & `iPhone SE`.

## Usage
Just use only one method of ScalableLayoutKit:
```swift
  public func scaledLayoutDesign(from srcScreen: Screen = .iPhone6)
```

##### Using ScalableLayoutKit

```swift
import ScalableLayoutKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Here we just need to passed based or source design screen name only.
        self.view.scaledLayoutDesign(from: .iPhoneX)        
    }

}
```

If you use `ScalableLayoutKit` in your app, I'd love to hear about it from you. You can reach me through [Twitter] or [Email].

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ScalableLayoutKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ScalableLayoutKit'
```

## Author

If you wish to contact me, email at: [keshavvbe@gmail.com](mailto:keshavvbe@gmail.com)

[![GitHub Follow](https://img.shields.io/github/followers/keshavvishwkarma.svg?style=social&label=Follow)](https://github.com/keshavvishwkarma/)

## License

ScalableLayoutKit is available under the MIT license. [See the LICENSE](./LICENSE) file for more info.

[Twitter]:       https://twitter.com/keshav_Vishwkar
[Email]:         mailto:keshavvbe@gmail.com
