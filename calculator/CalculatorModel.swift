//
//  CalculatorModel.swift
//  calculator
//
//  Created by 呂柏鴻 on 2021/4/27.
//

import Foundation

class CalculatorModel {
    private var tempResult: NSNumber!
    private var lastSymbol: String!
    private var newSymbol: String!
    private var lastNumber: String!
    private var processStack: [String]!
    init() {
        allClear();
    }
    
    func allClear() {
        tempResult = 0;
        lastSymbol = "";
        lastNumber = "0";
        processStack = [];
    }
    
    func setNumber(number: String) {
        lastNumber = number;
    }
    
    func setSymbol(symbol: String) {
        newSymbol = symbol
    }
    
    func calculateResult() {
        if lastSymbol == "" {
            tempResult = NSNumber(value: Double(lastNumber)!)
        }
        else if lastSymbol == "+" {
            let result = tempResult.doubleValue + Double(lastNumber)!
            tempResult = NSNumber(value: result)
        }
        else if lastSymbol == "-" {
            let result = tempResult.doubleValue - Double(lastNumber)!
            tempResult = NSNumber(value: result)
        }
        else if lastSymbol == "*" {
            let result = tempResult.doubleValue * Double(lastNumber)!
            tempResult = NSNumber(value: result)
        }
        else if lastSymbol == "/" {
            let result = tempResult.doubleValue / Double(lastNumber)!
            tempResult = NSNumber(value: result)
        }
        processStack.append(lastNumber)
        processStack.append(newSymbol)
        lastNumber = "0"
        lastSymbol = newSymbol
    }
    
    func getNumber() -> String {
        return lastNumber
    }
    
    func getSymbol() -> String {
        return lastSymbol
    }
    
    func getStack() -> [String] {
        return processStack;
    }
    
    func getResult() -> NSNumber {
        return tempResult;
    }
    
    func pushLastNumber() {
        processStack.append(lastNumber)
        lastNumber = "0"
    }
    
    func pushLastSymbol() {
        processStack.append(lastSymbol)
        lastSymbol = ""
    }
}
