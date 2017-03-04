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
    @IBOutlet weak var tipSliderAmountLabel: UILabel!
    @IBOutlet weak var tipAmountSlider: UISlider!
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.init(red: 0, green: 233, blue: 0, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountEnteredTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onAmountChange(_ sender: AnyObject) {
        //let tipAmounts = [0.15, 0.18, 0.20]
        tipAmountSlider.setValue(Float(lroundf(tipAmountSlider.value)), animated: true)
        
        let amountEntered = Double(amountEnteredTextField.text!) ?? 0
        let tipAmount = Double(tipAmountSlider.value / 100)
        //let tip = amountEntered * tipAmounts[tipPercentageSelection.selectedSegmentIndex]
        let tip = amountEntered * tipAmount
        let total = amountEntered + tip
        
        tipSliderAmountLabel.text = String(format: "%.0f%%", tipAmountSlider.value)
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalAmountLabel.text = String(format: "$%.2f", total)
    }

}

