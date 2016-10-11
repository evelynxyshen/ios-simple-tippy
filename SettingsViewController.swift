//
//  SettingsViewController.swift
//  tippy
//
//  Created by Xiaoying Shen on 10/5/16.
//  Copyright © 2016 Xiaoying Shen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var typeSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.init()
        let mealTypeValue = defaults.string(forKey: "mealType")
        typeSelector.selectedSegmentIndex = mealTypeValue == "Lunch" ? 0 : 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func typeChange(_ sender: AnyObject) {
        let mealTypes = ["Lunch", "Dinner"]
        let selectedType = mealTypes[typeSelector.selectedSegmentIndex]
        let defaults = UserDefaults.init()
        defaults.set(selectedType, forKey: "mealType")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
