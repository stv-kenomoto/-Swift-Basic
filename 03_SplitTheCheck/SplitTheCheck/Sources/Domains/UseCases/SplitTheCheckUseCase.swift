//
//  SplitTheCheckUseCase.swift
//  SplitTheCheck
//
//  Created by kokoki on 4/16/16.
//  Copyright © 2016 enomt. All rights reserved.
//

import UIKit

protocol SplitTheChecking {
    func splitWithPrice(price: Int, numberOfPeople: Int) -> (splitPrice: Int, change: Int)
}

struct SplitTheCheck: SplitTheChecking  {
    
    var roundDownDigits: Int
    
    init(roundDownDigits: Int) {
        self.roundDownDigits = roundDownDigits
    }
    
    func splitWithPrice(price: Int, numberOfPeople: Int) -> (splitPrice: Int, change: Int) {
        let splitPrice = Int(ceil((Double(price) / Double(numberOfPeople)) / pow(10, Double(self.roundDownDigits))) * pow(10, Double(self.roundDownDigits)))
        let change = splitPrice * numberOfPeople - price
        return (splitPrice, change)
    }
}
