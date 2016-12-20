//
//  CalculatorButton.swift
//  Calculator
//
//  Created by kokoki on 2016/03/15.
//  Copyright © 2016 enomt. All rights reserved.
//

import UIKit

@IBDesignable
class DarkHighlightedButton: UIButton {
    
    // MARK: - Properties
    
    @IBInspectable var color: UIColor? {
        didSet {
            backgroundColor = color
            
            var hue: CGFloat = 0
            var saturation: CGFloat = 0
            var brightness: CGFloat = 0
            var alpha: CGFloat = 0
            if color!.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
                darkColor = UIColor(hue: hue, saturation: saturation, brightness: brightness * 0.9, alpha: alpha)
            }
        }
    }
    
    private(set) var darkColor: UIColor?
    
    override var highlighted: Bool {
        didSet {
            if highlighted {
                backgroundColor = darkColor
            } else {
                backgroundColor = color
            }
        }
    }
}
