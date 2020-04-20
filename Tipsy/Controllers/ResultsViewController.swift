//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tam Phan on 3/17/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var settingsLabel: UILabel!
	
	var billTotalIncludingTip: String?
	var numberOfPeopleResult: String?
	var percentTipResult: String?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Test -- If nil, print PooP
		totalLabel.text = billTotalIncludingTip ?? "PooP"
		settingsLabel.text = "Split between \(numberOfPeopleResult!) people, with \(percentTipResult!) tip."
	}
	
	@IBAction func recalculatePressed(_ sender: Any) {
		
		dismiss(animated: true, completion: nil)
	}
}
