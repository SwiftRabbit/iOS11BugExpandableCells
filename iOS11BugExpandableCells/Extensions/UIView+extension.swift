//
//  UIView+extension.swift
//  ClientCenterApp
//
//  Created by Leopold Roitel on 2017-03-03.
//  Copyright © 2017 Leopold Roitel. All rights reserved.
//

import UIKit

extension UIView {

    public func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    public func applyShadow(withColor color: UIColor = .gray, opacity: Float = 0.6, radius: CGFloat = 1, offset: CGSize = CGSize(width: 0, height: 2)) {
        
        // False to let bleed the shadow out of the view bounds
        self.clipsToBounds = false
        
        // Apply shadow
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
    }
    
    public func applyRoundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    public func registerForTapGesture(atTarget target: Any, withAction action: Selector) {
        self.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGestureRecognizer)
    }
}
