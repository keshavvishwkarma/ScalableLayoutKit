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
        if srcScreen.scaledWidth() == 1.0 && srcScreen.scaledHeight() == 1.0 {
            return
        }

        traceConstraint(basedOn: srcScreen)
        
        let ratio = min( srcScreen.scaledWidth(), srcScreen.scaledHeight())
        if ratio != 1.0 {
           scaledContent(by: ratio)
        }
        
        // Note: This is to prevent content scaling of UIButton's subviews again.
        if self is UIButton {
            return
        }
        
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
                cons.constant = srcScreen.scaledHeight(cons.constant)
            }
            else if cons.firstAttribute == .bottom || cons.secondAttribute == .bottom
            {
                DefaultLogger.logger.log("V - Bottom");
                cons.constant = srcScreen.scaledHeight(cons.constant)
            }
            else if cons.firstAttribute == .top || cons.secondAttribute == .top
            {
                DefaultLogger.logger.log("V - Top");
                cons.constant = srcScreen.scaledHeight(cons.constant)
            }
            else if cons.firstAttribute == .centerY || cons.secondAttribute == .centerY
            {
                DefaultLogger.logger.log("V - centerY");
                cons.constant = srcScreen.scaledHeight(cons.constant)
            }
            else if cons.firstAttribute == .bottom && cons.secondAttribute == .top || cons.firstAttribute == .bottom && cons.secondAttribute == .top
            {
                DefaultLogger.logger.log("V - Bottom - Top");
                cons.constant = srcScreen.scaledHeight(cons.constant)
            }
            else if cons.firstAttribute == .width && cons.secondAttribute == .notAnAttribute
            {
                DefaultLogger.logger.log("H - Width");
                cons.constant = srcScreen.scaledWidth(cons.constant)
            }
            else if cons.firstAttribute == .leading || cons.secondAttribute == .leading
            {
                DefaultLogger.logger.log("H - Leading");
                cons.constant = srcScreen.scaledWidth(cons.constant)
            }
            else if cons.firstAttribute == .trailing || cons.secondAttribute == .trailing
            {
                DefaultLogger.logger.log("H - Trailing");
                cons.constant = srcScreen.scaledWidth(cons.constant)
            }
            else if cons.firstAttribute == .centerX || cons.secondAttribute == .centerX
            {
                DefaultLogger.logger.log("H - centerX");
                cons.constant = srcScreen.scaledWidth(cons.constant)
            }
            else if cons.firstAttribute == .leading && cons.secondAttribute == .trailing || cons.firstAttribute == .trailing && cons.secondAttribute == .leading
            {
                DefaultLogger.logger.log("H - Leading - Trailing");
                cons.constant = srcScreen.scaledWidth(cons.constant)
            }
            else{
                DefaultLogger.logger.log(cons);
            }
        }
    }
}

#endif
