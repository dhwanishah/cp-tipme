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
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.init(red: 220, green: 237, blue:200, alpha: 1)
        let showSliderValObj = defaults.object(forKey: "showSlider")
        let showSliderValInt = defaults.integer(forKey: "showSlider")
        let amountEnteredPrevInt = defaults.integer(forKey: "amountEntered")
        if (showSliderValObj == nil) {
            defaults.set(0, forKey: "showSlider")
        }
        if (showSliderValInt == 0) {
            showTipSlider(false)
            print("hide slider")
        } else if (showSliderValInt == 1) {
            showTipSlider(true)
            print("show slider")
        }
        if (amountEnteredPrevInt != 0) {
            amountEnteredTextField.text = String(amountEnteredPrevInt)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        amountEnteredTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let currentAmountEntered = Double(amountEnteredTextField.text!) ?? 0
        defaults.set(currentAmountEntered, forKey: "amountEntered")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onAmountChange(_ sender: AnyObject) {
        if (defaults.integer(forKey: "showSlider") == 0) {
            let tipAmounts = [0.15, 0.18, 0.20]
            let amountEntered = Double(amountEnteredTextField.text!) ?? 0
            let tip = amountEntered * tipAmounts[tipPercentageSelection.selectedSegmentIndex]
            let total = amountEntered + tip
            tipAmountLabel.text = String(format: "$%.2f", tip)
            totalAmountLabel.text = String(format: "$%.2f", total)
        } else if (defaults.integer(forKey: "showSlider") == 1) {
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
    
    func showTipSlider(_ showSlider: Bool) {
        if (showSlider) {
            tipPercentageSelection.isHidden = true
            tipSliderAmountLabel.isHidden = false
            tipAmountSlider.isHidden = false
        } else {
            tipPercentageSelection.isHidden = false
            tipSliderAmountLabel.isHidden = true
            tipAmountSlider.isHidden = true
        }
    }

}

