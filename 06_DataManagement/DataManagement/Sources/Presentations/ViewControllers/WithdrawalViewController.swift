//
//  WithdrawalViewController.swift
//  DataManagement
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class WithdrawalViewController: UIViewController {
    
    // MARK: - Views

    @IBOutlet var messageLabel: UILabel!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = NSUserDefaults.standardUserDefaults().objectForKey("Name") {
            self.messageLabel.text = String(format: self.messageLabel.text!, String(name))
        }
        
    }
    
    // MARK: - Action

    @IBAction func doTapButton(sender: AnyObject) {
        let alert = UIAlertController(title: "", message: "退会が完了しました", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
        NSUserDefaults.standardUserDefaults().removeObjectForKey("Name")
    }
}
