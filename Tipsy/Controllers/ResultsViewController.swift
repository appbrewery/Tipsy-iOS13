//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Alex Rumer on 2/11/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var total: String?
    var tip: Double?
    var numberOfPeople: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total ?? "0.0"
        settingsLabel.text = ("Split between \(numberOfPeople ?? 2) people, with \(String(format: "%0.0f", (tip ?? 0) * 100))% tip.")

    }
    
    //dimiss
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
