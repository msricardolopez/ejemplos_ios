//
//  ViewController.swift
//  Calculadora
//
//  Created by Ricardo López on 04/02/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var auxNumber = 0
    private var currentOperation = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        print("Número: \(sender.tag)")
        
        let currentDisplayNumber = displayLabel.text!
        
        if currentDisplayNumber == "0" {
            displayLabel.text = "\(sender.tag)"
        }
        else {
            displayLabel.text = "\(currentDisplayNumber)\(sender.tag)"
        }
        
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        currentOperation = -1
        auxNumber = 0
        displayLabel.text = "0"
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        
        // 0 -> =
        // 1 -> -
        // 2 -> +
        // 3 -> /
        // 4 -> X
        
        let currentDisplayNumber = displayLabel.text!
        
        switch sender.tag {
        case 0:
            print("Mostrar resultado")
            finishOperation(number: Int(currentDisplayNumber)!)
        case 1, 2, 3, 4:
            print("Almacenar variable y la operación")
            auxNumber = Int(currentDisplayNumber)!
            currentOperation = sender.tag
            displayLabel.text = "0"
        default:
            print("Nothing to do here :(")
        }
        
    }
    
    func finishOperation(number: Int) {
        
        var result = 0
        
        switch currentOperation {
        case 1:
            result = auxNumber - number
        case 2:
            result = auxNumber + number
        case 3:
            if number == 0 {
                //Mostramos alerta de división inválida
                let alertController = UIAlertController(title: "Oups!", message: "Aún no descubrimos la divisón entre 0 :(", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                present(alertController, animated: true, completion: nil)
                return
            }
            result = auxNumber / number
        case 4:
            result = auxNumber * number
        default:
            result = 0
        }
        
        displayLabel.text = "\(result)"
        
    }
    
}





