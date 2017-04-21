//
//  ViewController.swift
//  Calculator
//
//  Created by Naëva Arnould on 20/04/2017.
//  Copyright © 2017 Naëva Arnould. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
	private var brain = CalculatorBrain()
		
    var userIsTyping = false
    
	override func viewDidLoad() {
		super.viewDidLoad()
		brain.addUnaryOperation(named: "vv") {
			self.display.textColor = UIColor.green
			sqrt($0)
		}
	}
	
    @IBAction func touchDigit (_ sender : UIButton){
        let digit = sender.currentTitle!
        
        if userIsTyping{
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userIsTyping {
            brain.setOperand(displayValue)
            userIsTyping = false
        }
        
        userIsTyping = false
        
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(mathSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }
    
    
    
}

