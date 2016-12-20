//
//  ViewController.swift
//  DataManagement
//
//  Created by kokoki on 2016/05/05.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Views
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }
    
    // MARK: - Action

    @IBAction func doTapButton(sender: AnyObject) {
        if self.textField.text != nil && !(self.textField.text?.isEmpty)! {
            showAlertWithMessage("登録が完了しました")
            NSUserDefaults.standardUserDefaults().setObject(self.textField.text, forKey: "Name")
        } else {
            showAlertWithMessage("お名前が入力されていません。")
        }
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
    // MARK: - PrivateMethod
    
    func showAlertWithMessage(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

