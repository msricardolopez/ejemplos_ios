//
//  ViewController.swift
//  PushNotificationsExample
//
//  Created by Ricardo López on 19/05/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI(notification:)), name: NSNotification.Name(rawValue: "UPDATE_UI"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func updateUI(notification: Notification) {
        if let message = notification.object as? String {
            messageLabel.text = message
        }
    }

}

