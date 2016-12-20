//
//  UIButton+Likable.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

@IBDesignable
extension UIButton {
    
    // MARK: - Properties
    
    var like: String {
        get {
            return "Like"
        }
    }
    var unlike: String {
        get {
            return "Unlike"
        }
    }
    
    @IBInspectable var likable: Bool {
        get {
            if self.titleLabel?.text == like {
                return true
            }
            
            return false
        }
        
        set {
            if newValue {
                self.setTitle(like, forState: .Normal)
            } else {
                self.setTitle(unlike, forState: .Normal)
            }
        }
    }
}