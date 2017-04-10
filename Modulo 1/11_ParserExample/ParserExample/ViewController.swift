//
//  ViewController.swift
//  ParserExample
//
//  Created by Ricardo López on 18/03/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let jsonURL = "https://www.mobilestudio.mx/iphone/parser/books.json"
        
        Alamofire.request(jsonURL).responseJSON { (response) in
            print(response.result.value)
//            parserJSON(response.result.value)
        }
        
//        Alamofire.request(jsonURL).responseJSON { (response) in
//            
//            print(response.result.value)
//            
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}









