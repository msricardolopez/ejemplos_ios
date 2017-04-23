//
//  CreateViewController.swift
//  ClosuresExample
//
//  Created by MobileStudioiMac05 on 19/04/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

protocol CreateDelegate {
    func createDelegateDidCreate(itemText: String)
}

class CreateViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    var delegate: CreateDelegate?
    // Declaramos el closure en privado para poder crear el setter, en caso contrario tendríamos que asignar directo y no se ve cool el código
    private var createClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Declaramos nuestra función pública para poder asignar nuestro closure cuando pasemos a esta clase, la palabra reservada '@escaping' nos indica que podemos almacenar el closure en una variable, por default los closures son '@nonescaping' lo que nos indica que el closure sólo se puede usar en el cuerpo de la función a la que se le está pasando
    func setCreateClosure(createClosure: @escaping ((String) -> Void)) {
        self.createClosure = createClosure
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func delegateButtonPressed(_ sender: AnyObject) {
        guard let itemText = nameTextField.text else { return }
        delegate?.createDelegateDidCreate(itemText: itemText)
    }
    
    @IBAction func closureButtonPressed(_ sender: AnyObject) {
        guard let itemText = nameTextField.text else { return }
        // Llamamos el closure, lo que ejecutará nuestro código en la clase donde asignamos el closure, en este caso 'ViewController' y como captura el contexto en dónde se declara, podemos acceder a las variables de esa clase usando el 'self' dentro del closure
        createClosure?(itemText)
    }
}
