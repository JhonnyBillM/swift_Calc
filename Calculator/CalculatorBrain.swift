//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Jhonny Bill Mena on 10/31/16.
//  Copyright © 2016 Jhonny Bill Mena. All rights reserved.
//

import Foundation

class calculatorBrain{
    
    
    fileprivate var accumulator = 0.0
    
    
    func setOperand(_ operand: Double){
        accumulator = operand
    }
    
    var operations: Dictionary<String, Operation> = [
    
        "π" : Operation.Constant, //M_PI,
        "e" : Operation.Constant, //M_E,
        "√" : Operation.UnaryOperation, //sqrt,
        "cos" : Operation.UnaryOperation //cos
    
    ]
    
    //Enums are to enumerate dvalues. It can have Methods. It cannot have computed var, It cannot have inherit
    enum Operation {
        
        case constant
        case UnaryOperation
        case BinaryOperation
        case Equals
    
    }
    
    func performOperation(_ symbol: String){
        
        if let operation = operations[symbol]{
            //make switch
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
