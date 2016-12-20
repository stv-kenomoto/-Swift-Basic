//
//  UITableView+Dequeue.swift
//  LinkCollectionOfProgrammingLanguages
//
//  Created by kokoki on 2016/05/01.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: - InstanceMethod
    
    func register<T: UITableViewCell where T: Reusing>(_: T.Type) {
        registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell where T: Reusing, T: NibLoading>(_: T.Type) {
        let bundle = NSBundle(forClass: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        registerNib(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell where T: Reusing>(forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
