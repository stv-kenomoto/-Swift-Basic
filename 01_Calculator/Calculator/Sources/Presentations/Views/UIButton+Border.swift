//
//  UIButtonaaa.swift
//  Calculator
//
//  Created by kokoki on 3/27/16.
//  Copyright © 2016 enomt. All rights reserved.
//

import UIKit

@IBDesignable
extension UIButton {
    
    // MARK: - Properties
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set  {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
