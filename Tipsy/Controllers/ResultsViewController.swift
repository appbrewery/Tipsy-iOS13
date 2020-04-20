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
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func recalculatePressed(_ sender: Any) {
		
		dismiss(animated: true, completion: nil)
	}
}
