//
//  ViewController.swift
//  tipcalc
//
//  Created by Sachin Tyagi on 3/3/17.
//  Copyright © 2017 Sachin Tyagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalPerson: UITextField!
    @IBOutlet weak var sharePerPerson: UILabel!
    
    let tipPercente = [0.15, 0.2, 0.25, 0.3]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        let tipSegment = defaults.integer(forKey: "tip_percentage_segment")
        tipControl.selectedSegmentIndex = tipSegment;
        changeTipPercentage(Any.self)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func changeShare(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0

        let tip = bill * tipPercente[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        var noOfPerson = Double(totalPerson.text!) ?? 1
        if(noOfPerson < 1){
            noOfPerson = 1
        }
        
        let share = total/noOfPerson
        
        sharePerPerson.text = String(format: "$%.2f", share)
    }
    @IBAction func changeTipPercentage(_ sender: Any) {
        defaults.set(tipControl.selectedSegmentIndex, forKey: "tip_percentage_segment")
        defaults.synchronize()
        
        calculateTip(Any.self)
        changeShare(Any.self)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmount.text!) ?? 0
        
        let tipSegment = defaults.integer(forKey: "tip_percentage_segment")
        
        //let tip = bill * tipPercente[tipControl.selectedSegmentIndex]
        let tip = bill * tipPercente[tipSegment]
        let total = bill + tip
        
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        changeShare(Any.self)
    }

}

