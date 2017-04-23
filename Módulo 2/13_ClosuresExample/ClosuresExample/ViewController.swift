//
//  ViewController.swift
//  ClosuresExample
//
//  Created by MobileStudioiMac05 on 19/04/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var dataSource: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        // Closure simple, es como una función pero sin la declaración del nombre de la función, sólo se pone lo que va entre llaves '{ }'
        let simpleClosure = {
            print("Hello world Swift Closures")
        }
        simpleClosure()
        
        // '() -> Void' es el 'tipo de dato' que en este caso significa que es un closure que no recibe parámetros y no regresa nada
        let simpleClosureWithDefinition: () -> Void = {
            print("Hello world Swift Closures with definition")
        }
        simpleClosureWithDefinition()
        
        // Aquí pasamos parámetros al closure '(numA: Int, numB: Int) in' y no regresamos nada lo que nos llevaría a poner un 'tipo de dato' de la siguiente forma 'let closureWithParameters: ((Int, Int) -> Void)
        let closureWithParameters = { (numA: Int, numB: Int) in
            let sum = numA + numB
            print("Suma en closure: \(sum)")
        }
        closureWithParameters(4, 10)
        
        // Al igual que en ejemplo anterior pasamos parámetros al closure pero en este caso regresamos un Int que puede ser asignado a una variable; esto nos llevaría a poner un 'tipo de dato' de la siguiente forma 'let closureWithParametersAndReturn: ((Int, Int) -> Int)
        let closureWithParametersAndReturn = { (numA: Int, numB: Int) -> Int in
            let sum = numA + numB
            return sum
        }
        let sum = closureWithParametersAndReturn(14, 5)
        print("Mi suma: \(sum)")
        */
        
        dataSource.append("Primer item")
        dataSource.append("Segundo item")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CreateViewController" {
            // Delegate
            /*
            let createViewController = segue.destination as! CreateViewController
            createViewController.delegate = self
            */
            // Closure
            // En vez de tener un método que va a ser llamado por el delegate, tenemos un closure que recibirá el parámetro 'itemText' y ejecutamos el mismo código del método del delegate pero lo pasamos como parámetro a nuestro 'createViewController'
            let createViewController = segue.destination as! CreateViewController
            createViewController.setCreateClosure(createClosure: { (itemText: String) in
                _ = self.navigationController?.popViewController(animated: true)
                self.dataSource.append(itemText)
                let indexPath = IndexPath(row: self.dataSource.count - 1, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            })
        }
    }


}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell")!
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CreateDelegate

extension ViewController: CreateDelegate {

    func createDelegateDidCreate(itemText: String) {
        _ = navigationController?.popViewController(animated: true)
        dataSource.append(itemText)
        let indexPath = IndexPath(row: dataSource.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}











