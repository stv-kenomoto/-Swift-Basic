//
//  Reusing.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

protocol Reusing: class {
    static var reuseIdentifier: String { get }
}

extension Reusing where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
