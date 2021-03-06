//
//  UIScreen+Extension.swift
//  ScalableLayoutDesign
//
//  Created by Keshav on 7/21/17.
//  Copyright © 2017 Keshav. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit

public enum Screen {
    case iPhone4
    case iPhone5, iPhoneSE
    case iPhone6, iPhone6Plus, iPhone6s, iPhone6sPlush
    case iPhone7, iPhone7Plus
    case iPhone8, iPhone8Plus
    case iPhoneX
    case iPhoneXS, iPhoneXR, iPhoneXSMax
    case iPhone11, iPhone11Pro, iPhone11ProMax
    case newScreen(CGSize)
}

extension Screen
{
    public var size: CGSize {
        switch self {
        case .iPhone4: return UIScreen.iPhone4Size
        case .iPhone5, .iPhoneSE: return UIScreen.iPhone5Size
        case .iPhone6, .iPhone6s, .iPhone7, .iPhone8: return UIScreen.iPhone6Size
        case .iPhone6Plus, .iPhone6sPlush, .iPhone7Plus, .iPhone8Plus: return UIScreen.iPhone6PlusSize
        case .iPhoneX, .iPhoneXS, .iPhone11Pro : return UIScreen.iPhoneXSize
        case .iPhoneXR, .iPhoneXSMax, .iPhone11, .iPhone11ProMax : return UIScreen.iPhoneXRSize
        case let .newScreen(size): return size
        }
    }
    
    public func scaledWidth(_ value:CGFloat = 1.0, destScreen:Screen = .newScreen(UIScreen.size))->CGFloat {
        let widthFraction = destScreen.size.width / size.width
        DefaultLogger.logger.log("WF: " + widthFraction.description + " WS: " + (value*widthFraction).description )
        return value*widthFraction
    }
    
    public func scaledHeight(_ value:CGFloat = 1.0, destScreen:Screen = .newScreen(UIScreen.size))->CGFloat {
        let heightFraction = destScreen.size.height / size.height
        DefaultLogger.logger.log("HF: " + heightFraction.description + " HS: " + (value*heightFraction).description )
        return value*heightFraction
    }
    
}

extension UIScreen {
    
    /// Retrieves the device width.
    public var width: CGFloat { return min(bounds.width, bounds.height) }
    /// Retrieves the device height.
    public var height: CGFloat { return max(bounds.width, bounds.height) }
    /// Retrieves the device screen size.
    public static var size: CGSize { return CGSize(width: UIScreen.main.width, height:UIScreen.main.height) }
    
    static var iPhone4Size: CGSize { return CGSize(width: 320, height: 480.0) }
    static var iPhone5Size: CGSize { return CGSize(width: 320, height: 568.0) }
    static var iPhone6Size: CGSize { return CGSize(width: 375, height: 667.0) }
    static var iPhone6PlusSize: CGSize { return CGSize(width:414.0, height: 736.0) }
    static var iPhoneXSize: CGSize { return CGSize(width:375.0, height: 812.0) }
    static var iPhoneXRSize: CGSize { return CGSize(width:414.0, height:896.0) }

}

#endif

