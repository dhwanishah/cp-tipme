//
//  SettingsViewController.swift
//  TipMe
//
//  Created by Dhwani Shah on 3/4/17.
//  Copyright © 2017 Dhwani Shah. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var showTipSlider: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        if (defaults.integer(forKey: "showSlider") == 0) {
            showTipSlider.setOn(false, animated: false)
        } else if (defaults.integer(forKey: "showSlider") == 1) {
            showTipSlider.setOn(true, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showTipSlider(_ sender: Any) {
        if showTipSlider.isOn {
            defaults.set(1, forKey: "showSlider")
            print("on")
        } else if (!showTipSlider.isOn) {
            defaults.set(0, forKey: "showSlider")
            print("off")
        }
    }
}
