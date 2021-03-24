//
//  UIView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import UIKit

extension UIView {
    
    var size: CGSize {
        get {
            return UIScreen.main.bounds.size
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

    
    func setGradientBackground(horizontal: Bool,colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        if horizontal == true {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = UIScreen.main.bounds
        layer.insertSublayer(gradientLayer, at:0)
    }
    
}

