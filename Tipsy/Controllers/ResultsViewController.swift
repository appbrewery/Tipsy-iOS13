//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Peggy Wollenhaupt on 6/23/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var totalString: String?
    var settingsString: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalString
        settingsLabel.text = settingsString
    }
    
    @IBAction func recalculateTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

}
