//
//  ConfigurationViewController.swift
//  TodoListExample
//
//  Created by Ricardo López on 04/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {

    @IBOutlet weak var detailSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let isDetailActive = UserDefaults.standard.bool(forKey: "DETAIL_ACTIVE")
        detailSwitch.setOn(isDetailActive, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - User interaction
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        UserDefaults.standard.setValue(sender.isOn, forKey: "DETAIL_ACTIVE")
        UserDefaults.standard.synchronize()
    }
}
