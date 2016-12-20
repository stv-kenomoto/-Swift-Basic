//
//  SplitTheCheckViewController.swift
//  SplitTheCheck
//
//  Created by kokoki on 4/16/16.
//  Copyright © 2016 enomt. All rights reserved.
//

import UIKit

class SplitTheCheckViewController: UIViewController {
    
    // MARK: Properties
    
    var split = SplitTheCheck(roundDownDigits: 3)
    
    // MARK: Views

    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    
    @IBOutlet weak var pricePerPersonLabel: UILabel!
    
    @IBOutlet weak var changeLabel: UILabel!
    
    // MARK: Action

    @IBAction func doTapSplitTheCheck(sender: AnyObject) {
        let price = Int(self.priceTextField.text!)
        let numberOfPeople = Int(self.numberOfPeopleTextField.text!)
        let (splitPrice, change) = self.split.splitWithPrice(price!, numberOfPeople: numberOfPeople!)
        self.pricePerPersonLabel.text = String(format: NSLocalizedString("pricePerPerson", comment: ""), String(splitPrice))
        self.changeLabel.text = String(format: NSLocalizedString("change", comment: ""), String(change))
    }

    @IBAction func doTapClear(sender: AnyObject) {
        self.priceTextField.text = ""
        self.numberOfPeopleTextField.text = ""
        self.pricePerPersonLabel.text = ""
        self.changeLabel.text = ""
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        self.priceTextField.resignFirstResponder()
        self.numberOfPeopleTextField.resignFirstResponder()
    }
}
