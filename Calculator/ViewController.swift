//
//  ViewController.swift
//  Calculator
//
//  Created by Juan Daniel Ozuna Espinal on 4/17/19.
//  Copyright © 2019 Juan Daniel Ozuna Espinal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var laNumberShow: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var newOperation = true
    private func addNumberToInput(number:String){
        var textNumber = String(laNumberShow.text!)
        if newOperation {
            newOperation = false
            textNumber = ""
        }
        textNumber = textNumber + number
        laNumberShow.text = textNumber
    }
    
    
    @IBAction func btnDot(_ sender: Any) {
        addNumberToInput(number: ".")
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        let content = sender.titleLabel!.text!
        addNumberToInput(number: content)
    }
    
    @IBAction func btnAcPressed(_ sender: Any) {
        newOperation = true
        laNumberShow.text = "0"
    }
    
    var op = "+"
    var number1: Double?
    private func setOperation(operation: String){
        op = operation
        number1 = Double(laNumberShow.text!)
        newOperation = true
    }
    
    @IBAction func btnMultiply(_ sender: Any) {
        setOperation(operation: "*")
    }
    
    @IBAction func btnDivide(_ sender: Any) {
        setOperation(operation: "/")
    }
    
    @IBAction func btnSubtract(_ sender: Any) {
        setOperation(operation: "-")
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        setOperation(operation: "+")
    }
    
    @IBAction func btnEqual(_ sender: Any) {
        let number2 = Double(laNumberShow.text!)
        var results: Double?
        switch op {
        case "*":
            results = number1! * number2!
        case "/":
            results = number1! / number2!
        case "+":
            results = number1! + number2!
        case "-":
            results = number1! - number2!
        default:
            results = 0.0
        }
        laNumberShow.text = String(results!)
        newOperation = true

    }
    
    @IBAction func btnNegative(_ sender: Any) {
        var curr = laNumberShow.text!
        if curr.contains("-") {
            laNumberShow.text = curr.replacingOccurrences(of: "-", with: "")
        }else{
            curr = "-" + curr
            laNumberShow.text = curr
        }
    }
    @IBAction func btnPercent(_ sender: Any) {
        var num = Double(laNumberShow.text!)
        num = num!/100
        laNumberShow.text = String(num!)
        newOperation = true
    }
}

