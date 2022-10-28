//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var totalValue: String?
    var tipValue: String?
    var splitValue: String?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle == "0%" {
            tipValue = sender.currentTitle
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender.currentTitle == "10%" {
            tipValue = sender.currentTitle
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if sender.currentTitle == "20%" {
            tipValue = sender.currentTitle
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let num = Int(sender.value)
        splitNumberLabel.text = String(num)
        splitValue = splitNumberLabel.text
        
        billTextField.endEditing(true)
    }
    
    @IBAction func caluculatePressed(_ sender: UIButton) {
        let total = Float(billTextField.text!)
        var tip: Float = 1.0
        
        if zeroPctButton.isSelected {
            tip = 1.0
        } else if tenPctButton.isSelected {
            tip = 1.1
        } else if twentyPctButton.isSelected {
            tip = 1.2
        }
        
        let split = Float(splitNumberLabel.text!)
        
        let cost = ((total ?? 0.0) * tip) / split!
        totalValue = String(format: "%.2f", cost)
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalValue = totalValue
            destinationVC.tip = tipValue
            destinationVC.split = splitValue
        }
    }
    
}

