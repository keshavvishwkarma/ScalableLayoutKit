//
//  UIUIView+Extension.swift
//  ScalableLayoutDesign
//
//  Created by Keshav on 7/21/17.
//  Copyright © 2017 Keshav. All rights reserved.
//

#if os(iOS) || os(tvOS)
    
import UIKit

extension UIView {
    
    public func scaledLayoutDesign(from srcScreen: Screen = .iPhone6) {
        let ratio : CGFloat = srcScreen.scaledWidth()
        if ratio == 1.0 {
            return
        }

        traceConstraint(basedOn: srcScreen)
        scaledContent(by: ratio)
        
        for v in subviews {
            v.scaledLayoutDesign(from: srcScreen)
        }
    }
    
}

extension UIView {
    
    internal final func traceConstraint(basedOn srcScreen: Screen)
    {
        for cons in constraints
        {
            if cons.firstAttribute == .height && cons.secondAttribute == .notAnAttribute
            {
                DefaultLogger.logger.log("V - Height");
                cons.constant = srcScreen.scaledHeight( value: cons.constant)
            }
            else if cons.firstAttribute == .bottom || cons.secondAttribute == .bottom
            {
                DefaultLogger.logger.log("V - Bottom");
                cons.constant = srcScreen.scaledHeight( value: cons.constant)
            }
            else if cons.firstAttribute == .top || cons.secondAttribute == .top
            {
                DefaultLogger.logger.log("V - Top");
                cons.constant = srcScreen.scaledHeight( value: cons.constant)
            }
            else if cons.firstAttribute == .bottom && cons.secondAttribute == .top || cons.firstAttribute == .bottom && cons.secondAttribute == .top
            {
                DefaultLogger.logger.log("V - Bottom - Top");
                cons.constant = srcScreen.scaledHeight( value: cons.constant)
            }
            else if cons.firstAttribute == .width && cons.secondAttribute == .notAnAttribute
            {
                DefaultLogger.logger.log("H - Width");
                cons.constant = srcScreen.scaledWidth( value: cons.constant)
            }
            else if cons.firstAttribute == .leading || cons.secondAttribute == .leading
            {
                DefaultLogger.logger.log("H - Leading");
                cons.constant = srcScreen.scaledWidth( value: cons.constant)
            }
            else if cons.firstAttribute == .trailing || cons.secondAttribute == .trailing
            {
                DefaultLogger.logger.log("H - Trailing");
                cons.constant = srcScreen.scaledWidth( value: cons.constant)
            }
            else if cons.firstAttribute == .leading && cons.secondAttribute == .trailing || cons.firstAttribute == .trailing && cons.secondAttribute == .leading
            {
                DefaultLogger.logger.log("H - Leading - Trailing");
                cons.constant = srcScreen.scaledWidth( value: cons.constant)
            }
            else{
                DefaultLogger.logger.log(cons);
            }
        }
    }
}

#endif

