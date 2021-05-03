//
//  ViewController.swift
//  calculator
//
//  Created by 呂柏鴻 on 2021/4/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculateDisplayLabel: UILabel!
    
    @IBOutlet weak var calculateProcessLabel: UILabel!
    
    lazy var calculator: CalculatorController = CalculatorController();
    
    var calculateDisplay : String = "0"{
        didSet{
            calculateDisplayLabel.text = "\(calculateDisplay)";
        }
    };
    
    var calculateProcess : [String] = []{
        didSet{
            var text: String = "";
            var i = 0
            while i < calculateProcess.count {
                if i+1 < calculateProcess.count && calculateProcess[i+1] == "-/+" {
                    text += "±(\(calculateProcess[i]))"
                    i += 1
                }
                else if i+1 < calculateProcess.count && calculateProcess[i+1] == "%" {
                    text += "\(calculateProcess[i])%"
                    i += 1
                }
                else {
                    text += calculateProcess[i] + " "
                }
                i += 1
            }
            calculateProcessLabel.text = "\(text)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
        
    }

    @IBAction func zeroButton(_ sender: Any) {
        calculator.addSymbol(symbol: "0")
        updateView()
    }
    
    @IBAction func oneButton(_ sender: Any) {
        calculator.addSymbol(symbol: "1")
        updateView()
    }
    
    @IBAction func twoButton(_ sender: Any) {
        calculator.addSymbol(symbol: "2")
        updateView()
    }
    
    @IBAction func threeButton(_ sender: Any) {
        calculator.addSymbol(symbol: "3")
        updateView()
    }
    
    @IBAction func fourButton(_ sender: Any) {
        calculator.addSymbol(symbol: "4")
        updateView()
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        calculator.addSymbol(symbol: "5")
        updateView()
    }
    
    @IBAction func sixButton(_ sender: Any) {
        calculator.addSymbol(symbol: "6")
        updateView()
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        calculator.addSymbol(symbol: "7")
        updateView()
    }
    
    @IBAction func eightButton(_ sender: Any) {
        calculator.addSymbol(symbol: "8")
        updateView()
    }
    
    @IBAction func nineButton(_ sender: Any) {
        calculator.addSymbol(symbol: "9")
        updateView()
    }
    
    @IBAction func dotButton(_ sender: Any) {
        calculator.addSymbol(symbol: ".")
        updateView()
    }
    
    @IBAction func percentButton(_ sender: Any) {
        calculator.addSymbol(symbol: "%")
        updateView()
    }
    
    @IBAction func inverseNumberButton(_ sender: Any) {
        calculator.addSymbol(symbol: "-/+")
        updateView()
    }
    
    @IBAction func plusButton(_ sender: Any) {
        calculator.addSymbol(symbol: "+")
        updateView()
    }
    
    @IBAction func minusButton(_ sender: Any) {
        calculator.addSymbol(symbol: "-")
        updateView()
    }
    
    @IBAction func multipyButton(_ sender: Any) {
        calculator.addSymbol(symbol: "*")
        updateView()
    }
    
    @IBAction func divideButton(_ sender: Any) {
        calculator.addSymbol(symbol: "/")
        updateView()
    }
    
    @IBAction func equalButton(_ sender: Any) {
        calculator.addSymbol(symbol: "=")
        updateView()
    }
    
    @IBAction func allClearButton(_ sender: Any) {
        calculator.addSymbol(symbol: "ac")
        updateView()
    }
    
    func updateView() {
        calculateDisplay = calculator.getResult()
        calculateProcess = calculator.getStack()
    }
}
