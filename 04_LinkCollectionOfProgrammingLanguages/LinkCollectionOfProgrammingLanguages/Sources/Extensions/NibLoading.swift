//
//  NibLoading.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

protocol NibLoading: class {
    static var nibName: String { get }
}

extension NibLoading where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
}