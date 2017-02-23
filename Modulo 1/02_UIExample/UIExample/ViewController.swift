//
//  ViewController.swift
//  UIExample
//
//  Created by Ricardo López on 28/01/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        titleLabel.text = "Cambiando desde código :)"
        titleLabel.textColor = UIColor.blue
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - User interaction
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        print("Presionamos botón izquierdo")
        titleLabel.textAlignment = .left
        
        miFuncion(numA: 4)
        miFuncionDos(2)
    }
    
    func miFuncion(numA: Int) {
        print(numA)
    }

    func miFuncionDos(_ numA: Int) {
        print(numA)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        print(sender.value)
        //imageView.alpha = CGFloat(sender.value)
        imageView.alpha = CGFloat(sender.value)
        
    }
    
    
}

