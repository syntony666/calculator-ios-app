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
        print(symbol)
        isOperator = false;
        if symbol >= "0" && symbol <= "9" {
            if calculatorModel.getNumber().count <= 13 {
                if calculatorModel.getNumber() == "0" {
                    calculatorModel.setNumber(number: symbol)
                }
                else if calculatorModel.getStack().last != nil && ["%", "-/+"].contains(calculatorModel.getStack().last!) {
                    calculatorModel.setNumber(number: symbol)
                    calculatorModel.setSymbol(symbol: ",")
                }
                else
                {
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
        else if ["%", "-/+"].contains(symbol) {
            calculatorModel.setSymbol(symbol: symbol)
        }
        else if ["+", "-", "*", "/", "="].contains(symbol) {
            isOperator = true
            calculatorModel.setSymbol(symbol: symbol)
            calculatorModel.calculateResult()
        }
        else if symbol == "ac" {
            calculatorModel.allClear()
        }
    }
    
    func getResult() -> String {
        if isOperator {
            return "\(calculatorModel.getResult())"
        }
        else {
            return "\(calculatorModel.getNumber())"
        }
    }
    
    func getStack() -> [String] {
        if calculatorModel.getSymbol() == "="{
            return calculatorModel.getStack();
        }
        else {
            return[""]
        }
    }
}
