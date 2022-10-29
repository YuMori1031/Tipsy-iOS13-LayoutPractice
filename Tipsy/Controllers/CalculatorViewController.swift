//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill = 0.00
    var tip = 0.1
    var people = 2
    var result = "0.0"
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let title = sender.currentTitle!
        let titleNumber = String(title.dropLast())
        let tipNumber = Double(titleNumber)!
        tip = tipNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        billTextField.endEditing(true)
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        people = Int(sender.value)
        
    }
    
    @IBAction func caluculatePressed(_ sender: UIButton) {
        
        if Double(billTextField.text!) != nil {
            bill = Double(billTextField.text!)!
            let cost = (bill * (tip + 1)) / Double(people)
            result = String(format: "%.2f", cost)
        }
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = result
            destinationVC.tip = Int(tip * 100)
            destinationVC.people = people
        }
    }
    
}

