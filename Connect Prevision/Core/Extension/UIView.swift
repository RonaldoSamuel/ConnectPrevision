//
//  UIView.swift
//  Connect Prevision
//
//  Created by Ronaldo Filho on 26/02/21.
//

import UIKit

extension UIView {
    
    
    func setupThemeNight(){
        
        let rainGif: UIImageView = {
        let gif = UIImageView()
            gif.image = UIImage(named: "night-icon")
            gif.translatesAutoresizingMaskIntoConstraints = false
            return gif
        }()
        
        addSubview(rainGif)
        NSLayoutConstraint.activate([
            rainGif.topAnchor.constraint(equalTo: topAnchor),
            rainGif.leadingAnchor.constraint(equalTo: leadingAnchor),
            rainGif.trailingAnchor.constraint(equalTo: trailingAnchor),
            rainGif.bottomAnchor.constraint(equalTo: centerYAnchor,constant: size.height*0.15)
        ])
        sendSubviewToBack(rainGif)
    }
    
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
    
    @discardableResult
    func addBorders(edges: UIRectEdge,
                    color: UIColor,
                    inset: CGFloat = 0.0,
                    thickness: CGFloat = 0.4) -> [UIView] {

        var borders = [UIView]()

        @discardableResult
        func addBorder(formats: String...) -> UIView {
            let border = UIView(frame: .zero)
            border.backgroundColor = color
            border.translatesAutoresizingMaskIntoConstraints = false
            addSubview(border)
            addConstraints(formats.flatMap {
                NSLayoutConstraint.constraints(withVisualFormat: $0,
                                               options: [],
                                               metrics: ["inset": inset, "thickness": thickness],
                                               views: ["border": border]) })
            borders.append(border)
            return border
        }


        if edges.contains(.top) || edges.contains(.all) {
            addBorder(formats: "V:|-0-[border(==thickness)]", "H:|-inset-[border]-inset-|")
        }

        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(formats: "V:[border(==thickness)]-0-|", "H:|-inset-[border]-inset-|")
        }

        if edges.contains(.left) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:|-0-[border(==thickness)]")
        }

        if edges.contains(.right) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:[border(==thickness)]-0-|")
        }

        return borders
    }
    
}

