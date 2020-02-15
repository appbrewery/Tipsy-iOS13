//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var numberOfPeople: Int = 2
    var tip: Double = 0.0
    var total: String = "0.0"
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //show tip selection
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let percentString = sender.currentTitle
        tip = Double(String(percentString!.dropLast()))! / 100.0
        
        //dismiss keyboard
        billTextField.endEditing(true)
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = billTextField.text!
        
        if billText != "" {
            let billTotal = Double(billText)!
            let withTipTotal = billTotal * (1.0 + tip)
            let splitAmount = withTipTotal / Double(numberOfPeople)
            
            total = String(format: "%0.2f", splitAmount)
            
            //load the result view
            self.performSegue(withIdentifier: "calculateSegue", sender: self)
        }
        
        
    }
    //prepare the result view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateSegue" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = total
            destinationVC.tip = tip
            destinationVC.numberOfPeople = numberOfPeople
        }
        
    }
    
    

}

