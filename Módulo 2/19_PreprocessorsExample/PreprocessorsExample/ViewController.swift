//
//  ViewController.swift
//  PreprocessorsExample
//
//  Created by Ricardo López on 19/05/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        #if SANDBOX
            view.backgroundColor = .orange
        #else
            view.backgroundColor = .green
        #endif

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

