//
//  ViewController.swift
//  TipMe
//
//  Created by Dhwani Shah on 3/4/17.
//  Copyright © 2017 Dhwani Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var amountEnteredTextField: UITextField!
    @IBOutlet weak var tipPercentageSelection: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onAmountChange(_ sender: AnyObject) {
        let tipAmounts = [0.15, 0.18, 0.20]
        
        let amountEntered = Double(amountEnteredTextField.text!) ?? 0
        let tip = amountEntered * tipAmounts[tipPercentageSelection.selectedSegmentIndex]
        let total = amountEntered + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }

}

