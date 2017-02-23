//
//  ViewController.swift
//  KeyboardExample
//
//  Created by Ricardo López on 11/02/17.
//  Copyright © 2017 MobileStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    
    fileprivate var currentTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Nos suscribimos a las notificaciones del teclado
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Nos QUITAMOS de las notificaciones del teclado
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - User interaction
    
    @IBAction func handleTap(_ sender: Any) {
        print("HANDLE TAP")
//        nameTextField.resignFirstResponder()
//        emailTextField.resignFirstResponder()
//        phoneTextField.resignFirstResponder()
//        passwordTextfield.resignFirstResponder()
        currentTextField?.resignFirstResponder()
    }
    
    
    // MARK: - Private methods
    
    fileprivate func validateFields() {
        print("Validamos y enviamos formulario")
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        print("Teclado va a aparecer")
        
        let userInfo = notification.userInfo!
        let keyboardSize = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardFrame = keyboardSize.cgRectValue
        print(keyboardFrame)
        
        let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        
        buttonBottomConstraint.constant = keyboardFrame.height
        
        UIView.animate(withDuration: animationDuration) { 
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        print("Teclado va a desaparecer")
        buttonBottomConstraint.constant = 0
        
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        currentTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneTextField.becomeFirstResponder()
        case phoneTextField:
            passwordTextfield.becomeFirstResponder()
        case passwordTextfield:
            validateFields()
        default:
            print("Nothing to do here :(")
        }
        
        return true
    }

}

























