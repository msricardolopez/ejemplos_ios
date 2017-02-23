//
//  ViewController.swift
//  BasicNavigation
//
//  Created by Ricardo López on 04/02/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("LOAD VIEW")
        // Hacer el setup de UI a código
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEW DID LOAD")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VIEW WILL APPEAR")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VIEW DID APPEAR")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VIEW WILL DISAPPEAR")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VIEW DID DISAPPEAR")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - User interaction
    
    @IBAction func pushButtonPressed(_ sender: Any) {
        
        let edad = 15
        
        if edad < 18 {
            performSegue(withIdentifier: "ViewControllerTres", sender: self)
        }
        else {
            performSegue(withIdentifier: "ViewControllerCuatro", sender: self)
        }
        
    }
    
    @IBAction func otherButtonPressed(_ sender: Any) {
        
        // Este código hace una instancia de un ViewController que se encuentra en el mismo Storyboard
//        let viewControllerRojo = storyboard!.instantiateViewController(withIdentifier: "ViewControllerRojo")
//        navigationController?.show(viewControllerRojo, sender: self)
        
        
        // Este código hace una instancia de un ViewController que se encuentra en OTRO Storyboard
        let secondStoryboard = UIStoryboard(name: "SecondStoryboard", bundle: nil)
        let darkGrayViewController = secondStoryboard.instantiateViewController(withIdentifier: "DarkGrayViewController")
        navigationController?.show(darkGrayViewController, sender: self)
        
    }

    
    
    
    
    
    
    
    
}

