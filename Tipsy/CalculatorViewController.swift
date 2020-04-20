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

	var tip = 0.10
	var numberOfPeople: Int = 2
	var numberOfPeopleAsString: String = ""
	var billTotal = 0.0
	var resultTo2DecimalPlace: String = ""
	var buttonTitle: String = ""
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
	
	
	@IBAction func tipChanged(_ sender: UIButton) {
		zeroPctButton.isSelected = false
		tenPctButton.isSelected = false
		twentyPctButton.isSelected = false
		
		// Highlight selected button.
		sender.isSelected = true
		
		// Grab button title.
		buttonTitle = sender.currentTitle!
		
		// Remove % sign from the end of button title that was grabbed.
		let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
		
		// Change String into Double.
		let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
		
		// Turn tip into decimal.
		tip = buttonTitleAsANumber / 100
	
	}
	
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		
		// Update var splitValue to label.
		numberOfPeopleAsString = String(sender.value)
		numberOfPeople = Int(sender.value)
		
		// Update bill split number label.
		splitNumberLabel.text = String(numberOfPeople)
		
	}
	
	@IBAction func calculatePressed(_ sender: UIButton) {
		
		// Storing user inputted string from billTextField into a new constant.
		let bill = billTextField.text!
		
		// If the text is not an empty string.
		if bill != "" {
			
			// Convert string to double.
			billTotal = Double(bill)!
			
			// Calculate amount including tip, split between number of people.
			let result = billTotal * (1 + tip) / Double(numberOfPeople)
			
			// Convert double to string and format to 2 decimal places
			resultTo2DecimalPlace = String(format: "%.2f", result)
			
		}
		
		//JUSTIN
		performSegue(withIdentifier: "resultsSegue", sender: nil)
	}
	
		//JUSTIN
		override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			if segue.identifier == "resultsSegue" {
				
				// Pass the values to ResultsViewController via Segue
				let destinationVC = segue.destination as! ResultsViewController
				print(self.resultTo2DecimalPlace)
				destinationVC.billTotalIncludingTip = self.resultTo2DecimalPlace
				destinationVC.numberOfPeopleResult = numberOfPeopleAsString
				destinationVC.percentTipResult = buttonTitle
		}
	}
		
}

