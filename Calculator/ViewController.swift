//
//  ViewController.swift
//  Calculator
//
//  Created by Clerin on 10/12/20.
//  Copyright © 2020 Clerin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var isTypingNumber: Bool = false
    var mathOperator = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0.0   "
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle
        if isTypingNumber {
            displayLabel.text! += number!
        } else {
            displayLabel.text = number!
            isTypingNumber = true
        }
        
    }
    
    
    @IBAction func operatorsPressed(_ sender: UIButton) {
        isTypingNumber = false
        firstNumber = Double(displayLabel.text!)!
        mathOperator = sender.currentTitle!
        displayLabel.text = mathOperator
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        displayLabel.text = "0.0   "
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        
        isTypingNumber = false
        var result: Double = 0
        secondNumber = Double(displayLabel.text!)!
        
        switch mathOperator {
        case "+": result = firstNumber + secondNumber
        displayLabel.text = "\(result)"
        case "-": result = firstNumber - secondNumber
        displayLabel.text = "\(result)"
        case "*": result = firstNumber * secondNumber
        displayLabel.text = "\(result)"
        case "/": result = firstNumber / secondNumber
        displayLabel.text = "\(result)"
        case "%": result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
        displayLabel.text = "\(result)"
        default:
            displayLabel.text = "N/A"
        }
    }
    
    
    @IBAction func negativeNumberPressed(_ sender: UIButton) {
        displayLabel.text = "-\(displayLabel.text!)"
    }
    
}

