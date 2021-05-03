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
    
    func setNumber(number: String) {
        lastNumber = number;
        if lastSymbol == "=" {
            processStack = []
        }
    }
    
    func setSymbol(symbol: String) {
        if ["%", "-/+"].contains(symbol){
            processStack.append(lastNumber)
            if symbol == "%" {
                lastNumber = "\(Double(lastNumber)! * 0.01)"
            }
            if symbol == "-/+" {
                lastNumber = "\(Double(lastNumber)! * -1)"
            }
            processStack.append(symbol)
        }
        else {
           newSymbol = symbol
        }
        if processStack.count != 0 && processStack.last! == "=" {
            lastNumber = tempResult.stringValue
            processStack = []
        }
    }
    
    func calculateResult() {
        var result: Double = 0.0
        if lastSymbol == "" {
            result = Double(lastNumber)!
        }
        else if lastSymbol == "+" {
            result = tempResult.doubleValue + Double(lastNumber)!
        }
        else if lastSymbol == "-" {
            result = tempResult.doubleValue - Double(lastNumber)!
        }
        else if lastSymbol == "*" {
            result = tempResult.doubleValue * Double(lastNumber)!
        }
        else if lastSymbol == "/" {
            if Double(lastNumber)! == 0 {
                result = 0
            }
            else {
                result = tempResult.doubleValue / Double(lastNumber)!
            }
        }
        else if lastSymbol == "=" {
            result = Double(lastNumber)!
        }
        
        if !(processStack.count != 0 && ["%", "-/+"].contains(processStack.last!)) {
            processStack.append(NSNumber(value: Double(lastNumber)!).stringValue)
        }
        tempResult = NSNumber(value: result)
        processStack.append(newSymbol)
        lastNumber = "0"
        lastSymbol = newSymbol
        print(lastNumber!, lastSymbol!, processStack!)
    }
    
    func allClear() {
        tempResult = 0;
        lastSymbol = "";
        lastNumber = "0";
        processStack = [];
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
}
