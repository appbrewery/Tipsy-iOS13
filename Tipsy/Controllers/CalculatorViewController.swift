//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip = 0.10
    var patrons = 1
    var bill = 0.0
    var total = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var fifteenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        tenPctButton.isSelected = false
        fifteenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        billTextField.endEditing(true)
        
        if let buttonTitle = sender.currentTitle {
            let percentString = String(buttonTitle.dropLast())
            if let percentNumber = Double(percentString) {
                tip = percentNumber / 100
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        patrons = Int(sender.value)
        splitNumberLabel.text = String(patrons)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let userText = billTextField.text {
            bill = Double(userText) ?? 0.0
            total = (bill + (bill * tip)) / Double(patrons)
            print (String(format: "%.2f", total))
        }
    }
    
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "resultsSegue" {
            guard let resultsVC = segue.destination as? ResultsViewController else { return }
            resultsVC.totalString = String(format: "%.2f", total)
            resultsVC.settingsString = "Split between \(patrons) people, with \(Int(tip * 100))% tip."
        }

    }

    
}

