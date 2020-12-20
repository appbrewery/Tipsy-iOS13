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
    
    var tipSelectedDecimal: Double = 0.10
    var numberOfPeople: Int = 2
    var result2Decimals: String = ""
    
    
 
    @IBAction func tipChanged(_ sender: UIButton) {
        //Dismiss keyboard
        billTextField.endEditing(true)
        
        let tipAmountString = sender.currentTitle!
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        zeroPctButton.isSelected = false
        
        sender.isSelected = true
    
       
        tipSelectedDecimal = Double(tipAmountString.replacingOccurrences(of: "%", with: ""))! / 100
        
        // Another way to do it:
        // String(tipAmountString.dropLast())
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(Int(sender.value))
        // Another wayt to do it:
       // splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        print("Calculate the following:")
        print(tipSelectedDecimal)
        print(numberOfPeople)
        print(billTextField.text!)
        
        let bill = billTextField.text!
        
        if bill != "" {
            let billTotal = Double(bill)!
            
            let result = billTotal * (1 + tipSelectedDecimal) / Double(numberOfPeople)
                        
            result2Decimals = String(format: "%.2f", result)
            
            print(result2Decimals)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let resultsVC = segue.destination as! ResultsViewController
        
        if segue.identifier == "goToResults" {
            resultsVC.splitTotal = result2Decimals
            resultsVC.settingsText = "Split between \(numberOfPeople) with \(tipSelectedDecimal*100)% tip"
            
        }
    }
    
}

