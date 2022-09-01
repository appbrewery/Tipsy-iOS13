//
//  CalculatorViewController.swift
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
    
    var tip: Float = 0
    var split: Float = 0
    var finalresult: String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tip = sender.tag == 1 ? 0.1 : sender.tag == 2 ? 0.2 : 0
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        split = Float(sender.value)
        splitNumberLabel.text = String(format: "%d", Int(sender.value))
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        let bill = billTextField.text!
        var sum: Float = 0
        if let billFloat = Float(bill) {
            sum = billFloat + (tip * billFloat)
        } else {
            print("Cannot convert")
        }
        
        finalresult = String(format: "%.2f", sum/split)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = Int(split)
            destinationVC.result = finalresult
        }
    }
    
}

