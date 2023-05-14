//
//  m.swift
//  Smart Recipes
//
//  Created by Ruxandra Ciortea on 14.05.2023.
//

import UIKit

@IBDesignable extension UIButton {

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var shadowOffset: CGSize {
        set {
            layer.shadowOffset = newValue
            layer.shadowOpacity = 0.5
        }
        get {
            return layer.shadowOffset
        }
    }
    
}
