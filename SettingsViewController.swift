//
//  SettingsViewController.swift
//  tipcalc
//
//  Created by Sachin Tyagi on 3/13/17.
//  Copyright © 2017 Sachin Tyagi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tipSegment = defaults.integer(forKey: "tip_percentage_segment")
        tipControl.selectedSegmentIndex = tipSegment;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeTipPercentage(_ sender: Any) {
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tip_percentage_segment")
        defaults.synchronize()
    }
    

}
