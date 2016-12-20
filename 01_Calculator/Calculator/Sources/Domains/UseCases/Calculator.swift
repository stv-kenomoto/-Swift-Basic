//
//  NSNumber:.swift
//  Calculator
//
//  Created by kokoki on 2016/04/04.
//  Copyright © 2016年 enomt. All rights reserved.
//

import UIKit

protocol Calculating {
    var maxDigits: Int { get }
    func result() -> String
    mutating func joinWithNumber(number: Int)
    mutating func joinDecimal()
    mutating func addition(calculating: Calculating)
    mutating func subtraction(calculating: Calculating)
    mutating func multiplication(calculating: Calculating)
    mutating func division(calculating: Calculating)
    mutating func reduce()
    mutating func reserve()
    mutating func clear()
}

struct Calculator: Calculating {
    
    // MARK: - Properties
    
    let maxDigits: Int = 10
    
    private(set) var numbers: [String] = ["+"]
    private(set) var decimalFlag = false
    
    // MARK: - Public Method
    
    func result() -> String {
        var result = ""
        
        if (self.numbers.count == 1) {
            return "0"
        }
        
        for num in 0..<self.numbers.count {
            if self.numbers[num] == "+" {
                continue
            }
            
            result += self.numbers[num]
        }
        
        return result
    }
    
    mutating func joinWithNumber(number: Int) {
        if self.numbers.count == self.maxDigits {
            return
        }
        
        if self.numbers.count == 1 && number == 0 {
            return
        }
        
        if 0 <= number && number <= 9 {
            self.numbers.append(number.description)
        }
    }
    
   mutating func joinDecimal() {
        if !self.decimalFlag {
            self.numbers.append(".")
            self.decimalFlag = true
        }
    }
    
    mutating func addition(calculating: Calculating) {
        let result = atof(calculating.result()) + atof(self.result())
        let resultStr = result.description
        
        self.updateWithString(resultStr)
    }
    
    mutating func subtraction(calculating: Calculating) {
        let result = atof(calculating.result()) - atof(self.result())
        let resultStr = result.description
        
        self.updateWithString(resultStr)
    }
    
    mutating func multiplication(calculating: Calculating) {
        let result = atof(calculating.result()) * atof(self.result())
        let resultStr = result.description
        
        self.updateWithString(resultStr)
    }
    
    mutating func division(calculating: Calculating) {
        let result = atof(calculating.result()) / atof(self.result())
        let resultStr = result.description
        
        self.updateWithString(resultStr)
    }
    
    mutating func reduce() {
        let result = atof(self.result()) / 10
        let resultStr = result.description
        
        self.updateWithString(resultStr)
    }
    
    mutating func reserve() {
        self.numbers[0] = self.numbers[0] == "+" ? "-" : "+"
    }
    
    private mutating func updateWithString(string: String) {
        let double = atof(string)
        let int = Int(double)
        
        var updateStr: String
        if double - Double(int) == 0 {
            let range = string.startIndex.advancedBy(0)..<string.startIndex.advancedBy(string.characters.count - 2)
            updateStr = string.substringWithRange(range)
        } else {
            updateStr = string
        }
        
        self.numbers = []
        
        if 0 <= atof(updateStr) {
            self.numbers.append("+")
        }
        
        let count = updateStr.characters.count < self.maxDigits ? updateStr.characters.count : self.maxDigits
        for num in 0..<count {
            self.numbers.append(String(updateStr[updateStr.startIndex.advancedBy(num)]))
        }
    }
    
    mutating func clear() {
        self.numbers = ["+"]
    }
}
