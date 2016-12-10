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
    
    private var operations: Dictionary<String, Operation> = [
    
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "±" : Operation.UnaryOperation( { -$0 } ),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "×" : Operation.BinaryOperation( {$0 * $1} ),
        "÷" : Operation.BinaryOperation( {$0 / $1} ),
        "+" : Operation.BinaryOperation( {$0 + $1} ),
        "−" : Operation.BinaryOperation( {$0 - $1} ),
        "=" : Operation.Equals
    
    ]
    
    //Enums are to enumerate dvalues. It can have Methods. It cannot have computed var, It cannot have inherit
    private enum Operation {
        
        case Constant(Double)
        case UnaryOperation( (Double) -> Double)
        case BinaryOperation( (Double, Double) -> Double )
        case Equals
    
    }
    
    func performOperation(_ symbol: String){
        
        if let operation = operations[symbol]{
            //make switch
            
            switch operation {
            case .Constant(let value):
                accumulator = value
                break
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
                break
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
                break
            case .Equals :
                executePendingBinaryOperation()
                break
            }
            
        }
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }

    }
    
    private var pending : PendingBinaryOperationInfo?
    
    private struct PendingBinaryOperationInfo {
        
        var binaryFunction: (Double, Double) -> Double
        var firstOperand : Double
    
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
