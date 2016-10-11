//
//  ViewController.swift
//  tippy
//
//  Created by Xiaoying Shen on 10/5/16.
//  Copyright © 2016 Xiaoying Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitNumLabel: UILabel!

    static var totalValue: Double!
    
    func updateTipControlTitle() {
        let defaults = UserDefaults.init()
        let mealTypeValue = defaults.string(forKey: "mealType")
        print(mealTypeValue)
        if (mealTypeValue == "Lunch") {
            tipControl.setTitle("15%", forSegmentAt: 0)
            tipControl.setTitle("18%", forSegmentAt: 1)
            tipControl.setTitle("20%", forSegmentAt: 2)
        } else {
            tipControl.setTitle("18%", forSegmentAt: 0)
            tipControl.setTitle("20%", forSegmentAt: 1)
            tipControl.setTitle("25%", forSegmentAt: 2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTipControlTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func splitNumChanged(_ sender: AnyObject) {
        let splitNumber = Double(floor(splitSlider.value))
        splitNumLabel.text = String(format: "%.0f", splitNumber)
        let splitAmount = ViewController.totalValue / splitNumber
        splitLabel.text = String(format: "$%.2f", splitAmount)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults = UserDefaults.init()
        let mealTypeValue = defaults.string(forKey: "mealType")
        
        let tipPercentages = (mealTypeValue == "Dinner") ? [0.18, 0.2, 0.25] : [0.15, 0.18, 0.2]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        ViewController.totalValue = total
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
     }
}

