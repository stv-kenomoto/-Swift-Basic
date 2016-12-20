//
//  CalculatorLabel.swift
//  Calculator
//
//  Created by kokoki on 3/23/16.
//  Copyright © 2016 enomt. All rights reserved.
//

import UIKit

class CalculatorLabel: UILabel {
    
    // MARK: - Properties
    
    var didCopy: ((calculatorLabel: CalculatorLabel) -> ())?
    var didPaste: ((calculatorLabel: CalculatorLabel) -> ())?
    
    // MARK: - Override
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == #selector(NSObject.copy(_:)) && action == #selector(NSObject.paste(_:)) {
            return true
        }
        
        return super.canPerformAction(action, withSender: sender)
    }
    
    override func copy(sender: AnyObject?) {
        UIPasteboard.generalPasteboard().string = self.text
        self.didCopy!(calculatorLabel: self)
    }
    
    override func paste(sender: AnyObject?) {
        self.text = UIPasteboard.generalPasteboard().string
        self.didPaste!(calculatorLabel: self)
    }
    
    override func resignFirstResponder() -> Bool {
        return super.resignFirstResponder()
    }
    
    // MARK: - Public method
    
    func showMenu() {
        self.becomeFirstResponder()
        
        let menuController = UIMenuController.sharedMenuController()
        if menuController.menuVisible {
            menuController.setMenuVisible(false, animated: true)
        } else {
            let rect = self.textRectForBounds(self.bounds, limitedToNumberOfLines: self.numberOfLines)
            menuController.setTargetRect(rect, inView: self)
            menuController.setMenuVisible(true, animated: true)
        }
    }
    
}
