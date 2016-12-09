//
//  ViewController.swift
//  Calculator
//
//  Created by Jhonny Bill Mena on 10/18/16.
//  Copyright © 2016 Jhonny Bill Mena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var display: UILabel!
    
    
    private var userIsInTheMiddleOfTyping = false
    
    
    //Method to digit buttons
    @IBAction private func touchDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping{
            
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
            
        }else{
            display.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    
    
    
    //
    private var displayValue: Double {
        
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    
    
    private var brain = calculatorBrain();
    
    
    //method to operation buttons
    
    @IBAction private func performOperation(sender: UIButton) {
        
        if(userIsInTheMiddleOfTyping){
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        
        if let mathematicalSymbol = sender.currentTitle {
            
            brain.performOperation(mathematicalSymbol)
            
        }
        displayValue = brain.result
        
    }
    
    
}

