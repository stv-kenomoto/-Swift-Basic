//
//  ViewController.swift
//  Calculator
//
//  Created by kokoki on 2016/03/13.
//  Copyright © 2016 enomt. All rights reserved.
//

import UIKit

enum CalculatorType {
    case None
    case Addition
    case Subtraction
    case Multiplication
    case Division
}

class CalculatorViewController: UIViewController {
    
    // MARK: Constants
    
    private let AllClearTitle = "AC"
    private let ClearTitle = "C"
    
    // MARK: - Views
    
    @IBOutlet weak var calculationView: UIView!
    @IBOutlet weak var calculationLabel: CalculatorLabel!
    @IBOutlet weak var clearButton: DarkHighlightedButton!
    
    // MARK: - Properties
    
    private var copyMode = false {
        didSet {
            if copyMode {
                calculationView.backgroundColor = calculationView.backgroundColor?.colorWithAlphaComponent(0.9)
            } else {
                calculationView.backgroundColor = calculationView.backgroundColor?.colorWithAlphaComponent(1.0)
            }
        }
    }
    
    private var calculatorMode = false {
        didSet {
            if calculatorMode {
                oldCalculator = calculator
                calculator = Calculator()
            } else {
                calculatorType = CalculatorType.None
            }
        }
    }
    
    private var calculatorType: CalculatorType = CalculatorType.None
    private var calculator = Calculator()
    private var oldCalculator = Calculator()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearButton.setTitle(AllClearTitle, forState: UIControlState.Normal)
        self.setupCalculationView()
        self.setupCalculationLabel()
    }
    
    // MARK: - Action
    
    func doLongPressCalculation(gesture: UILongPressGestureRecognizer) {
        if !self.copyMode {
            self.copyMode = true
            self.calculationLabel.showMenu()
        }
    }
    
    func doTapCalculation(gesture: UITapGestureRecognizer) {
        self.copyMode = false
    }
    
    @IBAction func doTap1(sender: AnyObject) {
        self.drawWithNumber(1)
    }
    
    @IBAction func doTap2(sender: AnyObject) {
        self.drawWithNumber(2)
    }
    
    @IBAction func doTap3(sender: AnyObject) {
        self.drawWithNumber(3)
    }
    
    @IBAction func doTap4(sender: AnyObject) {
        self.drawWithNumber(4)
    }
    
    @IBAction func doTap5(sender: AnyObject) {
        self.drawWithNumber(5)
    }
    
    @IBAction func doTap6(sender: AnyObject) {
        self.drawWithNumber(6)
    }
    
    @IBAction func doTap7(sender: AnyObject) {
        self.drawWithNumber(7)
    }
    
    @IBAction func doTap8(sender: AnyObject) {
        self.drawWithNumber(8)
    }
    
    @IBAction func doTap9(sender: AnyObject) {
        self.drawWithNumber(9)
    }
    
    @IBAction func doTap0(sender: AnyObject) {
        self.drawWithNumber(0)
    }
    
    @IBAction func doTapDecimal(sender: AnyObject) {
        self.copyMode = false
        self.calculator.joinDecimal()
        self.calculationLabel.text = String(self.calculator.result())
    }
    
    @IBAction func doTapAddition(sender: AnyObject) {
        self.calculatorType = CalculatorType.Addition
        if (calculatorMode) {
            self.drawResult()
        }
        
        self.calculatorMode = true
    }
    
    @IBAction func doTapSubtraction(sender: AnyObject) {
        self.calculatorType = CalculatorType.Subtraction
        if (calculatorMode) {
            self.drawResult()
        }
        
        self.calculatorMode = true
    }
    
    @IBAction func doTapMultiplication(sender: AnyObject) {
        self.calculatorType = CalculatorType.Multiplication
        if (calculatorMode) {
            self.drawResult()
        }
        
        self.calculatorMode = true
    }
    
    @IBAction func doTapDivision(sender: AnyObject) {
        self.calculatorType = CalculatorType.Division
        if (calculatorMode) {
            self.drawResult()
        }
        
        self.calculatorMode = true
    }
    
    @IBAction func doTapResult(sender: AnyObject) {
        self.drawResult()
    }
    
    @IBAction func doTapReduce(sender: AnyObject) {
        self.copyMode = false
        self.calculator.reduce()
        self.calculationLabel.text = String(self.calculator.result())
    }
    
    @IBAction func doTapReserve(sender: AnyObject) {
        self.copyMode = false
        self.calculator.reserve()
        self.calculationLabel.text = String(self.calculator.result())
    }
    
    @IBAction func doTapClear(sender: AnyObject) {
        self.calculator.clear()
        self.calculatorMode = false
        self.clearButton.setTitle(AllClearTitle, forState: UIControlState.Normal)
        self.calculationLabel.text = String(self.calculator.result())
    }
    
    
    // MARK: - Private method
    
    private func setupCalculationView() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(CalculatorViewController.doLongPressCalculation(_:)))
        longPressGesture.minimumPressDuration = 0.3
        self.calculationView.addGestureRecognizer(longPressGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CalculatorViewController.doTapCalculation(_:)))
        self.calculationView.addGestureRecognizer(tapGesture)
    }
    
    private func setupCalculationLabel() {
        self.calculationLabel.didCopy = {(calculatorLabel: CalculatorLabel) -> () in
            self.copyMode = false
        }
        
        self.calculationLabel.didPaste = {(calculatorLabel: CalculatorLabel) -> () in
            self.copyMode = false
        }
    }
    
    private func drawWithNumber(number: Int) {
        self.clearButton.setTitle(ClearTitle, forState: UIControlState.Normal)
        self.copyMode = false
        self.calculator.joinWithNumber(number)
        self.calculationLabel.text = String(self.calculator.result())
    }
    
    private func drawResult() {
        self.copyMode = false
        
        switch self.calculatorType {
        case .Addition:
            self.calculator.addition(oldCalculator)
            break
            
        case .Subtraction:
            self.calculator.subtraction(oldCalculator)
            break
            
        case .Multiplication:
            self.calculator.multiplication(oldCalculator)
            break
            
        case .Division:
            self.calculator.division(oldCalculator)
            break
        
        default:
            break
        }
        
        self.calculationLabel.text = String(self.calculator.result())
        self.calculatorMode = false
    }
    
    private func drawAdditionWithNumber(number: Double) {
    }
}

