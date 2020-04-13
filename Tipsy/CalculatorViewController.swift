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
	
	@IBAction func tipChanged(_ sender: UIButton) {
		zeroPctButton.isSelected = false
		tenPctButton.isSelected = false
		twentyPctButton.isSelected = false
		
		// Highlight selected button
		sender.isSelected = true
		
		// Grab button title
		let buttonTitle = sender.currentTitle!
		
		// Remove % sign from the end of button title that was grabbed
		let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
		
		// Change String into Double
		let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
		
		// Turn tip into decimal
		tip = buttonTitleAsANumber / 100
	
	}
	
	@IBAction func stepperValueChanged(_ sender: Any) {
		
	}
	
	@IBAction func calculatePressed(_ sender: Any) {
		print(tip)
	}
}

