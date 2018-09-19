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
    public func scaledContent(from srcScreen: Screen = .iPhone6) {
        scaledContent(by: srcScreen.scaledWidth())
    }
}

extension UIView {
    // Implemnted by It's subclasses
    @objc open func scaledContent(by ratio: CGFloat) {
        DefaultLogger.logger.log(#function)
    }
}

extension UILabel {
    open override func scaledContent(by ratio: CGFloat) {
        if let scaledAttributedText = attributedText?.scaledContent(by: ratio){
            attributedText = scaledAttributedText
        }else{
            font = font.scaledFont(by: ratio)
        }
    }
}

extension UIButton {
    open override func scaledContent(by ratio: CGFloat) {
        self.titleLabel?.scaledContent(by: ratio)

        UIControlState.all.forEach {
            // For attributed title buttons ...
            if let attributedString = self.attributedTitle(for: $0 ) {
                self.setAttributedTitle(attributedString.scaledContent(by: ratio), for: $0)
            }
            
            if let image = self.image(for: $0 ) {
                self.setImage(image.resize(toWidth: image.size.width * ratio ), for: $0)
            }
        }
    }
}
    
extension UITextField {
    open override func scaledContent(by ratio: CGFloat) {
        if let scaledAttributedText = attributedText?.scaledContent(by: ratio){
            attributedText = scaledAttributedText
        }else{
            font = font?.scaledFont(by: ratio)
        }
    }
}

extension UITextView {
    open override func scaledContent(by ratio: CGFloat) {
        if let scaledAttributedText = attributedText?.scaledContent(by: ratio){
            attributedText = scaledAttributedText
        }else{
            font = font?.scaledFont(by: ratio)
        }
    }
}

extension UIControlState {
    public static var all: [UIControlState] = [ .normal, highlighted, disabled, selected, application, reserved ]
    //    @available(iOS 9.0, *)
    //    public static var focused: UIControlState { get } // Applicable
}

extension UIFont {
    public func scaledFont(by ratio: CGFloat) -> UIFont {
        return UIFont(name: fontName, size: pointSize * ratio)!
    }
}

extension NSAttributedString {
    
    open func scaledContent(from srcScreen: Screen = .iPhone6) -> NSAttributedString {
        return scaledContent(by: srcScreen.scaledWidth())
    }
    
    open func scaledContent(by ratio: CGFloat) -> NSAttributedString {
        let mutable = mutableCopy() as! NSMutableAttributedString
        mutable.scaledMutableContent(by: ratio)
        return mutable
    }
    
}
    
#if swift(>=4.2)
        let AttributedFontName   = NSAttributedString.Key.font
        let AttributedAttachment = AttributeName.attachment
    #elseif swift(>=4.0)
        let AttributedFontName   = NSAttributedStringKey.font
        let AttributedAttachment = AttributeName.attachment
    #else
        let AttributedFont       = NSFontAttributeName
        let AttributedAttachment = NSAttachmentAttributeName
#endif
    

extension NSMutableAttributedString {
    
    open func scaledMutableContent(from srcScreen: Screen = .iPhone6) {
        return scaledMutableContent(by: srcScreen.scaledWidth())
    }
    
    open func scaledMutableContent(by ratio: CGFloat) {
        beginEditing()
        enumerateAttributes(in: NSRange(location: 0, length: length), options: []) { (attributes, range, _) in
            let styleAttributes = attributes
            if let font = styleAttributes[AttributedFont] as? UIFont {
                self.removeAttribute(AttributedFont, range: range)
                self.addAttribute(AttributedFont, value: font.scaledFont(by: ratio), range: range)
            }
            
            if let textAttachment = styleAttributes[AttributedAttachment] as? NSTextAttachment {
                guard let attachedImage : UIImage  = textAttachment.image else { return }
                let scaledImage = attachedImage.resize(toWidth: CGFloat(attachedImage.size.width*ratio))
                textAttachment.image = scaledImage
            }
        }
        endEditing()
    }
    
}

extension UIImage {
    
    /// Resizes an image based on a given width.
    open func resize(toWidth w: CGFloat) -> UIImage? {
        return internalResize(toWidth: w)
    }
    
    /// Resizes an image based on a given height.
    open func resize(toHeight h: CGFloat) -> UIImage? {
        return internalResize(toHeight: h)
    }
    
    private func internalResize(toWidth tw: CGFloat = 0, toHeight th: CGFloat = 0) -> UIImage? {
        var w: CGFloat?, h: CGFloat?
        if 0 < tw {
            h = size.height * tw / size.width
        } else if 0 < th {
            w = size.width * th / size.height
        }        
        let drawRect: CGRect = CGRect(x: 0, y: 0, width: w ?? tw, height: h ?? th)
        UIGraphicsBeginImageContextWithOptions(drawRect.size, false, UIScreen.main.scale)
        draw(in: drawRect, blendMode: .normal, alpha: 1)
        let image:UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
    
}
    
#endif

