//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Yusuke Mori on 2022/10/28.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalValue: String?
    var tip: String?
    var split: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(split!) people, with \(tip!) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
