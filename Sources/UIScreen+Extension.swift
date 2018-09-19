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
    case iPhone6, iPhone6Plus
    case iPhone7, iPhone7Plus
    case iPhone8, iPhone8Plus
    case iPhoneX
    case iPhoneScreen(CGSize)
}

extension Screen
{
    public var size: CGSize {
        switch self {
        case .iPhone4: return UIScreen.iPhone4Size
        case .iPhone5, .iPhoneSE: return UIScreen.iPhone5Size
        case .iPhone6, .iPhone7, .iPhone8: return UIScreen.iPhone6Size
        case .iPhone6Plus, .iPhone7Plus, .iPhone8Plus: return UIScreen.iPhone6PlusSize
        case .iPhoneX : return UIScreen.iPhoneXSize
        case let .iPhoneScreen(size): return size
        }
    }
    
    public func scaledWidth( value:CGFloat = 1.0, destScreen:Screen = .iPhoneScreen(UIScreen.size))->CGFloat {
        let widthFraction = destScreen.size.width / size.width
        DefaultLogger.logger.log("WF: " + widthFraction.description + " WS: " + (value*widthFraction).description )
        return value*widthFraction
    }
    
    public func scaledHeight( value:CGFloat = 1.0, destScreen:Screen = .iPhoneScreen(UIScreen.size))->CGFloat {
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
    
}

#endif

