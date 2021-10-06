//
//  RoundView.swift
//  banter-screen
//
//  Created by Top Dev on 10/6/21.
//

import Foundation
import UIKit

@IBDesignable
class RoundCardView : UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}

@IBDesignable
class RoundImageView : UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
    }
}

@IBDesignable
class RoundBorderView : UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let cornerRadius = self.bounds.width / 2
        layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
    }
}
