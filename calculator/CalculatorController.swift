//
//  Calculator.swift
//  calculator
//
//  Created by 呂柏鴻 on 2021/4/26.
//

import Foundation

class CalculatorController {
    
    var calculatorModel: CalculatorModel;
    var isOperator: Bool;
    
    init() {
        calculatorModel = CalculatorModel()
        isOperator = false
    }
    
    func addSymbol(symbol: String) {
        isOperator = false;
        if symbol >= "0" && symbol <= "9" {
            if calculatorModel.getNumber().count <= 13 {
                if calculatorModel.getNumber() == "0" {
                    calculatorModel.setNumber(number: symbol)
                }
                else {
                    let newNumber = calculatorModel.getNumber() + symbol
                    calculatorModel.setNumber(number: newNumber)
                }
            }
        }
        else if symbol == "." {
            if !calculatorModel.getNumber().contains(".") {
                let newNumber = calculatorModel.getNumber() + symbol
                calculatorModel.setNumber(number: newNumber)
            }
        }
        else if ["+", "-", "*", "/"].contains(symbol) {
            isOperator = true
            calculatorModel.setSymbol(symbol: symbol)
            calculatorModel.calculateResult()
            
        }
    }
        
        
        
        
//        var lastElement = calculateStack.last!;
//        if symbol >= "0" && symbol <= "9"{
//            if lastElement.contains(".") {
//                lastElement = calculateStack.popLast()!;
//                lastElement += symbol;
//            }
//            else if Int(lastElement) != nil{
//                let lastNumber = Int(calculateStack.popLast()!)!;
//                lastElement = "\(lastNumber * 10 + Int(symbol)!)";
//            }
//            else{
//                lastElement = symbol
//            }
//        }
//        else if symbol == "."{
//            if lastElement.contains(".") {
//                lastElement = calculateStack.popLast()!;
//            }
//            else if Int(lastElement) != nil{
//                lastElement = calculateStack.popLast()!;
//                lastElement += ".";
//            }
//            else{
//                lastElement = "0.";
//            }
//        }
//        else if symbol == "+"{
//            if Double(calculateStack.last!) != nil{
//                let result = calculateResult.doubleValue + Double(calculateStack.last!)!
//                calculateResult = NSNumber(value: result)
//            }
//            lastElement = symbol
//        }
//        else if symbol == "-"{
//            if Double(calculateStack.last!) != nil{
//                let result = calculateResult.doubleValue - Double(calculateStack.last!)!
//                calculateResult = NSNumber(value: result)
//            }
//            lastElement = symbol
//        }
//        else if symbol == "*"{
//            if Double(calculateStack.last!) != nil{
//                let result = calculateResult.doubleValue * Double(calculateStack.last!)!
//                calculateResult = NSNumber(value: result)
//            }
//            lastElement = symbol
//        }
//        else if symbol == "/"{
//            if Double(calculateStack.last!) != nil{
//                let result = calculateResult.doubleValue / Double(calculateStack.last!)!
//                calculateResult = NSNumber(value: result)
//            }
//            lastElement = symbol
//        }
//        else if symbol == "ac"{
//            calculateStack = ["0"];
//            calculateResult = 0.0
//        }
//        else {
//            lastElement = symbol
//        }
//        calculateStack.append(lastElement)
//    }
    
    func getResult() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 9
//        if calculateStack.last!.contains(".") || Int(calculateStack.last!) != nil{
//            return calculateStack.last!
//        }
//        else{
//            return "\(calculateResult.decimalValue)"
//        }
        if isOperator{
            return "\(calculatorModel.getResult())"
        }
        return "\(calculatorModel.getNumber())"
    }
    func getStack() -> [String] {
        return calculatorModel.getStack();
    }
}
