//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jhonny Bill Mena on 10/31/16.
//  Copyright © 2016 Jhonny Bill Mena. All rights reserved.
//

import Foundation

class calculatorBrain{
    
    
    private var accumulator = 0.0
    
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    
    func performOperation(symbol: String){
        
        switch symbol {
            
        case "π": accumulator = M_PI
        case "√": accumulator = sqrt(accumulator)
        default: break
            
        }
        
    }
    
    /*
     I'm doing this var computable to
     only "get" results, because I already do
     the "set" part
     */
    var result: Double {
        get{
            return accumulator
        }
    }
    
}